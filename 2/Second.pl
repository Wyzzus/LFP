validationCheck(N):-
	number(N), N > 0.

readElips(EX, EY, EA, EB):-
	nl, 
	write("Input the X and Y coordinates of the center of the ellipse"), nl,
	write("X - "),
	read(EX), nl,
	write("Y - "), 
	read(EY), nl,
	write("Coordinates of the center: "), write("("), write(EX), write("; "), write(EY), write(")"),
	nl, 
	write("Input the half shafts of the ellipse"), nl,
	write("A - "),
	read(EA), nl,
	write("B - "), 
	read(EB), nl,
	write("half shafts of the ellipse: "), write("A: "), write(EA), write("; B: "), write(EB), write("."), nl.		

readLine(LX1, LX2, LY1, LY2):-
	nl, 
	write("Input the X and Y coordinates of the first point of the line"), nl,
	write("X - "),
	read(LX1), nl,
	write("Y - "), 
	read(LY1), nl,
	write("Coordinates of the first point: "), write("("), write(LX1), write("; "), write(LY1), write(")"),
	nl, 
	write("Input the X and Y coordinates of the second point of the line"), nl,
	write("X - "),
	read(LX2), nl,
	write("Y - "), 
	read(LY2), nl,
	write("Coordinates of the second point: "), write("("), write(LX2), write("; "), write(LY2), write(")"), nl.

solveQuad(A, B, C, X1, X2):-
	D is B*B-4*A*C,  
    (	D < 0 -> write('Line and Ellipse do not intersect'), X1 = 'missing', X2 = 'missing';
    	D = 0 -> X1 is -B/2/A, X2 = 'missing';
        D > 0 -> X1 is (-B+sqrt(D))/2/A, X2 is (-B-sqrt(D))/2/A
    ).

getIntersectPoint(K, B, MX):-
	Y is (K * MX + B),  write("("), write(MX), write("; "), write(Y), write(")"), nl.

getKoef(X1, X2, Y1, Y2, K):-
	K is ((Y2-Y1)/(X2-X1)).

getBias(X1, X2, Y1, Y2, B):-
	B is (Y1 - X1*((Y2-Y1)/(X2-X1))).

getQuad(AHS, BHS, K, N, ALFA, BETA, A, B, C):-
	A is (BHS + AHS * K * K),
	B is (2 * AHS * K * N - 2 * AHS * K * BETA - 2 * ALFA * BHS),
	C is (ALFA * ALFA * BHS + AHS * N * N + AHS * BETA * BETA - AHS * BHS - 2 * AHS * N * BETA).


main():-
	readElips(EX, EY, EA, EB),
	(validationCheck(EA) -> nl; write("A half shaft is incorrect"), halt(0)),
	(validationCheck(EB) -> nl; write("B half shaft is incorrect"), halt(0)),
	readLine(LX1, LX2, LY1, LY2),
	getKoef(LX1, LX2, LY1, LY2, K),
	getBias(LX1, LX2, LY1, LY2, N),
	getQuad(EA, EB, K, N, EX, EY, A, B, C),
	solveQuad(A, B, C, X1, X2),
	X1 \= 'missing', nl, write("Intersiction points:"), nl, getIntersectPoint(K, N, X1),
	X2 \= 'missing', getIntersectPoint(K, N, X2),
	halt(0).
	