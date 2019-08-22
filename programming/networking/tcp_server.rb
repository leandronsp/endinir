require 'socket'

# opens a new Socket (channel) on the port 2000, using the TCP protocol
socket = TCPServer.new(2000)

puts 'Listening to the port 2000...'

# loop forever listening to all connections through the opened socket
while client = socket.accept
  # sends a message to the connection
  client.puts 'Hello from the Server!'
  # closes the connection with the client
  client.close
end
