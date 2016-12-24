% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(ets_db_bom_item_table_test).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% TEST
-include_lib("eunit/include/eunit.hrl").


-include("engine_bom_item.hrl").
-import(ets_db_bom_item_table, [start/0, close/1, create/2, delete/2, update/3, retrieve/2]).


test_setup() -> start().

test_teardown(Transaction) -> close(Transaction).

test_fixture(TestedFunction) ->
    Transaction = test_setup(),
    TestedFunction(Transaction),
    test_teardown(Transaction).

create_retrieve(Transaction) ->
    Item = #item{freetext=tested_atom},
    ItemId = create(Transaction, Item),
    [{_, RetrievedItem}] = retrieve(Transaction, ItemId),
    ?assertEqual(RetrievedItem#item.freetext, tested_atom).

create_update(Transaction) ->
    Item = #item{freetext=tested_atom},
    ItemId = create(Transaction, Item),
    update(Transaction, ItemId, Item#item{freetext=updated_atom}),
    [{_, RetrievedItem}] = retrieve(Transaction, ItemId),
    ?assertEqual(RetrievedItem#item.freetext, updated_atom).

create_delete(Transaction) ->
    Item = #item{freetext=tested_atom},
    ItemId = create(Transaction, Item),
    delete(Transaction, ItemId),
    RetrievedItems = retrieve(Transaction, ItemId),
    ?assertEqual(RetrievedItems, []).

create_retrieve_test() ->
    test_fixture(fun create_retrieve/1).

create_update_test() ->
    test_fixture(fun create_update/1).

create_delete_test() ->
    test_fixture(fun create_delete/1).
