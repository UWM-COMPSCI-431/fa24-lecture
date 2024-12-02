inRange(Lo,Lo,_).
inRange(N,Lo,Hi) :-
  Lo < Hi,
  Lo2 is Lo + 1,
  inRange(N,Lo2,Hi).
  
allOnBoard(_,[]).
allOnBoard(N,[R-C|T]) :-
    inRange(R,1,N),
    inRange(C,1,N),
    allOnBoard(N,T).

noConflict(_-_, []).
noConflict(R1-C1, [R2-C2 | T]) :-
  R1 \= R2,
  C1 \= C2,
  R1-C1 =\= R2-C2,
  R1+C1 =\= R2+C2,
  noConflict(R1-C1, T).

qok([]).
qok([R-C|T]) :-
  noConflict(R-C,T),
  qok(T).

nqueens(N,L) :-
  length(L,N),
  qok(L),
  allOnBoard(N,L).
