% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(engine_action_item).
-include("engine_authentication_user.hrl").
-include("engine_bom_item.hrl").
-include("engine_request_item.hrl").
-import(dependency_factory, [get_item_table/0]).
-export([create/3, retrieve/3, update/3, delete/2]).


create(Transaction, User, ItemCreateRequest) ->
    Item = ItemCreateRequest#item_create_request.item#item{user_id=User#user.user_id},
    apply(get_item_table(), create, [Transaction, Item]).


retrieve(Transaction, User, ItemRetrieveRequest) ->
    ItemId = ItemRetrieveRequest#item_retrieve_request.item_id,
    apply(get_item_table(), retrieve, [Transaction, ItemId]).


update(Transaction, User, ItemUpdateRequest) ->
    ItemId = ItemUpdateRequest#item_update_request.item_id,
    Item = ItemUpdateRequest#item_update_request.item#item{user_id=User#user.user_id},
    apply(get_item_table(), update, [Transaction, ItemId, Item]).


delete(Transaction, ItemDeleteRequest) ->
    ItemId = ItemDeleteRequest#item_delete_request.item_id,
    apply(get_item_table(), delete, [Transaction, ItemId]).
