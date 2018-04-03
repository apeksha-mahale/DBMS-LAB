CREATE TABLE PART(
	PNO integer(5) primary key,
	PNAME char(10),
	COLOUR char(10)
);

CREATE TABLE WAREHOUSE(
	WNO integer(5) primary key,
	WNAME char(10),
	CITY char(10)
);

CREATE TABLE SHIPMENT(
        PNO integer(5),
	WNO integer(5),
	QUANTITY integer(10),
	DATTE varchar(10),
	primary key (PNO,WNO),
	foreign key (PNO) references PART(PNO) on delete cascade,
	foreign key (WNO) references WAREHOUSE (WNO) on delete cascade
);

INSERT INTO PART(PNO,PNAME,COLOUR) VALUES (1,'tire','red'),(2,'bolt','blue'),(3,'window','red'),(4,'steering','black'),(5,'bolt','grey');
INSERT INTO WAREHOUSE(WNO,WNAME,CITY) VALUES (1,'antos autoshop','bangalore'),(2,'rock roads','mumbai'),(3,'johns cars','pune');
INSERT INTO SHIPMENT(PNO,WNO,QUANTITY,DATTE) VALUES (1,2,300,'28-feb-2016'),(2,1,200,'23-mar-2016'),(3,3,600,'28-oct-2016'),(4,2,300,'28-jan-2016'),(5,1,100,'28-nov-2016');
/*a) OBTAIN THE NAMES OF WREHOUSES WHICH HAVE SHIPPED RED COLOURED PARTS*/
SELECT WNAME FROM WAREHOUSE WHERE WNO IN(SELECT WNO FROM SHIPMENT WHERE PNO IN(SELECT PNO FROM PART WHERE COLOUR='red'));

/*b)RETRIEVE THE PNO OF PARTS SHIPPED BY ALL WAREHOUDSES*/

SELECT PNO,WNAME FROM SHIPMENT S JOIN WAREHOUSE W ON (S.WNO=W.WNO);

/*C)FIND THE NO. OF PARTS SUPPLIED BY EACH WAREHOUSES*/
SELECT WNO ,COUNT(*) AS 'COUNT' FROM SHIPMENT GROUP BY WNO;

