CREATE DATABASE DB2;
USE DB2;

CREATE TABLE BOAT (
	BID integer(2) primary key,
	BNAME char(10),
	COLOUR char(5)
);

CREATE TABLE SAILOR (
	SID integer(2) primary key,
	SNAME char(7),
	AGE integer(2),
	RATING integer(1)
);

CREATE TABLE RESERVES (
	BID integer(2),
	SID integer(2),
	DAY char(3),
	primary key (BID, SID),
	foreign key (BID) references BOAT (BID) on delete cascade,
	foreign key (SID) references SAILOR (SID) on delete cascade
);

INSERT INTO BOAT (BID, BNAME, COLOUR) values (1, 'SS.ANNE', 'BLUE'), (2, 'SS.TIDAL', 'RED'), (3, 'SS.JOE', 'GREEN'), (4,  'TT.ANNE', 'RED'), (5, 'TT.TIDAL', 'GREEN'), (6, 'TT.JOE', 'BLUE'), (7, 'R. JOE', 'RED');

INSERT INTO SAILOR (SID, SNAME, AGE, RATING) values (11, 'JACK', 22, 4), (12, 'RAM', 24, 4), (13, 'LUBBER', 19, 5), (14, 'JESSE', 27, 5), (15, 'GEORGE', 20, 3);

INSERT INTO RESERVES (BID, SID, DAY) values (1, 12, 'SAT'), (1, 11, 'TUE'), (1, 13, 'FRI'), (1, 14, 'SUN'),(1, 15, 'WED'), (6, 12, 'WED'), (2, 11, 'SUN'), (3, 15, 'THU'), (4, 13, 'MON'), (7, 13, 'TUE'), (5, 14, 'FRI');

SELECT * from BOAT;

SELECT * from SAILOR;

SELECT * from RESERVES;

/*Answer1:Obtain the bid of the boats reserved by ‘Ram’*/ 
SELECT BID from RESERVES where SID in (select SID from SAILOR where SNAME = 'RAM');

/*Answer2:Retrieve the bid of the boats reserved by all the sailors.*/
SELECT BID, SNAME FROM RESERVES JOIN SAILOR ON (RESERVES.SID = SAILOR.SID) order by BID;

/*Answer3:find the colours of boats reserved by luber*/
SELECT COLOUR, BNAME from BOAT, SAILOR, RESERVES where BOAT.BID = RESERVES.BID AND SAILOR.SID = RESERVES.SID AND SAILOR.SNAME = 'LUBBER';

/*Answer4:Find the names of sailors who have reserved boat 103*/
SELECT SNAME from SAILOR, BOAT, RESERVES where SAILOR.SID =  RESERVES.SID AND BOAT.BID = RESERVES.BID AND BNAME = 'SS.ANNE';

/*Answer5Find the number of boats reserved by each sailor*/
SELECT COUNT(BID) as NSHIPS, SID from RESERVES group by SID;

DROP DATABASE DB2;
 database db2
