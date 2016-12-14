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

%% API
-export([suffixToKey/1,suffixToKey2/1]).
suffixToKey(Key) -> suffixToKey(Key,1).
suffixToKey(Key, Counter) ->
  case erlang:md5(Key ++ integer_to_list(Counter)) of
    <<0, 0,  Byte, _Rest/binary>> when Byte =< 15 -> Counter;
                                                _ -> suffixToKey(Key, Counter + 1)
  end.
suffixToKey2(Key) -> suffixToKey2(Key,1).
suffixToKey2(Key,Counter) ->
  case erlang:md5(Key ++ integer_to_list(Counter)) of
    <<0, 0, 0, _Rest/binary>> -> Counter;
                            _ -> suffixToKey2(Key, Counter + 1)
  end.




