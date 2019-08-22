require 'socket'

# connects to the Socket (channel) on the port 2000, using the TCP protocol
# if the socket is not opened, it will raise a connection refused error
socket = TCPSocket.new('localhost', 2000)

# sends a message to the socket like
# "Hey Server, I'm going to start a HTTP ceremony"
socket.puts "GET / HTTP/1.1\r\n"
socket.puts "\r\n"

# reads all the information from the socket
while line = socket.gets
  puts line
end

# releases the connection
socket.close
