% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(erlang_db_bom_item_table).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% API
-export([start/0, close/1, get_table_name/0, create/2, retrieve/1, retrieve/2, update/3, delete/2]).


-include("engine_bom_item.hrl").
-import(dependency_factory, [get_item_table/0]).


start() ->
    apply(get_item_table(), start, []).

close(Transaction) ->
    apply(get_item_table(), close, [Transaction]).

get_table_name() ->
    apply(get_item_table(), get_table_name, []).

create(Transaction, Item) ->
    apply(get_item_table(), create, [Transaction, Item]).

retrieve(Transaction) ->
    apply(get_item_table(), retrieve, [Transaction]).

retrieve(Transaction, ItemId) ->
    apply(get_item_table(), retrieve, [Transaction, ItemId]).

update(Transaction, ItemId, Item) ->
    apply(get_item_table(), update, [Transaction, ItemId, Item]).

delete(Transaction, ItemId) ->
    apply(get_item_table(), delete, [Transaction, ItemId]).

