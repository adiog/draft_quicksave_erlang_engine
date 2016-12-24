%%%-------------------------------------------------------------------
%%% @author adiog
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Dec 2016 2:08 AM
%%%-------------------------------------------------------------------
-module(engine_bom_item_test).
-include_lib("eunit/include/eunit.hrl").
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

-include("engine_bom_item.hrl").

mandatory_fields_test() ->
    Item = #item{freetext="Abc"},
    ?assertEqual(Item#item.freetext, "Abc").
