/*Begin Question 3.1*/
indices(IS , XS, ES) 
    :- IS = [Index|Indices],
       ES = [Elem|Elems],
       nth0(Index, XS, Elem),
       indices(Indices, XS, Elems).
indices([], _, []).
/*End Question 3.1*/

/*Begin Question 3.2*/
possible(Grid) 
    :- permutation([1, 2, 3, 4, 5, 6, 7, 8, 9], Grid).
/*End Question 3.2*/

/*Begin Question 3.3*/
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
  :- checkSum(T0,[0,1,3,4],GRID),
     checkSum(T1,[1,2,4,5],GRID),
     checkSum(T2,[3,4,6,7],GRID),
     checkSum(T3,[4,5,7,8],GRID),
     checkSum(U,US,GRID),
     checkSum(V,VS,GRID),
     checkSum(W,WS,GRID),
     permutation([1, 2, 3, 4, 5, 6, 7, 8, 9], GRID).
     
checkSum(T,POS,GRID)
    :- indices(POS, GRID, ES),
       sum_list(ES,TS),
       T = TS.

sum_list([], 0).
sum_list([H|T], Sum) 
    :-sum_list(T, Rest),
      Sum is H + Rest.

suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
    :- possible(GRID),
       acceptable(T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).
/* --- FURTHER TESTED ON https://puzzlemadness.co.uk/suko/hard ---*/
/*End Question 3.3*/
%any main predicates for testing goes here

   