%%%-------------------------------------------------------------------
%% @doc quicksave_erlang_engine public API
%% @end
%%%-------------------------------------------------------------------

-module(quicksave_erlang_engine_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    quicksave_erlang_engine_sup:start_link(),
    io:format("STARTUJE ENGINE"),
    erlang_db_bom_item_table:start().

%%--------------------------------------------------------------------
stop(Transaction) ->
    erlang_db_bom_item_table:close(Transaction),
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
