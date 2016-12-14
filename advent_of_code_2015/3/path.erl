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
-export([count_gifts/2]).
track_movement(Input,santa) -> track_movement(Input,{0,0},[{0,0}]);
track_movement(Input,robot) -> track_movement(Input,{0,0},{0,0},[{0,0}],santa);
track_movement(_,_) -> io:format("Invalid gift list or deliverer !~n").
track_movement([],_, Coordinates) -> Coordinates;
track_movement([H|T],Santa_cords, Coordinates)  -> Change = move(H,Santa_cords),
  track_movement(T,Change, add_to_list(Change,Coordinates)).
track_movement([],_,_,Coordinates,_) ->  Coordinates;
track_movement([H|T],Santa_cords,Robot_cords,Coordinates,santa) -> Change = move(H,Santa_cords),
  track_movement(T,Change,Robot_cords,add_to_list(Change,Coordinates),robot);
track_movement([H|T],Santa_cords,Robot_cords,Coordinates,robot) -> Change = move(H,Robot_cords),
  track_movement(T,Santa_cords,Change,add_to_list(Change,Coordinates),santa).
move (A,{X,Y}) when A == $^ -> {X,Y+1};
move (A,{X,Y}) when A == $v -> {X,Y-1};
move (A,{X,Y}) when A == $> -> {X+1,Y};
move (A,{X,Y}) when A == $< -> {X-1,Y}.

add_to_list(New,Current) ->
  case lists:member(New,Current) of
    true -> Current;
    false -> [New|Current]
  end.
count_gifts(Input,Gift_deliverer) -> length(track_movement(Input,Gift_deliverer)).
