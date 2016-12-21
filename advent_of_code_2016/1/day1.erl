%%%-------------------------------------------------------------------
%%% @author marcin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Dec 2016 12:32 PM
%%%-------------------------------------------------------------------
-module(day1).
-author("marcin").

%% API
-export([solve/1,move/3]).
solve(Input) -> solve(Input,{up,0,0},[]).
solve([],{_,X,Y},_)-> abs(X)+abs(Y);
solve([[Direction|Number]|Rest],CurrentPosition,ListOfVisitedCoordinates)->
  {Length,_}=string:to_integer(Number),
  {_,X,Y} = CurrentPosition,
  case lists:member({X,Y},ListOfVisitedCoordinates) of
    true ->  abs(X)+abs(Y);
    false -> [{X,Y}|ListOfVisitedCoordinates]
  end,
  solve(Rest,move(Direction,CurrentPosition,Length),ListOfVisitedCoordinates).
move(Direction,{up,X,Y},Length) when Direction == $L -> {left,X-Length,Y};
move(Direction,{up,X,Y},Length) when Direction == $R -> {right,X+Length,Y};
move(Direction,{down,X,Y},Length) when Direction == $L -> {right,X+Length,Y};
move(Direction,{down,X,Y},Length) when Direction == $R -> {left,X-Length,Y};
move(Direction,{left,X,Y},Length) when Direction == $L -> {down,X,Y-Length};
move(Direction,{left,X,Y},Length) when Direction == $R -> {up,X,Y+Length};
move(Direction,{right,X,Y},Length) when Direction == $L -> {up,X,Y+Length};
move(Direction,{right,X,Y},Length) when Direction == $R -> {down,X,Y-Length}.










