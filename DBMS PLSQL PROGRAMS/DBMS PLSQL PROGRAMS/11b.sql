create table  employee(ssn varchar(20),name char(20),deptno number(10),salary int,primary key(ssn));

insert into employee values(1,'pra',10,1000);
insert into employee values(2,'aaa',20,2000);
insert into employee values(3,'bbb',10,4000);
insert into employee values(4,'cc',30,10000);
insert into employee values(5,'bgg',10,2000);

select *from employee;


CREATE OR REPLACE TRIGGER STOP
BEFORE UPDATE OR DELETE OR INSERT ON employee
FOR EACH ROW
    DECLARE
        E EXCEPTION;
        TODAY DATE:=SYSDATE;
        CURRENT VARCHAR2(20);
    BEGIN
        CURRENT:=TO_CHAR(TODAY,'DAY');
        CURRENT:=RTRIM(CURRENT);
        IF (CURRENT='SUNDAY' OR CURRENT='FRIDAY') THEN
            RAISE E;
        END IF;
    EXCEPTION
        WHEN E THEN
            RAISE_APPLICATION_ERROR( -20500, 'not allowed', FALSE );
    END;
/