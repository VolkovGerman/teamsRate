# Tasks schema

# --- !Ups

CREATE SEQUENCE user_id_seq;
CREATE TABLE USER (
  id integer NOT NULL DEFAULT nextval('user_id_seq') PRIMARY KEY,
  NAME VARCHAR NOT NULL,
  SURNAME VARCHAR NOT NULL,
  PHOTO_URL VARCHAR NOT NULL,
  GP VARCHAR NOT NULL
);

INSERT INTO USER (name, surname, photo_url, gp) VALUES ('German', 'Volkov', 'nourl', '11111');
INSERT INTO USER (name, surname, photo_url, gp) VALUES ('Vadim', 'Benkovski', 'nourl', '22222');
INSERT INTO USER (name, surname, photo_url, gp) VALUES ('Rita', 'Alnordovna', 'nourl', '33333');

CREATE SEQUENCE team_id_seq;
CREATE TABLE TEAM (
  ID INTEGER NOT NULL DEFAULT nextval('team_id_seq') PRIMARY KEY,
  NAME VARCHAR NOT NULL,
  DESCR VARCHAR NOT NULL,
  CREATOR_ID INTEGER NOT NULL
);

INSERT INTO TEAM (NAME, DESCR, CREATOR_ID) VALUES ('OneWayUp', 'Cool team from BIT-CUP 2016!', 1);
INSERT INTO TEAM (NAME, DESCR, CREATOR_ID) VALUES ('Bayern Munich', 'Football team from Germany!', 2);
INSERT INTO TEAM (NAME, DESCR, CREATOR_ID) VALUES ('BSUIR', 'University in Minsk!', 1);

CREATE SEQUENCE member_id_seq;
CREATE TABLE MEMBER (
  ID INTEGER NOT NULL DEFAULT nextval('member_id_seq') PRIMARY KEY,
  USER_ID INTEGER NOT NULL,
  TEAM_ID INTEGER NOT NULL,
  POINTS INTEGER NOT NULL DEFAULT 0
);

INSERT INTO MEMBER (USER_ID, TEAM_ID) VALUES (1, 1);
INSERT INTO MEMBER (USER_ID, TEAM_ID) VALUES (1, 3);
INSERT INTO MEMBER (USER_ID, TEAM_ID) VALUES (2, 2);
INSERT INTO MEMBER (USER_ID, TEAM_ID) VALUES (2, 1);

CREATE SEQUENCE task_id_seq;
CREATE TABLE TASK (
  ID INTEGER NOT NULL DEFAULT nextval('task_id_seq') PRIMARY KEY,
  TEAM_ID INTEGER NOT NULL,
  CREATOR_ID INTEGER NOT NULL,
  PERFORMER_ID INTEGER NOT NULL,
  TEXT VARCHAR NOT NULL,
  DEADLINE VARCHAR NOT NULL,
  STATUS INTEGER NOT NULL,
  POINTS INTEGER NOT NULL
);

INSERT INTO TASK (TEXT, DEADLINE, TEAM_ID, CREATOR_ID, PERFORMER_ID, STATUS, POINTS) VALUES ('do dishes', '02.04.2016', 2, 1, 0, 0, 10);
INSERT INTO TASK (TEXT, DEADLINE, TEAM_ID, CREATOR_ID, PERFORMER_ID, STATUS, POINTS) VALUES ('make description of teamsrate', '05.04.2016', 2, 1, 0, 0, 10);
INSERT INTO TASK (TEXT, DEADLINE, TEAM_ID, CREATOR_ID, PERFORMER_ID, STATUS, POINTS) VALUES ('make first page styles', '02.04.2016', 3, 1, 0, 0, 10);
INSERT INTO TASK (TEXT, DEADLINE, TEAM_ID, CREATOR_ID, PERFORMER_ID, STATUS, POINTS) VALUES ('link bio with smth', '03.04.2016', 3, 1, 0, 0, 10);

# --- !Downs

drop table USER;
DROP SEQUENCE user_id_seq;

drop table TEAM;
DROP SEQUENCE team_id_seq;

drop table MEMBERS;
DROP SEQUENCE member_id_seq;

drop table TASK;
DROP SEQUENCE member_id_seq;