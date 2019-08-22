require 'socket'

# opens a new Socket (channel) on the port 2000, using the TCP protocol
socket = TCPServer.new(2000)

puts 'Listening to the port 2000...'

# loop forever listening to all connections through the opened socket
while client = socket.accept
  # starting the HTTP ceremony (boring :S)
  # waiting for the client to send the first message of the ceremony
  while line = client.gets
  	puts line
		break if line == "\r\n"
	end

  # sends messages to the connection
  client.print "HTTP/1.1 200\r\n"
  client.print "Content-Type: text/html\r\n"
  client.print "\r\n"
  client.print "<b>Hello from the Server!</b>" # our Hypermedia content (HTML)

  # closes the connection with the client
  client.close
end
