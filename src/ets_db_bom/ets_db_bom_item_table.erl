% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(ets_db_bom_item_table).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% API
-export([start/0, close/1, create/2, retrieve/1, retrieve/2, update/3, delete/2]).


-include("engine_bom_item.hrl").


get_table_name() -> ets_db_bom_item_table_name.

start() -> ets:new(get_table_name(), [ordered_set, named_table]).
close(Transaction) -> ets:delete(Transaction).

do_get_item_id('$end_of_table') -> 1;
do_get_item_id(Key) -> Key + 1.
get_item_id(Transaction) -> do_get_item_id(ets:last(Transaction)).

create(Transaction, Item) ->
    ItemId = get_item_id(Transaction),
    ets:insert(Transaction, {ItemId, Item#item{item_id=ItemId}}),
    ItemId.

retrieve(Transaction, ItemId) ->
    ets:lookup(Transaction, ItemId).

retrieve(Transaction) -> ets:tab2list(Transaction).

update(Transaction, ItemId, Item) ->
    ets:insert(Transaction, {ItemId, Item#item{item_id=ItemId}}).

delete(Transaction, ItemId) ->
    ets:delete(Transaction, ItemId).

