drop table ACCOUNT;
drop table CUSTOMER;
drop table BRANCH;


create table BRANCH
(CODE varchar(10) primary key, NAME varchar(10), ASSETS number(10));

create table CUSTOMER
(SSN number(5) primary key, NAME varchar(10), PLACE varchar(10));

create table ACCOUNT
(ACCNO varchar(5), SSN number(5) references CUSTOMER(SSN) on delete cascade, CODE varchar(10) references BRANCH(CODE) on delete cascade, BALANCE number(10), primary key(ACCNO,SSN,CODE));

insert into BRANCH values('B1','MSR',10000);
insert into BRANCH values('B2','RNR',20000);
insert into BRANCH values('B3','SMR',15000);
insert into BRANCH values('B4','SKR',25000);

insert into CUSTOMER values(1,'RAM','BNG');
insert into CUSTOMER values(2,'ASHA','MNG');
insert into CUSTOMER values(3,'USHA','MYS');
insert into CUSTOMER values(4,'SRI','DEL');

insert into ACCOUNT values('A1',1,'B1',100000);
insert into ACCOUNT values('A2',1,'B1',200000);
insert into ACCOUNT values('A3',2,'B2',100000);
insert into ACCOUNT values('A4',3,'B2',100000);
insert into ACCOUNT values('A5',3,'B2',100000);
insert into ACCOUNT values('A6',3,'B2',100000);
insert into ACCOUNT values('A7',4,'B2',200000);

select * from BRANCH;
select * from CUSTOMER;
select * from ACCOUNT;

DECLARE
	CURSOR CC IS 
	SELECT * FROM BRANCH;
	V_CC CC%ROWTYPE;
BEGIN
	OPEN CC;
	LOOP
		FETCH CC INTO V_CC ;
		EXIT WHEN CC %NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('CODE  '||V_CC.CODE  ||' NAME  '||V_CC.NAME  ||' ASSETS  '||V_CC.ASSETS);
	END LOOP;
	CLOSE CC;
END;
/

DECLARE
	CURSOR CC1 IS 
	SELECT * FROM CUSTOMER;
	V_CC1 CC1%ROWTYPE;
BEGIN
	OPEN CC1;
	LOOP
		FETCH CC1 INTO V_CC1;
		EXIT WHEN CC1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('SSN  '||V_CC1.SSN  ||' NAME  '||V_CC1.NAME  ||' PLACE  '||V_CC1.PLACE);
	END LOOP;
	CLOSE CC1;
END;
/

DECLARE
	CURSOR CC2 IS 
	SELECT * FROM account;
	V_CC2 CC2%ROWTYPE;
BEGIN
	OPEN CC2;
	LOOP
		FETCH CC2 INTO V_CC2;
		EXIT WHEN CC2%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(' ACCNO  '||V_CC2.accno  ||' SSN  '||V_CC2.ssn  ||' CODE  '||V_CC2.code ||' BALANCE '||V_CC2.balance);
	END LOOP;
	CLOSE CC2;
END;
/

DECLARE
BEGIN
	UPDATE ACCOUNT
	SET BALANCE=BALANCE+(BALANCE*0.1)
	WHERE SSN=1;
	COMMIT;
	END;
/

select * from ACCOUNT;