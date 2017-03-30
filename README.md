# Introduccion to Phoenix Channels

## Topics
* Different communication techniques on the web
* WebSockets
* Elixir Channels
* Deploy


These are some of the different ways to communicate on the web:
* **AJAX** .- ```request``` → ```response```. Creates a connection to the server, sends request headers with optional data, gets a response from the server, and closes the connection. Supported in all major browsers.

* **Long poll** .- ```request``` → ```wait``` → ```response```. Creates a connection to the server like AJAX does, but maintains a keep-alive connection open for some time (not long though). During connection, the open client can receive data from the server. The client has to reconnect periodically after the connection is closed, due to timeouts or data eof. On server side it is still treated like an HTTP request, same as AJAX, except the answer on request will happen now or some time in the future, defined by the application logic.

* **WebSockets** .- ```client``` ↔ ```server```. Create a TCP connection to the server, and keep it open as long as needed. The server or client can easily close the connection. The client goes through an HTTP compatible handshake process. If it succeeds, then the server and client can exchange data in both directions at any time. It is efficient if the application requires frequent data exchange in both ways. WebSockets do have data framing that includes masking for each message sent from client to server, so data is simply encrypted.

* **webRTC** .- ```peer``` ↔ ```peer``` Transport to establish communication between clients (browser to browser).


## Phoenix Framework

Phoenix is an awesome framework for Elixir language, it was made by Chris Mccord (and all the elixir community).

Phoenix has something really cool called channels, that is a layer made in order to have real time communication in our apps. Channels uses WebSockets but we can define what kind of adaptors we want to use (WebSockets, Long poll, Custom adaptors).

## Channels

Channels are similar to controllers, but channels events can go both directions, and connections are persist beyond a single request/response cycle and they are based solely on sending and
receiving messages.

## How do Channels Differ?

Why Channels are so important if it suppose that Elixir can communicate with other processes by sending them messages too? Well, the problem with that is that you can only send messages to one peer, with channels you can broadcast a message to all the clients subscribed to your ```topic```.

Another cool thing is that we can communicate with phoenix channels through other libraries, not neccesary an Elixir library, it can be for iOS, Android, C# or even Arduino.


# Socket

A socket is compose by different layers:

* Socket Handlers
* Channel Routes
* Channels
* Messages
* Transports
* Client libraries

## Socket Handlers

There are modules that authenticate and identify a socket connection and allow you to set default socket assigns for use in all channels.

## Channel Routes

They match on the topic string and dispatch matching requests to the given Channel module.

## Channels

Thes modules implement different functions in order to manage all the events, a channel module should implements these functions:

* join/3 -> triggered whenever a socket connects to the app.
* terminate/2 -> triggered whenever a socket is disconnected.
* handle_in/3 -> this function is made for matching an event.
* handle_out/3 -> this function is fired whenever we want to intercept an event.

## Message

The messages sent through channels have this Information:

* ***topic***
* ***event***
* ***playload***

## Transport

This layer handles all the message dispatching into and out of the Channel.

## Client Libraries

Phoenix currently ships with its own JavaScript client but we could use any client library.

## CODE CODE!

#### Install Phoenix
`mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez`

#### Create a new Phoenix app

`mix phoenix.new appname`

#### Install dependencies manually
`mix deps.get` - Install elixir dependencies

`npm install` - Install node dependencies

#### Run Phoenix server
`mix phoenix.sever`
