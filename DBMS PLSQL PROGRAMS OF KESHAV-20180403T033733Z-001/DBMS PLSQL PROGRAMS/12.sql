create table EMPLOYEE
(SSN number(10)not null primary key, NAME varchar(20), DEPTNO number(5));

create table PROJECT
(PROJNO number(5) not null primary key, PROJAREA varchar(20));

create table ASSIGNTO
(SSN number(10) references EMPLOYEE(SSN),PROJNO number(5) references PROJECT(PROJNO),primary key(SSN,PROJNO));

insert into EMPLOYEE values
(001,'Olivia Cruz',1);
insert into EMPLOYEE values
(002,'Marjorie Wells',2);
insert into EMPLOYEE values
(003,'Alicia Mitchell',3);
insert into EMPLOYEE values
(004,'Terri Ramos',4);
insert into EMPLOYEE values
(005,'Jeffrey Goodwin',5);
insert into EMPLOYEE values
(006,'Megan Park',2);
insert into EMPLOYEE values
(007,'Marian Hodges',4);
insert into EMPLOYEE values
(008,'Cindy Flores',1);
insert into EMPLOYEE values
(009,'Eunice Love',3);
insert into EMPLOYEE values
(010,'Danielle Aguilar',5);
insert into EMPLOYEE values
(011,'Sharon Nguyen',4);
insert into EMPLOYEE values
(012,'Kristen Cobb',1);
insert into EMPLOYEE values
(013,'Rodney Frank',3);
insert into EMPLOYEE values
(014,'Brendan Guzman',2);
insert into EMPLOYEE values
(015,'Pete Tran',5);
insert into EMPLOYEE values
(016,'Brooke Brock',3);
insert into EMPLOYEE values
(017,'Lila Castillo',4);
insert into EMPLOYEE values
(018,'Randall Martinez',2);
insert into EMPLOYEE values
(019,'Shirley Andrews',5);
insert into EMPLOYEE values
(020,'George Phillips',1);

insert into PROJECT values
(020,'Database');
insert into PROJECT values
(021,'Algorithm Design');
insert into PROJECT values
(022,'System Networking');
insert into PROJECT values
(023,'Software Design');
insert into PROJECT values
(024,'Database');
insert into PROJECT values
(025,'Algorithm Design');
insert into PROJECT values
(026,'Debugging');
insert into PROJECT values
(027,'Virtual Reality');
insert into PROJECT values
(028,'Data Mining');
insert into PROJECT values
(029,'Cloud Computing');

insert into ASSIGNTO values
(001,020);
insert into ASSIGNTO values
(002,021);
insert into ASSIGNTO values
(003,022);
insert into ASSIGNTO values
(004,023);
insert into ASSIGNTO values
(005,024);
insert into ASSIGNTO values
(006,025);
insert into ASSIGNTO values
(007,026);
insert into ASSIGNTO values
(008,027);
insert into ASSIGNTO values
(009,028);
insert into ASSIGNTO values
(010,029);
insert into ASSIGNTO values
(011,020);
insert into ASSIGNTO values
(012,021);
insert into ASSIGNTO values
(013,022);
insert into ASSIGNTO values
(014,023);
insert into ASSIGNTO values
(015,024);
insert into ASSIGNTO values
(016,025);
insert into ASSIGNTO values
(017,026);
insert into ASSIGNTO values
(018,027);
insert into ASSIGNTO values
(019,028);
insert into ASSIGNTO values
(001,029);
insert into ASSIGNTO values
(002,028);
insert into ASSIGNTO values
(003,027);
insert into ASSIGNTO values
(004,026);
insert into ASSIGNTO values
(005,025);
insert into ASSIGNTO values
(006,024);
insert into ASSIGNTO values
(007,023);
insert into ASSIGNTO values
(008,022);
insert into ASSIGNTO values
(009,021);
insert into ASSIGNTO values
(010,020);
insert into ASSIGNTO values
(011,029);
insert into ASSIGNTO values
(012,028);
insert into ASSIGNTO values
(013,027);
insert into ASSIGNTO values
(014,026);
insert into ASSIGNTO values
(015,025);
insert into ASSIGNTO values
(016,024);
insert into ASSIGNTO values
(017,023);
insert into ASSIGNTO values
(018,022);
insert into ASSIGNTO values
(019,021);
insert into ASSIGNTO values
(001,023);
insert into ASSIGNTO values
(002,026);
insert into ASSIGNTO values
(003,029);
insert into ASSIGNTO values
(004,022);
insert into ASSIGNTO values
(005,027);
insert into ASSIGNTO values
(006,028);
insert into ASSIGNTO values
(007,021);
insert into ASSIGNTO values
(008,024);
insert into ASSIGNTO values
(009,027);
insert into ASSIGNTO values
(001,026);
insert into ASSIGNTO values
(002,024);
insert into ASSIGNTO values
(001,028);
insert into ASSIGNTO values
(001,025);

select EMPLOYEE.SSN 
from EMPLOYEE, ASSIGNTO, PROJECT
where EMPLOYEE.SSN=ASSIGNTO.SSN and
PROJECT.PROJNO=ASSIGNTO.PROJNO and 
PROJECT.PROJAREA='Database';

select DEPTNO, count(SSN)
from EMPLOYEE
group by DEPTNO;

update ASSIGNTO set PROJNO=20 where SSN=1;

select SSN from ASSIGNTO where PROJNO=22
UNION
select SSN from ASSIGNTO where PROJNO=24;

select EMPLOYEE.NAME 
from EMPLOYEE, ASSIGNTO, PROJECT
where EMPLOYEE.SSN=ASSIGNTO.SSN and
PROJECT.PROJNO=ASSIGNTO.PROJNO and 
PROJECT.PROJAREA='Database';