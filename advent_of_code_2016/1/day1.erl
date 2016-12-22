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
part1(Input) -> part1(Input,[{up,0,0}]).
part1([],[{_,X,Y}|_])-> abs(X)+abs(Y);
part1([[Direction|Number]|Rest],ListOfCoordinates)->
  Distance = calculateDistance(Number),
  [CurrentCoordinates|_] = ListOfCoordinates,
  NewDirection = switchDirection(Direction,CurrentCoordinates),
  NewCords = move(NewDirection,ListOfCoordinates,Distance),
   part1(Rest,NewCords).
part2(Input) -> part2(Input,undefined,[{up,0,0}]).
part2(_,ok,[{_,X,Y}|_]) ->abs(X)+abs(Y);
part2([[Direction|Number]|Rest],undefined,ListOfCoordinates)->
Distance = calculateDistance(Number),
[CurrentCoordinates|_] = ListOfCoordinates,
NewDirection = switchDirection(Direction,CurrentCoordinates),
NewCords = move(NewDirection,ListOfCoordinates,Distance) ->


move(left,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{_,X,Y}|_]=ListOfCoordinates,
  move(left,updateCoordslist({left,X-1,Y},ListOfCoordinates),Distance-1);
move(right,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{_,X,Y}|_]=ListOfCoordinates,
  move(right,updateCoordslist({right,X+1,Y},ListOfCoordinates),Distance-1);
move(up,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{_,X,Y}|_]=ListOfCoordinates,
  move(up,updateCoordslist({up,X,Y+1},ListOfCoordinates),Distance-1);
move(down,ListOfCoordinates,Distance) when Distance =/= 0 ->
  [{_,X,Y}|_]=ListOfCoordinates,
  move(down,updateCoordslist({down,X,Y-1},ListOfCoordinates),Distance-1);
move(_,ListOfCoordinates,0)->ListOfCoordinates.

calculateDistance(Number) ->
  {Distance,_} = string:to_integer(Number),
  Distance.
switchDirection(Direction,{up,_,_}) ->
  case Direction of
    $L -> left;
    $R -> right
  end;
switchDirection(Direction,{down,_,_}) ->
  case Direction of
    $L -> right;
    $R -> left
  end;
switchDirection(Direction,{left,_,_}) ->
  case Direction of
    $L -> down;
    $R -> up
  end;
switchDirection(Direction,{right,_,_}) ->
  case Direction of
    $L -> up;
    $R -> down
  end.
updateCoordslist (NewCords,List)->
  [NewCords|List].

%%checkDuplicates()





