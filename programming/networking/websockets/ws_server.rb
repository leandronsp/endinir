require 'socket'
require 'digest'

# opens a new Socket (channel) on the port 2000, using the TCP protocol
socket = TCPServer.new(2000)

puts 'Listening to the port 2000...'

# loop forever listening to all connections through the opened socket
while client = socket.accept
  # starting the HTTP ceremony (boring :S)
  # waiting for the client to send the first message of the ceremony
  while line = client.gets
    puts line

    # if there is a Sec-WebSocket-Key request header, then the clients wants to
    # upgrade to Websocket protocol
    if matches_handshake = line.match(/^Sec-WebSocket-Key: (\S+)/)
      websocket_key = matches_handshake[1]
      response_key = Digest::SHA1.base64digest([websocket_key, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"].join)
    end

		break if line == "\r\n"
  end

  # sends messages to the connection
  client.print "HTTP/1.1 101 Switching Protocols\r\n"
  client.print "Upgrade: websocket\r\n"
  client.print "Connection: Upgrade\r\n"
  client.print "Sec-WebSocket-Accept: #{response_key}\r\n" # send the response key generated to the cient
  client.print "\r\n"

  # finish handshake
  puts 'Handshake completed'

  first_byte = client.getbyte
  fin = first_byte & 0b10000000
  opcode = first_byte & 0b00001111

  raise "We don't support continuations" unless fin
  raise "We only support opcode 1" unless opcode == 1

  second_byte = client.getbyte
  is_masked = second_byte & 0b10000000
  payload_size = second_byte & 0b01111111

  raise "All incoming frames should be masked according to the websocket spec" unless is_masked
  raise "We only support payloads < 126 bytes in length" unless payload_size < 126

  mask = 4.times.map { client.getbyte }
  data = payload_size.times.map { client.getbyte }
  unmasked_data = data.each_with_index.map { |byte, i| byte ^ mask[i % 4] }

  puts "Client sent the message: #{unmasked_data.pack('C*').force_encoding('utf-8').inspect}"

  response = 'Hello from the Server!'

  output = [0b10000001, response.size, response]
  client.print output.pack("CCA#{ response.size }")

  # closes the connection with the client
  client.close
end
