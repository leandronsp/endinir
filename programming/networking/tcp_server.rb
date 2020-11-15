require 'socket'

# opens a new Socket (channel) on the port 2000, using the TCP protocol
socket = TCPServer.new(2000)

puts 'Listening to the port 2000...'

# loop forever listening to all connections through the opened socket
while connection = socket.accept
  # sends a message to the connection
  connection.puts 'Hello from the Server!'
  # closes the connection with the client
  connection.close
end
