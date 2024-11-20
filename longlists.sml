(* new -- in lecture we only had slowrange *)
fun tailrange(a,b,l) =
     if (a>=b) then l else tailrange(a,b-1,(b-1)::l);

fun range(a,b) = tailrange(a,b,[]);

fun slowrange(a,b) =
     if (a>=b) then [] else a::slowrange(a+1,b);


fun reclen([]) = 0
 |  reclen(_::t) = 1 + reclen(t);

fun lenH([],n) = n
 |  lenH(_::t,n) = lenH(t,n+1);

fun taillen(l) = lenH(l,0);
     
