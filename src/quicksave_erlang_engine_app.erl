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
    io:format("quicksave_erlang_engine starting..."),
    erlang_db_bom_item_table:start(),
    quicksave_erlang_engine_sup:start_link().

%%--------------------------------------------------------------------
stop(_) ->
    erlang_db_bom_item_table:close(erlang_db_bom_item_table:get_table_name()),
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
