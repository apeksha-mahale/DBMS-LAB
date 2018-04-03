create table BRANCH
(CODE varchar(10) primary key, NAME varchar(10), ASSETS number(10));

create table CUSTOMER
(SSN number(5) primary key,NAME varchar(10), PLACE varchar(10));

create table ACCOUNT
(ACCNO varchar(5), SSN number(5) references CUSTOMER(SSN), CODE varchar(10) references BRANCH(CODE), BALANCE number(10), primary key(ACCNO,SSN,CODE));

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