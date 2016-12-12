%%%-------------------------------------------------------------------
%%% @author marcin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Dec 2016 7:53 PM
%%%-------------------------------------------------------------------
-module(calc).
-author("marcin").

%% API
-export([paper_area/1, ribbon_count/1]).
trim_newline_sign (String) -> string:tokens(String,"\n").
paper_area([]) -> io:format("Empty list passed or EoL! ~n");
paper_area(Input) -> paper_area(trim_newline_sign(Input),0).
paper_area([],Acc) -> Acc;
paper_area([Head|Tail],Acc) -> Gift_dimensions = string:tokens(Head,"x"),
  [A,B,C] = Gift_dimensions,
  {L,_} = string:to_integer(A),
  {W,_} = string:to_integer(B),
  {H,_} = string:to_integer(C),
  Min1 = lists:min ([L,W,H]),
  Min2 = lists:min([L,W,H] -- [Min1]),
  Sum = (2*L*W)+(2*H*W)+(2*L*H)+(Min1*Min2)+Acc,
  paper_area(Tail,Sum).
ribbon_count([]) -> io:format("Empty list passed or EoL! ~n");
ribbon_count(Input) -> ribbon_count(trim_newline_sign(Input),0).
ribbon_count([],Acc) -> Acc;
ribbon_count([Head|Tail],Acc) -> Gift_dimensions = string:tokens(Head,"x"),
  [A,B,C] = Gift_dimensions,
  {L,_} = string:to_integer(A),
  {W,_} = string:to_integer(B),
  {H,_} = string:to_integer(C),
  Min1 = lists:min ([L,W,H]),
  Min2 = lists:min([L,W,H] -- [Min1]),
  Sum = 2*Min1+2*Min2+ (L*W*H)+Acc,
  ribbon_count(Tail,Sum).