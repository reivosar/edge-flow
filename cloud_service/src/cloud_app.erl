-module(cloud_app).
-export([start/0, loop/1, handle_connection/1]).

start() ->
    {ok, Listen} = gen_tcp:listen(8080, [binary, {packet, 0}, {active, false}, {reuseaddr, true}]),
    io:format("Listening on port 8080~n"),
    loop(Listen).

loop(Listen) ->
    {ok, Sock} = gen_tcp:accept(Listen),
    spawn(fun() -> handle_connection(Sock) end),
    loop(Listen).

handle_connection(Sock) ->
    {ok, Data} = gen_tcp:recv(Sock, 0),
    io:format("Received data from edge: ~p~n", [Data]),
    gen_tcp:close(Sock).
