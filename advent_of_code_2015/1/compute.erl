%%%-------------------------------------------------------------------
%%% @author marcin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Dec 2016 10:41 PM
%%%-------------------------------------------------------------------
-module(compute).
-author("marcin").
%% API
-export([compute/1,position/2]).
compute(N) -> compute(N,0).
compute([],Acc) -> Acc;
compute([H|T],Acc) when H == $( -> compute(T,Acc+1);
compute([H|T],Acc) when H == $) -> compute(T,Acc-1).
position(List,Level) -> position (List,0,Level,0).
position([],_,_,_) -> io:format("Did not found this level position in given input!~n");
position(_,Acc,Level,Pos) when Acc == Level -> Pos;
position([H|T],Acc,Level,Pos) when H == $( -> position(T,Acc+1,Level,Pos+1);
position([H|T],Acc,Level,Pos) when H == $) -> position(T,Acc-1,Level,Pos+1).











