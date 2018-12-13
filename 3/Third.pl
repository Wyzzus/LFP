domains
	int=integer
 
predicates
	gcd(int,int,int)
	gcd3(int,int,int,int)
	nod2
	nod3
	proverka(int, int)
 
clauses
	gcd(N,M,K) :- M>N, gcd(M,N,K),!.
	gcd(N,M,M) :- (N mod M)=0.
	gcd(N,M,K) :- P=(N mod M), P<>0, gcd(M,P,K).  
 
	gcd3(N,M,P,R) :- gcd(N,M,Q), gcd(Q,P,R).
	
	proverka(X, Y):- X<>0, Y<>0.

nod2:-
	write("input first number"),nl,
	readln(X),!,str_int(X,N),
	write("input second number"),nl,
	readln(Y),!,str_int(Y,M),
	proverka(N,M),
	gcd(N,M,K), write(K).

nod3:-
	write("input first number"),nl,
	readln(X),!,str_int(X,N),
	write("input second number"),nl,
	readln(Y),!,str_int(Y,M),
	write("input third number"),nl,
	readln(Z),!,str_int(Z,P),
	proverka(N,M),proverka(M,P),
	gcd3(N,M,P,R), write(R).