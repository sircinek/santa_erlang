%%%-------------------------------------------------------------------
%%% @author marcin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2016 8:08 PM
%%%-------------------------------------------------------------------
-module(calc).
-author("marcin").

%% API
-export([countNiceStrings/1]).
countNiceStrings(Input) -> countNiceStrings(string:tokens(Input,"\n"),[]).
countNiceStrings([String|Rest],ListOfNiceStrings) -> [].
checkCondition(String,PreviousLetter,Counter) ->



hasThreeVowels()