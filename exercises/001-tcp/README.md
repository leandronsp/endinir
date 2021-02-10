# 001 - TCP

If you want to understand a bit more on networking, [read this](https://github.com/leandronsp/endinir/wiki/Networking). 

## Exercise

Write two Ruby scripts, the first one called `tcp_server.rb` and the second one called `tcp_client.rb`

### Exercise verification

1) Run `ruby tcp_server.rb`. The server should output "Listening to the port 4200..."
2) Open another window and run `ruby tcp_client.rb`.
The client should output:
```
Client is going to request: Hey Server!
Server responded: Hey Client!
```
The server should output:
```
Client requested: Hey Server!
Server is going to respond: Hey Client!
```
3) The client should be closed (exited).
4) The server should be closed (exited).
