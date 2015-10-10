-module(dispatch_messenger_sup).

-behaviour(supervisor).

-export([start_link/0, start_messenger/1]).

-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================

start_messenger(Messenger) ->
  supervisor:start_child(?MODULE, [Messenger]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  DispatchMessenger = {dispatch_messenger, 
    {dispatch_messenger, start, []},
    temporary, 5000, worker, dynamic},

    {ok, {{simple_one_for_one, 100, 1}, [DispatchMessenger]}}.
