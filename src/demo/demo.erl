%%%-------------------------------------------------------------------
%%% @author adiog
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Jan 2017 9:09 AM
%%%-------------------------------------------------------------------
-module(demo).
-author("adiog").

%% API
-export([sender/0, receiver/0]).


receiver() ->
    receive
        {Pid, Int} -> Pid ! Int + 1;
        terminate -> ok
    end.

sender() ->
    Pid = spawn(?MODULE, receiver, []),
    Pid ! {self(), 41},
    Res = receive
        Int -> Int
    end,
    Pid ! terminate,
    Res.


