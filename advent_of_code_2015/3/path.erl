%%%-------------------------------------------------------------------
%%% @author marcin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Dec 2016 5:35 PM
%%%-------------------------------------------------------------------
-module(path).
-author("marcin").

%% API
-export([track_movement/1,count_gifts/1]).
track_movement(Input) -> track_movement(Input,{0,0},[{0,0}]).
track_movement([],_, Coordinates) -> Coordinates;
track_movement([H|T],{X,Y}, Coordinates) when H == $^ -> track_movement(T,{X,Y+1}, add_to_list({X,Y+1},Coordinates));
track_movement([H|T],{X,Y}, Coordinates) when H == $< -> track_movement(T,{X-1,Y},add_to_list({X-1,Y},Coordinates));
track_movement([H|T],{X,Y}, Coordinates) when H == $v -> track_movement(T,{X,Y-1},add_to_list({X,Y-1},Coordinates));
track_movement([H|T],{X,Y},Coordinates) when H == $> -> track_movement(T,{X+1,Y},add_to_list({X+1,Y},Coordinates)).
add_to_list(New,Current) ->
  case lists:member(New,Current) of
    true -> Current;
    false -> [New|Current]
  end.
count_gifts(Houses) -> length(Houses).