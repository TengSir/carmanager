
/* Drop Tables */

DROP TABLE ADMINUSER;
DROP TABLE MESSAGE;
DROP TABLE CAR;
DROP TABLE NEWS;
DROP TABLE USERS;




/* Create Tables */

CREATE TABLE ADMINUSER
(
	USERID INT NOT NULL,
	USERNAME VARCHAR(20) NOT NULL,
	PASSWORD VARCHAR(20) NOT NULL,
	NICKNAME VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(20) NOT NULL,
	PRIMARY KEY (USERID)
);


CREATE TABLE CAR
(
	CARID INT NOT NULL,
	IMAGE VARCHAR(200),
	CARNAME VARCHAR(20) NOT NULL,
	SERIES VARCHAR(20) NOT NULL,
	SHOUJIA FLOAT,
	XINGSHILICHENG FLOAT NOT NULL,
	COLOR VARCHAR(20),
	PAILIANG VARCHAR(10),
	LEIXING VARCHAR(20),
	SUOZAIDI VARCHAR(20),
	PRIMARY KEY (CARID)
);


CREATE TABLE MESSAGE
(
	MESSAGEID INT NOT NULL AUTO_INCREMENT,
	CONTENT VARCHAR(2000) NOT NULL,
	USERNAME VARCHAR(20) NOT NULL,
	PINGLUNSHIJIAN VARCHAR(20),
	DIANZANLIANGG INT DEFAULT 0,
	CARID INT NOT NULL,
	PRIMARY KEY (MESSAGEID)
);


CREATE TABLE NEWS
(
	NEWSID INT NOT NULL,
	TITLE VARCHAR(20) NOT NULL,
	CONTENT TEXT NOT NULL,
	FABUSHIJIAN VARCHAR(30) NOT NULL,
	YUEDULIANG INT DEFAULT 0,
	PRIMARY KEY (NEWSID)
);


CREATE TABLE USERS
(
	USERID INT NOT NULL,
	USERNAME VARCHAR(20) NOT NULL,
	PASSWORD VARCHAR(20) NOT NULL,
	NICKNAME VARCHAR(20) NOT NULL,
	SEX CHAR(2) NOT NULL,
	AGE INT,
	TEL VARCHAR(20),
	EMAIL VARCHAR(20) NOT NULL,
	PRIMARY KEY (USERID)
);



/* Create Foreign Keys */

ALTER TABLE MESSAGE
	ADD FOREIGN KEY (CARID)
	REFERENCES CAR (CARID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



