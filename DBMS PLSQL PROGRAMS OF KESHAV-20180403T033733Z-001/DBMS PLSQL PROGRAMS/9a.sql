SET SERVEROUTPUT ON;

DECLARE
	a number(5):=0;
	b number(5):=1;
	c number(5);
	printline varchar(100);
	i number(5):=1;

BEGIN
	printline:=a||','||b;
	while(i<10)
	loop
		c:=a+b;
		printline:=printline||','||c;
		a:=b;
		b:=c;
		i:=i+1;
	end loop;
	dbms_output.put_line(printline);

END;
/