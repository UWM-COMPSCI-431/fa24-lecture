myLength([], 0).
myLength([_|T], N) :- N > 0, write(N), N1 is N-1, myLength(T,N1).

myLength2([],0).
myLength2([_|T], N) :- myLength2(T, N1), N is N1+1.

max(N1,N2,N1) :- N1 > N2.
max(N1,N2,N2) :- N2 >= N1.

max([E],E) :- E =:= E.
max([H|T], M) :- max(T,M1), max(H,M1,M).
