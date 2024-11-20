
head([X|_], X).

tail([_|X], X).

myappend([], L, L).
myappend([H|T], L, [H|X]) :- myappend(T,L,X).

myreverse([], []).
myreverse([H|T], R) :- myreverse(T,TR), myappend(TR, H, R).
