%%%-------------------------------------------------------------------
%%% @author adiog
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Dec 2016 10:37 PM
%%%-------------------------------------------------------------------
-module(dependency_factory_test).
-include_lib("eunit/include/eunit.hrl").
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% API
-import(dependency_factory, [get_item_table/0]).

get_item_table_test() ->
    ?assertEqual(apply(get_item_table(), dummy, []), blabla).

