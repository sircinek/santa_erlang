%%%-------------------------------------------------------------------
%%% @author marcin
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2016 11:10 AM
%%%-------------------------------------------------------------------
-module(calc).
-author("marcin").
-define(PATTERN,[$0,$0,$0,$0,$0]).

%% API
-export([md5_hash/1]).
md5_hash(Key) -> md5_hash(Key,[$1],[]).
md5_hash(Key,Sum,Hash) ->
  Result = md5_sum(Hash),
  case lists:prefix(?PATTERN,Result) of
    true -> Result;
    false -> if Sum =< $9 -> md5_hash(Key,increase_hash(Sum),Hash);
           Sum > $9 -> md5_hash(Key,[$0],append_new_hash(Hash))
            end
  end.
increase_hash(InputHash) -> InputHash+1.
append_new_hash(Hash) -> Hash++[$0].
md5_sum(InputKey)-> binary:bin_to_list(erlang:md5(InputKey)).


