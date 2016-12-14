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
-export([santa_count_gifts/1, robot_santa_count_gifts/1]).
santa_track_movement(Input) -> santa_track_movement(Input,{0,0},[{0,0}]).
santa_track_movement([],_, Coordinates) -> Coordinates;
santa_track_movement([H|T],{X,Y}, Coordinates) when H == $^ -> santa_track_movement(T,{X,Y+1}, add_to_list({X,Y+1},Coordinates));
santa_track_movement([H|T],{X,Y}, Coordinates) when H == $< -> santa_track_movement(T,{X-1,Y},add_to_list({X-1,Y},Coordinates));
santa_track_movement([H|T],{X,Y}, Coordinates) when H == $v -> santa_track_movement(T,{X,Y-1},add_to_list({X,Y-1},Coordinates));
santa_track_movement([H|T],{X,Y},Coordinates) when H == $> -> santa_track_movement(T,{X+1,Y},add_to_list({X+1,Y},Coordinates)).
robot_santa_track_movement(Input) -> robot_santa_track_movement(Input,{0,0},{0,0},[{0,0}],santa).
robot_santa_track_movement([],_,_,Coordinates,_) ->  Coordinates;
robot_santa_track_movement([H|T],{X_santa,Y_santa}, Robot_Coords, Coordinates,santa) when H == $^ ->robot_santa_track_movement(T,{X_santa,Y_santa+1},Robot_Coords,add_to_list({X_santa,Y_santa+1},Coordinates),robot);
robot_santa_track_movement([H|T],{X_santa,Y_santa}, Robot_Coords, Coordinates,santa) when H == $< ->robot_santa_track_movement(T,{X_santa-1,Y_santa},Robot_Coords,add_to_list({X_santa-1,Y_santa},Coordinates),robot);
robot_santa_track_movement([H|T],{X_santa,Y_santa}, Robot_Coords, Coordinates,santa) when H == $v ->robot_santa_track_movement(T,{X_santa,Y_santa-1},Robot_Coords,add_to_list({X_santa,Y_santa-1},Coordinates),robot);
robot_santa_track_movement([H|T],{X_santa,Y_santa}, Robot_Coords, Coordinates,santa) when H == $> ->robot_santa_track_movement(T,{X_santa+1,Y_santa},Robot_Coords,add_to_list({X_santa+1,Y_santa},Coordinates),robot);
robot_santa_track_movement([H|T],Santa_Coords, {X_robot,Y_robot}, Coordinates,robot) when H == $^ ->robot_santa_track_movement(T,Santa_Coords,{X_robot,Y_robot+1},add_to_list({X_robot,Y_robot+1},Coordinates),santa);
robot_santa_track_movement([H|T],Santa_Coords, {X_robot,Y_robot}, Coordinates,robot) when H == $< ->robot_santa_track_movement(T,Santa_Coords,{X_robot-1,Y_robot},add_to_list({X_robot-1,Y_robot},Coordinates),santa);
robot_santa_track_movement([H|T],Santa_Coords, {X_robot,Y_robot}, Coordinates,robot) when H == $v ->robot_santa_track_movement(T,Santa_Coords,{X_robot,Y_robot-1},add_to_list({X_robot,Y_robot-1},Coordinates),santa);
robot_santa_track_movement([H|T],Santa_Coords, {X_robot,Y_robot}, Coordinates,robot) when H == $> ->robot_santa_track_movement(T,Santa_Coords,{X_robot+1,Y_robot},add_to_list({X_robot+1,Y_robot},Coordinates),santa).






add_to_list(New,Current) ->
  case lists:member(New,Current) of
    true -> Current;
    false -> [New|Current]
  end.
santa_count_gifts(Input) -> length(santa_track_movement((Input))).
robot_santa_count_gifts(Input)-> length(robot_santa_track_movement(Input)).