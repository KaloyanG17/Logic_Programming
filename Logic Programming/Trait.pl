/*Begin Question 4.1*/
prime( N )
  :-not((N1 is N-1,between(2,N1,A), 
    0 is mod(N,A))),
    not(N is 1). /* --- ASSUMPTION 1 IS NOT A PRIME --- */

/*End Question 4.1*/

/*Begin Question 4.2*/
possible( X, Y, Z ) 
  :-between(123, 178, X),
      between(182, 268, Y),
      between(273, 358, Z).

/* --- X IS BETWEEN 123 AS EACH DIGIT SHOULD BE UNIQUE AND NOT 0 THEREFORE THE SMALLEST NUMBER IS 123 AND 178 AS 179 IS A PRIME
 *     Y IS BETWEEN 182 AS EACH DIGIT SHOULD BE UNIQE AND ITS IN THE NEXT QUADRANT AND 268 AS 269 IS A PRIME
 *     Z IS BETWEEN 273 AS 271 IS PRIME AND 272 DOESNT HAVE UNIQUE DIGITS AND 358 AS 359 IS A PRIME --- */
/*End Question 4.2*/

/*Begin Question 4.3*/

acceptable( X, Y, Z ) 
  :-111 =< X, X =< 359,
    get_quad(X,X1),
    \+ (prime(X)),
    111 =< Y, Y =< 359,
    get_quad(Y,Y1),
    \+ (prime(Y)),
    111 =< Z, Z =< 359,
    get_quad(Z,Z1),
    \+ (prime(Z)),
    all_unique(X1,Y1,Z1),
    unique_digits(X,Y,Z).

unique_digits(X, Y, Z) :-
    number_chars(X, XChars),
    number_chars(Y, YChars),
    number_chars(Z, ZChars),
    append(XChars, YChars, XYChars),
    append(XYChars, ZChars, AllChars),
    \+ member('0', AllChars),
    list_to_set(AllChars, UniqueChars),
    length(AllChars, Len),
    length(UniqueChars, Len).

get_quad(A, Q)
  :- ( A < 90 ->  Q = 1
       ; A < 180 ->   Q = 2
       ; A < 270 ->   Q = 3
       ; A < 360 ->  Q = 4
       ).

all_unique(X, Y, Z) :-
    dif(X, Y),
    dif(X, Z),
    dif(Y, Z).

/* --- Q STANDS FOR EACH QUADRANT SO Q = 1 IS NORTH EAST QUADRANT ... --- */

trait( X, Y, Z )
  :-possible(X,Y,Z),
    acceptable(X,Y,Z).
/* --- TAKES ABOUT 11/12 SECONDS TO GET FIRST RESULT AND AROUND 17/18 FOR LAST RESULT 
 * BUT RUNS AROUND 1 SECOND LOCALLY --- */

/*End Question 4.3*/

% any main predicates for testing goes here

