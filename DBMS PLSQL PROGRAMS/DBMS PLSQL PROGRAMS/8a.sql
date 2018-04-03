set serveroutput on

BEGIN
	update employee
	set salary=(1.15*salary) where deptno=10;
	dbms_output.put_line('number of rows updated are'||sql%rowcount);

END;
/