create table e
 (
 ssn varchar(6),
 name varchar(10),
 deptno int,
 salary int,
 primary key(ssn)
 );

 insert into e
 values('01','abc',10,1000);

 insert into e
 values('02','xyz',20,2000);

 insert into e
 values('03','pqr',30,3000);

 insert into e
 values('04','lmn',40,2000);

 select * from e;

set serveroutput on

BEGIN
	update e
	set salary=(1.15*salary) where deptno=10;
	dbms_output.put_line('number of rows updated are'||sql%rowcount);

END;
/

select * from e;