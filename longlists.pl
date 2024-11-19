range(A,A,[]).
range(A,B,[A|L]) :- A < B, A1 is A+1, range(A1,B,L).

naiverev([],[]).
naiverev([H|T],L) :- naiverev(T,R), append(R,[H],L).

revH([],L,L).
revH([H|T],L,R) :- revH(T,[H|L],R).
smartrev(L,R) :- revH(L,[],R).

