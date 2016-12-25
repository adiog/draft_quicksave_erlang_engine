% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.

-module(engine_authorization_item).
-author("Aleksander Gajewski <adiog@brainfuck.pl>").

%% API
-export([is_authorized_to_retrieve/3, is_authorized_to_update/3, is_authorized_to_delete/3]).


-include("engine_authentication_user.hrl").
-include("engine_bom_item.hrl").
-include("engine_request_item.hrl").
-import(dependency_factory, [get_item_table/0]).


owns(undefined, _) -> false;
owns(User, [{_Key, Item}]) -> Item#item.user_id == User#user.user_id;
owns(User, _) -> false.


exists_and_owned(Transaction, ItemId, User) ->
    ItemsByKey = apply(get_item_table(), retrieve, [Transaction, ItemId]),
    owns(User, ItemsByKey).


is_authorized_to_retrieve(Transaction, User, ItemRetrieveRequest) ->
    ItemId = ItemRetrieveRequest#item_retrieve_request.item_id,
    exists_and_owned(Transaction, ItemId, User).


is_authorized_to_update(Transaction, User, ItemUpdateRequest) ->
    ItemId = ItemUpdateRequest#item_update_request.item_id,
    exists_and_owned(Transaction, ItemId, User).


is_authorized_to_delete(Transaction, User, ItemDeleteRequest) ->
    ItemId = ItemDeleteRequest#item_delete_request.item_id,
    exists_and_owned(Transaction, ItemId, User).

