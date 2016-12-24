% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(item_table).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% API
-export([start/0, close/1, create/2, retrieve/1, retrieve/2, update/3, delete/2]).


-include("engine_bom_item.hrl").


start() ->
    not_implemented_error.

close(Transaction) ->
    not_implemented_error.

create(Transaction, Item) ->
    not_implemented_error.

retrieve(Transaction) ->
    not_implemented_error.

retrieve(Transaction, ItemId) ->
    not_implemented_error.

update(Transaction, ItemId, Item) ->
    not_implemented_error.

delete(Transaction, ItemId) ->
    not_implemented_error.

