% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(item_table).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% API
-export([create/2]).
-include("engine_bom_item.hrl").


create(Transaction, Item) ->
    io:format("~p --- ~p --- ~p~n", [Item, record_info(fields, item), record_info(size, item)]).

