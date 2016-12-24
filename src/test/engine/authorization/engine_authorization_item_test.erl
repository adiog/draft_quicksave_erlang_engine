% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(engine_authorization_item_test).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% TEST
-include_lib("eunit/include/eunit.hrl").


-include("engine_authentication_user.hrl").
-include("engine_bom_item.hrl").
-include("engine_request_item.hrl").
-import(ets_db_bom_item_table, [start/0, close/1, create/2, delete/2, update/3, retrieve/2]).
-import(engine_authorization_item, [is_authorized_to_retrieve/3]).

test_setup() -> start().

test_teardown(Transaction) -> close(Transaction).

test_fixture(TestedFunction) ->
    Transaction = test_setup(),
    TestedFunction(Transaction),
    test_teardown(Transaction).

is_authorized_to_retrieve_success(Transaction) ->
    User = #user{user_id=541},
    Item = #item{user_id=User#user.user_id},
    ItemId = create(Transaction, Item),
    ItemRetrieveRequest = #item_retrieve_request{item_id=ItemId},
    ?assertEqual(is_authorized_to_retrieve(Transaction, User, ItemRetrieveRequest), true).

is_authorized_to_retrieve_failure_not_owned(Transaction) ->
    OwnerUser = #user{user_id=541},
    Item = #item{user_id=OwnerUser#user.user_id},
    ItemId = create(Transaction, Item),
    ItemRetrieveRequest = #item_retrieve_request{item_id=ItemId},
    RequestingUser = #user{user_id=666},
    ?assertEqual(is_authorized_to_retrieve(Transaction, RequestingUser, ItemRetrieveRequest), false).

is_authorized_to_retrieve_failure_not_exist(Transaction) ->
    User = #user{user_id=541},
    ItemId = 666,
    ItemRetrieveRequest = #item_retrieve_request{item_id=ItemId},
    ?assertEqual(is_authorized_to_retrieve(Transaction, User, ItemRetrieveRequest), false).

is_authorized_to_retrieve_success_test() ->
    test_fixture(fun is_authorized_to_retrieve_success/1).

is_authorized_to_retrieve_failure_not_owned_test() ->
    test_fixture(fun is_authorized_to_retrieve_failure_not_owned/1).

is_authorized_to_retrieve_failure_not_exist_test() ->
    test_fixture(fun is_authorized_to_retrieve_failure_not_exist/1).

