create table  employee1(ssn varchar(20),name char(20),deptno number(10),salary int,primary key(ssn));

insert into employee1 values(1,'pra',10,1000);
insert into employee1values(2,'aaa',20,2000);
insert into employee1 values(3,'bbb',10,4000);
insert into employee1 values(4,'cc',30,10000);
insert into employee1 values(5,'bgg',10,2000);

select *from employee1;


SET SERVEROUTPUT ON;

DECLARE
	cursor cur is select *from employee1;
	rows employee1%rowtype;
	t int;

BEGIN
	open cur;
	t:= &t1;
	loop 
		fetch cur into rows;
		exit when cur%notfound;
		if rows.deptno=t
		then
			dbms_output.put_line('the ssn and names are '|| rows.ssn ||','||rows.name);
		end if;
	end loop;
	close cur;

END;
/