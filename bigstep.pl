lookup([Name=Val|_],Name,Val).
lookup([Name2=_|T],Name,Val) :- Name2 \= Name, lookup(T,Name,Val).

eval(_,const(N),N).
eval(_,true,true).
eval(_,false,false).
eval(_,fn(X,E),fn(X,E)). % BUG

eval(S,plus(E1,E2),N) :- eval(S,E1,N1), eval(S,E2,N2), N is N1+N2.
eval(S,times(E1,E2),N) :- eval(S,E1,N1), eval(S,E2,N2), N is N1*N2.

eval(S,var(Name),V) :- lookup(S,Name,V).

eval(S,let(Name,E1,E2),V) :- eval(S,E1,V1), eval([Name=V1|S],E2,V).
eval(S,apply(E1,E2),V) :- 
  eval(S,E1,fn(Name,E)),
  eval(S,E2,V2),
  eval([Name=V2|S],E,V). % BUG
