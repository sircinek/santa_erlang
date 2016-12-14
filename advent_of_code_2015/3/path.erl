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
-export([track_movement/1]).
track_movement(Input) -> track_movement(Input,[{0,0}],[{0,0}]).
track_movement([],_, Coordinates) -> Coordinates;
track_movement([H|T],[{X,Y}], Coordinates) when H == $^ -> track_movement(T,[{X,Y+1}],lists:append(Coordinates,[{X,Y+1}]));
track_movement([H|T],[{X,Y}], Coordinates) when H == $< -> track_movement(T,[{X-1,Y}],lists:append(Coordinates,[{X-1,Y}]));
track_movement([H|T],[{X,Y}], Coordinates) when H == $v -> track_movement(T,[{X,Y-1}],lists:append(Coordinates,[{X,Y-1}]));
track_movement([H|T],[{X,Y}],Coordinates) when H == $> -> track_movement(T,[{X+1,Y}],lists:append(Coordinates,[{X+1,Y}])).