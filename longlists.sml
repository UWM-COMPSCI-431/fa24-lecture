fun range(a,b) =
     if (a>=b) then [] else a::range(a+1,b);

fun reclen([]) = 0
 |  reclen(_::t) = 1 + reclen(t);

fun lenH([],n) = n
 |  lenH(_::t,n) = lenH(t,n+1);

     
