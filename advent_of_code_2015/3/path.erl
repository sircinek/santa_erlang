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
santa_track_movement(Input) -> santa_track_movement(Input,{0,0},[{0,0}]).
santa_track_movement([],_, Coordinates) -> Coordinates;
santa_track_movement([H|T],{X,Y}, Coordinates)  -> Change = move(H,{X,Y}),
  santa_track_movement(T,Change, add_to_list(Change,Coordinates)).
robot_santa_track_movement(Input) -> robot_santa_track_movement(Input,{0,0},{0,0},[{0,0}],santa).
robot_santa_track_movement([],_,_,Coordinates,_) ->  Coordinates;
robot_santa_track_movement([H|T],{X,Y},Robot_cords,Coordinates,santa) -> Change = move(H,{X,Y}),
  robot_santa_track_movement(T,Change,Robot_cords,add_to_list(Change,Coordinates),robot);
robot_santa_track_movement([H|T],Santa_cords,{X,Y},Coordinates,robot) -> Change = move(H,{X,Y}),
  robot_santa_track_movement(T,Santa_cords,Change,add_to_list(Change,Coordinates),santa).
move (A,{X,Y}) when A == $^ -> {X,Y+1};
move (A,{X,Y}) when A == $v -> {X,Y-1};
move (A,{X,Y}) when A == $> -> {X+1,Y};
move (A,{X,Y}) when A == $< -> {X-1,Y}.

add_to_list(New,Current) ->
  case lists:member(New,Current) of
    true -> Current;
    false -> [New|Current]
  end.
count_gifts(Input,santa) -> length(santa_track_movement((Input)));
count_gifts(Input,robot) -> length(robot_santa_track_movement((Input)));
count_gifts([],_) -> io:format("Not a valid list to compute !~n");
count_gifts(_,_) -> io:format("Not a valid gift deliverer my friend !~n").