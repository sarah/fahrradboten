-module(overseer).

-export([start_workers/1]).

%%%===================================================================
%%% API
%%%===================================================================

-spec start_workers(N :: non_neg_integer()) -> ok.
start_workers(N) -> overseer_srv:start_workers(N).

%%%===================================================================
%%% Internal Functions
%%%===================================================================
