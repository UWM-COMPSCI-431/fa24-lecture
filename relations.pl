parent(patricia,anna).
parent(michael,anna).
parent(virginia,patricia).
parent(virginia,ericka).
parent(ericka,sonya).
parent(ericka,corina).
parent(robert,sonya).
parent(robert,corina).
parent(jack,patricia).
parent(jack,ericka).
parent(anna,kimberly).
parent(sonya,alexandra).
parent(patrick,alexandra).

grandparent(G,C) :- parent(G,X), parent(X,C).
