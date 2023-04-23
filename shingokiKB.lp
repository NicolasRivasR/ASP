%Nicolas Rivas Rodriguez 

size(n).
row(0..n-1).
col(0..n-1).

%clingo shingokiKB.lp shingoki1.lp $1 --outf=2 | clingraph --viz-encoding=viz.lp --out=render --view --prefix=viz_ --engine=neato --type=graph


celda( (X,Y) ):-row(X),col(Y).


adyacente( (X,Y), (X+1,Y) ) :- celda( (X,Y) ), celda( (X+1,Y) ).
adyacente( (X,Y), (X,Y+1) ) :- celda( (X,Y) ), celda( (X,Y+1) ).

adyacentev( (X,Y), (X+1,Y) ) :- celda( (X,Y) ), celda( (X+1,Y) ).
adyacenteh( (X,Y), (X,Y+1) ) :- celda( (X,Y) ), celda( (X,Y+1) ).

fila((X,Y),(X',Y')) :- celda( (X,Y) ), celda( (X',Y') ) , X=X'.
fila(A,B) :- fila(B,A).
columna((X,Y),(X',Y')) :- celda( (X,Y) ) , celda( (X',Y') ) , Y=Y'.
columna(A,B):- columna(B,A).

adyacente(C,C') :- adyacente(C',C).
adyacentev(C,C') :- adyacentev(C',C).
adyacenteh(C,C') :- adyacenteh(C',C).


 

seg((X,Y),(X',Y')) :- celda((X,Y)), celda((X',Y')),adyacente((X,Y),(X',Y')), not seg((X',Y'),(X,Y)). %genra todos los segmetos entre celdas adyacentes(maya de la matriz)


{in(C,C')}:- seg(C,C'). 

:-in(C,C'),in(C,M), C'!=M.
:-in(C,M),in(C',M), C!=C'.

%restriciones para que tuerza en las negativas y siga recto en las positivas: 

:-in(C',C), in(C,M), number(C,N), N<0, adyacentev(C,M), adyacentev(C,C'),M!=C'.
:-in(C',C), in(C,M), number(C,N), N<0, adyacenteh(C,M), adyacenteh(C,C'),M!=C'.

:-in(C',C), in(C,M), number(C,N), N>0,  adyacentev(C,M), adyacenteh(C,C'), M!=C'.
:-in(C',C), in(C,M), number(C,N), N>0, adyacenteh(C,M), adyacentev(C,C'), M!=C'.

%----------------------------------------------------------------------------




%Conexiones entre celdas:

    alineado(B,P) :- number(B,_), in(B,P).
    alineado(B,P) :- number(B,_), in(P,B).
    alineado(B,Q) :- number(B,_),in(P,Q), P!=Q, P!=B, Q!=B,alineado(B,P),fila(B,Q). %adyacente?
    alineado(B,Q) :- number(B,_),in(Q,P), P!=Q, P!=B, Q!=B,alineado(B,P),fila(B,Q).
    alineado(B,Q) :- number(B,_),in(P,Q), P!=Q, P!=B, Q!=B,alineado(B,P),columna(B,Q).
    alineado(B,Q) :- number(B,_),in(Q,P), P!=Q, P!=B, Q!=B,alineado(B,P),columna(B,Q).

    :- number(B,N), | N | != #count{Q:alineado(B,Q)}     .
    

%-------------------------------------------------------



%crea el ciclo, se asegura que se llegue desde un punto inicial a ese mismo punto, y de que estan conectados todos los numeros:

reached(C) :- in(start,C).
reached(C') :- reached(C) , in(C,C').
:- number(C,_), not reached(C).


#show size/1.
#show number/2.
#show in/2.






