SET SERVEROUTPUT ON

DECLARE
	num int:=&num1;
	rev int:=0;
	temp int;
	dig int;
BEGIN
	temp:=num;
	while(temp!=0)
	loop
		dig:=MOD(temp,10);
		rev:=(rev*10)+dig;
		temp:=temp/10;
	end loop;
	if(rev=num) then
		dbms_output.put_line('Number is palindrome ');
	else
		dbms_output.put_line('Number is  NOT palindrome ');
	end if;
	
END;
/