require 'socket'

# opens a new Socket (channel) on the port 2000, using the TCP protocol
socket = TCPServer.new(2000)

puts 'Listening to the port 2000...'

# loop forever listening to all connections through the opened socket
while connection = socket.accept
  # starting the HTTP ceremony (boring :S)
  # waiting for the client to send the first message of the ceremony
  while line = connection.gets
  	puts line
		break if line == "\r\n"
	end

  # sends messages to the connection
  connection.print "HTTP/1.1 200\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print "<b>Hello from the Server!</b>" # our Hypermedia content (HTML)

  # closes the connection with the client
  connection.close
end
