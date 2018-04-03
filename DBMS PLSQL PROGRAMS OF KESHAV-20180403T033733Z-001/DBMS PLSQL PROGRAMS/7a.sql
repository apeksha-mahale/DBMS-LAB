SET SERVEROUTPUT ON
DECLARE
	num number:=&n;
	i number;
	flag number:=1;
BEGIN
	i:=num-1;
	while(i>1) 
	loop
		if(MOD(num,i) = 0)then 
			flag:=0;
		end if; 
		i:=i-1;
	end loop;
	if(flag=1) then  
		dbms_output.put_line(num||' IS PRIME'); 
	elsif(flag=0) then  
		dbms_output.put_line(num||' IS NOT PRIME'); 
	end if; 
END; 
/