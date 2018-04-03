SET SERVEROUTPUT ON;

CREATE or REPLACE procedure FACT(N in number, F out number)
AS
	I number;

BEGIN
	F:=1;
	for I in 1..N
	loop
		F:=F*I;
	end loop;
END;
/

DECLARE
	N number:=&n;
	F number;

BEGIN
	FACT(N,F);
	DBMS_OUTPUT.PUT_LINE('Factorial of '||N||' is: '||F);

END;
/