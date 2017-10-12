-module(demo_test).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% TEST
-include_lib("eunit/include/eunit.hrl").


-import(demo, [sender/0]).


sender_test() ->
    ?assertEqual(sender(), 42).

