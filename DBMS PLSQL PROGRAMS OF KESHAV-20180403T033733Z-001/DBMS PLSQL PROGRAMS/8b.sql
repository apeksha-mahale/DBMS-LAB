SET SERVEROUTPUT ON;

DECLARE
	n1 number(10);
	n2 number(10);
	ebigger exception;

BEGIN
	n1:= & sv1;
	n2:= & sv2;
	if n1<n2 then
		dbms_output.put_line('no error because n1 is smaller');
	else
		raise ebigger;
	end if;
	
exception when ebigger then
	dbms_output.put_line('exception caught ,n1 is bigger than n2');

END;
/