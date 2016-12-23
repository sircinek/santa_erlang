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
-export([part1/1, part2/1]).
solve(Input) -> solve(Input,up,[{0,0}]).
solve([],_,List)-> List;
solve([[Direction|Number]|Rest],HeadingTowards,ListOfCoordinates)->
  Distance = convertDistanceToInteger(Number),
  NewDirection = switchDirection(Direction,HeadingTowards),
  NewCords = move(NewDirection,ListOfCoordinates,Distance),
   solve(Rest,NewDirection,NewCords).
part1(Input)-> calculateDistance(solve(Input)).
part2(Input)-> calculateDistance(checkDuplicates(lists:reverse(solve(Input)))).


move(left,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{X,Y}|_]=ListOfCoordinates,
  move(left,updateCoordslist({X-1,Y},ListOfCoordinates),Distance-1);
move(right,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{X,Y}|_]=ListOfCoordinates,
  move(right,updateCoordslist({X+1,Y},ListOfCoordinates),Distance-1);
move(up,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{X,Y}|_]=ListOfCoordinates,
  move(up,updateCoordslist({X,Y+1},ListOfCoordinates),Distance-1);
move(down,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{X,Y}|_]=ListOfCoordinates,
  move(down,updateCoordslist({X,Y-1},ListOfCoordinates),Distance-1);
move(_,ListOfCoordinates,0)->ListOfCoordinates.

convertDistanceToInteger(Number) ->
  {Distance,_} = string:to_integer(Number),
  Distance.
switchDirection(Direction,up) ->
  case Direction of
    $L -> left;
    $R -> right
  end;
switchDirection(Direction,down) ->
  case Direction of
    $L -> right;
    $R -> left
  end;
switchDirection(Direction,left) ->
  case Direction of
    $L -> down;
    $R -> up
  end;
switchDirection(Direction,right) ->
  case Direction of
    $L -> up;
    $R -> down
  end.
updateCoordslist (NewCords,List)->
  [NewCords|List].
calculateDistance(List) ->
  [{X,Y}|_] = List,
  abs(X)+abs(Y).
checkDuplicates([H|T]) ->
  case lists:member(H,T) of
    true -> [H];
    false -> checkDuplicates(T)
  end.



  





