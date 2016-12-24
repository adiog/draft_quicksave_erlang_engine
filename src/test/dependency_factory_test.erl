% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(dependency_factory_test).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% TEST
-include_lib("eunit/include/eunit.hrl").


-import(dependency_factory, [get_item_table/0]).


get_item_table_test() ->
    ?assertEqual(get_item_table(), ets_db_bom_item_table).

