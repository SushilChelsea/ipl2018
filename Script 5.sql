-------------------------------------------------
--    SELECT ALL SCRIPT AND RUN F5
--    (CTRL+A) THEN F5
-------------------------------------------------

--------- DROP TABLE sp_tbl_team if exits ---------
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE sp_tbl_team PURGE';
  EXCEPTION WHEN Others THEN NULL;
END;
/
------------- CREATING TABLE sp_tbl_team ------------------
CREATE TABLE sp_tbl_team(
	team_id 	  VARCHAR2(255) PRIMARY KEY,
	team_name 	VARCHAR2(255)
);

---------------- INSERTING VALUES INTO A TABLE ----------------
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('MI','Mumbai Indians');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('CSK','Chennai Super Kings');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('DD','Delhi Daredevils');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('KXIP','Kings XI Punjab');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('RCB','Royal Challengers Bangalore');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('KKR','Kolkata Knight Riders');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('RR','Rajasthan Royals');
INSERT INTO sp_tbl_team (team_id,team_name) VALUES ('SRH','Sunrisers Hyderabad');

COMMIT;

-- SELECT * FROM sp_tbl_team;

--------- DROP TABLE sp_tbl_match if exits ---------
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE sp_tbl_match PURGE';
  EXCEPTION WHEN Others THEN NULL;
END;
/
------------- CREATING TABLE sp_tbl_match ------------------
CREATE TABLE sp_tbl_match(
	match_id        NUMBER PRIMARY KEY,
	home_team_id    VARCHAR2(255),
	away_team_id    VARCHAR2(255),
	fi_team_id		  VARCHAR2(255),                -- fi -> first inning playing team
	fi_team_run   	NUMBER,
	fi_team_wicket 	NUMBER,
	fi_team_over  	NUMBER(5,2),
	si_team_id 	    VARCHAR2(255),             -- si -> second inning playing team
	si_team_run   	NUMBER,
	si_team_wicket 	NUMBER,
	si_team_over  	NUMBER(5,2),
	dls             NUMBER  DEFAULT 0 NOT NULL,
	dls_target	    NUMBER  DEFAULT 0 NOT NULL,
	stage           VARCHAR(5) DEFAULT 'l'
);

---------------- INSERTING VALUES INTO A TABLE ----------------
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(1,'MI','CSK','MI',165,4,20,'CSK',169,9,19.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(2,'KXIP','DD','DD',166,7,20,'KXIP',167,4,18.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(3,'KKR','RCB','RCB',176,7,20,'KKR',177,6,18.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(4,'SRH','RR','RR',125,9,20,'SRH',127,1,15.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(5,'CSK','KKR','KKR',202,6,20,'CSK',205,5,19.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,dls,dls_target) VALUES(6,'RR','DD','RR',153,5,17.5,'DD',60,4,6,1,70);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(7,'SRH','MI','MI',147,8,20,'SRH',151,9,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(8,'RCB','KXIP','KXIP',155,10,19.2,'RCB',159,6,19.3);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(9,'MI','DD','MI',194,7,20,'DD',195,3,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(10,'KKR','SRH','KKR',138,8,20,'SRH',139,5,19);

Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(11,'RCB','RR','RR',217,4,20,'RCB',198,6,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(12,'KXIP','CSK','KXIP',197,7,20,'CSK',193,5,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(13,'KKR','DD','KKR',200,9,20,'DD',129,10,14.2);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(14,'MI','RCB','MI',213,6,20,'RCB',167,8,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(15,'RR','KKR','RR',160,8,20,'KKR',163,3,18.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(16,'KXIP','SRH','KXIP',193,3,20,'SRH',178,4,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(17,'CSK','RR','CSK',204,5,20,'RR',140,10,18.3);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,dls,dls_target) VALUES(18,'KKR','KXIP','KKR',191,7,20,'KXIP',126,1,11.1,1,81);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(19,'RCB','DD','DD',174,5,20,'RCB',176,4,18);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(20,'SRH','CSK','CSK',182,3,20,'SRH',178,6,20);

Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(21,'RR', 'MI','MI',167,7,20,'RR',168,7,19.4);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(22,'DD','KXIP','KXIP',143,8,20,'DD',139,8,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(23,'MI','SRH','SRH',118,10,18.4,'MI',87,10,18.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(24,'RCB','CSK','RCB',205,8,20,'CSK',207,5,19.4);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(25,'SRH','KXIP','SRH',132,6,20,'KXIP',119,10,19.2);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(26,'DD','KKR','DD',219,4,20,'KKR',164,9,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(27,'CSK','MI','CSK',169,5,20,'MI',170,2,19.4);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(28,'RR','SRH','SRH',151,7,20,'RR',140,6,20);

Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(29,'RCB','KKR','RCB',175,4,20,'KKR',176,4,19.1);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(30,'CSK','DD','CSK',211,4,20,'DD',198,5,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(31,'RCB','MI','RCB',167,7,20,'MI',153,7,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,dls,dls_target) VALUES(32,'DD','RR','DD',196,6,17.1,'RR',146,5,12,1,150);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(33,'KKR','CSK','CSK',177,5,20,'KKR',180,4,17.4);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(34,'KXIP','MI','KXIP',174,6,20,'MI',176,4,19);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(35,'CSK','RCB','RCB',127,9,20,'CSK',128,4,18);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(36,'SRH','DD','DD',163,5,20,'SRH',164,3,19.5);

Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(37,'MI','KKR','MI',181,4,20,'KKR',168,6,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(38,'KXIP','RR','RR',152,9,20,'KXIP',155,4,18.4);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(39,'SRH','RCB','SRH',146,10,20,'RCB',141,6,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(40,'RR','KXIP','RR',158,8,20,'KXIP',143,7,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(41,'KKR','MI','MI',210,6,20,'KKR',108,10,18.1);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(42,'DD','SRH','DD',187,5,20,'SRH',191,1,18.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(43,'RR','CSK','CSK',176,4,20,'RR',177,6,19.5);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(44,'KXIP','KKR','KKR',245,6,20,'KXIP',214,8,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(45,'DD','RCB','DD',181,4,20,'RCB',187,5,19);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(46,'CSK','SRH','SRH',179,4,20,'CSK',180,2,19);

Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(47,'MI','RR','MI',168,6,20,'RR',171,3,18);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(48,'KXIP','RCB','KXIP',88,10,15.1,'RCB',92,0,8.1);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(49,'KKR','RR','RR',142,10,19,'KKR',145,4,18);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(50,'MI','KXIP','MI',186,8,20,'KXIP',183,5,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(51,'RCB','SRH','RCB',218,6,20,'SRH',204,3,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(52,'DD','CSK','DD',162,5,20,'CSK',128,6,20);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(53,'RR','RCB','RR',164,5,20,'RCB',134,10,19.2);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(54,'SRH','KKR','SRH',172,9,20,'KKR',173,5,19.4);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(55,'DD','MI','DD',174,4,20,'MI',163,10,19.3);
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over) VALUES(56,'CSK','KXIP','KXIP',153,10,19.4,'CSK',159,5,19.1);

COMMIT;
-- SELECT * FROM sp_tbl_match;

---- ADDING NEW ATTRIBUTE TO MATCH TABLE ----
ALTER TABLE sp_tbl_match
    ADD (
      tie           NUMBER DEFAULT 0 NOT NULL,
      nr            NUMBER DEFAULT 0 NOT NULL,
      winning_team  VARCHAR(10) DEFAULT NULL,
      remarks       VARCHAR(150) DEFAULT NULL
    );

COMMIT;

CREATE OR REPLACE PROCEDURE sp_update_match_tbl
AS
  v_match_id        NUMBER;
  v_team_a          VARCHAR2(255);
  v_team_b          VARCHAR2(255);
  v_run_a           NUMBER;
  v_run_b           NUMBER;
  v_wicket_a        NUMBER;
  v_wicket_b        NUMBER;
  v_tie			      	NUMBER;
  v_nr			      	NUMBER;
  v_dls			      	NUMBER;
  v_dls_target      NUMBER;
  v_winning_team  	VARCHAR2(255);
  v_remarks         VARCHAR2(255);
  v_temp_team       VARCHAR2(255);
  v_temp_run        NUMBER;
  v_temp_wicket     NUMBER;
  v_temp_over       NUMBER;
  v_full_form       VARCHAR2(255);

  CURSOR C1 IS
    SELECT * FROM sp_tbl_match;
BEGIN

  FOR rec in c1
    LOOP
      v_match_id  := rec.match_id;
      v_team_a    := rec.fi_team_id;
      v_team_b    := rec.si_team_id;
      v_run_a     := rec.fi_team_run;
      v_run_b     := rec.si_team_run;
      v_wicket_a  := rec.fi_team_wicket;
      v_wicket_b  := rec.si_team_wicket;
      v_tie       := rec.tie;
      v_nr        := rec.nr;
      v_dls       := rec.dls;
      v_dls_target := rec.dls_target;

--      finding winner team
      IF v_dls=1 THEN
        IF (v_run_b < v_dls_target) THEN
          v_winning_team:=v_team_a;
          SELECT team_name INTO v_full_form FROM sp_tbl_team WHERE team_id=v_winning_team;
          v_remarks:=v_full_form || ' won by ' || (v_dls_target - v_run_b) || ' runs (DLS method)';
        ELSE
          v_winning_team:=v_team_b;
          SELECT team_name INTO v_full_form FROM sp_tbl_team WHERE team_id=v_winning_team;
          v_remarks:=v_full_form || ' won by ' || (10 - v_wicket_b) || ' wicket (DLS method)';
        END IF;
      ELSE
        IF (v_run_a > v_run_b) THEN
          v_winning_team:=v_team_a;
          SELECT team_name INTO v_full_form FROM sp_tbl_team WHERE team_id=v_winning_team;
          v_remarks:=v_full_form || ' won by ' || (v_run_a - v_run_b) || ' runs';
        ELSIF (v_run_a < v_run_b) THEN
           v_winning_team:=v_team_b;
           SELECT team_name INTO v_full_form FROM sp_tbl_team WHERE team_id=v_winning_team;
           v_remarks:=v_full_form || ' won by ' || (10 - v_wicket_b) || ' wicket';
        ELSE
          v_tie:=1;          -- if no winner than it's a tie
          v_winning_team:='-';
          v_remarks:='Draw';
        END IF;
      END IF;

      IF( rec.fi_team_over < 5 AND rec.si_team_over < 5) THEN
        v_nr:=1;
        v_winning_team:='-';
        v_remarks:='NO RESULT';
      END IF;

      UPDATE sp_tbl_match
      SET tie=v_tie, nr=v_nr, winning_team=v_winning_team, remarks=v_remarks
      WHERE match_id=v_match_id;

    END LOOP;

END sp_update_match_tbl;
/

EXEC sp_update_match_tbl;

-- DROP TABLE sp_tbl_match;


----- function with input param1 as team_name, param2 as team_b_id and output as winner
CREATE OR REPLACE FUNCTION fn_get_winner(team_a IN VARCHAR2, team_b_id IN VARCHAR2)
RETURN VARCHAR2
AS
    v_away          VARCHAR2(50);
    v_home          VARCHAR2(50);
    v_home_team_id  VARCHAR2(10);
    v_winner        VARCHAR2(50);

BEGIN
    SELECT team_id
    INTO v_home_team_id
    FROM sp_tbl_team
    WHERE team_name=team_a;

    v_away:=team_b_id;
    SELECT winning_team INTO v_winner FROM sp_tbl_match WHERE home_team_id=v_home_team_id AND away_team_id=v_away AND stage='l';
    Dbms_Output.put_line(v_winner);
    RETURN v_winner;
END;
/

--DROP FUNCTION fn_get_winner;

--SELECT fn_get_winner('Kings XI Punjab', 'CSK')AS winner FROM dual;
--SELECT fn_get_winner('Chennai Super Kings', 'KXIP')AS winner FROM dual;

-------------- MATCH SUMMARY VIEW ---------------
CREATE OR REPLACE VIEW sp_vw_match_summary AS
SELECT team_name AS "Match summary", CSK, DD, KXIP, KKR, MI, RR, RCB, SRH
FROM
  (
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='MI'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='CSK'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='DD'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='RCB'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='RR'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='SRH'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='KKR'
    UNION
    SELECT team_name, fn_get_winner(team_name, 'CSK')CSK, fn_get_winner(team_name, 'DD')DD, fn_get_winner(team_name, 'KXIP')KXIP, fn_get_winner(team_name, 'KKR')KKR, fn_get_winner(team_name, 'MI')MI, fn_get_winner(team_name, 'RR')RR, fn_get_winner(team_name, 'RCB')RCB, fn_get_winner(team_name, 'SRH')SRH  FROM sp_tbl_team WHERE team_id='KXIP'

  )
ORDER BY team_name;

--SELECT * FROM sp_vw_match_summary;
--SELECT "Match summary" FROM sp_vw_match_summary;

--------- FUNCTION INPUT PARAM AS TEAM AND RETURN IT'S CORRESPONDING NRR -------
create or replace function sp_getNrr(team varchar2)
return number
IS
v_team_id             VARCHAR2(5);
v_team1_runscored     NUMBER(20);
v_team1_runscored1    NUMBER(20);
v_team1_runscored2    NUMBER(20);
v_team1_runconceded   NUMBER(20);
v_team1_runconceded1  NUMBER(20);
v_team1_runconceded2  NUMBER(20);
v_team1_overconceded  NUMBER(20);
v_team1_overfaced     DECIMAL(20,5);
v_ballsconceded       DECIMAL(20,5);
v_ballsfaced          DECIMAL(20,5);
v_team1_overbowled    DECIMAL(20,5);

BEGIN
  v_team1_runscored := 0;
  v_team1_runscored1 := 0;
  v_team1_runscored2 := 0;
  v_team1_runconceded := 0;
  v_team1_runconceded1 := 0;
  v_team1_runconceded2 := 0;
  v_team1_overconceded := 0;
  v_team1_overfaced := 0;
  v_ballsconceded := 0;
  v_ballsfaced := 0;
  v_team1_overbowled := 0;


  SELECT team_id INTO v_team_id FROM sp_tbl_team WHERE team_name=team;
  Dbms_Output.put_line(v_team_id);

--SELECT * FROM sp_tbl_match
--select nvl(sum(fi_team_run),0) FROM sp_tbl_match WHERE si_team_id = 'CSK'
--select nvl(sum(fi_team_run),0) into v_team1_runscored1 from sp_tbl_match WHERE fi_team_id = 'CSK';
select nvl(sum(fi_team_run),0) INTO v_team1_runscored1 FROM sp_tbl_match WHERE fi_team_id = v_team_id AND stage='l';
select nvl(sum(si_team_run),0) INTO v_team1_runscored2 FROM sp_tbl_match WHERE si_team_id = v_team_id AND stage='l';

Dbms_Output.put_line(v_team1_runscored1 || ' ' || v_team1_runscored2);
v_team1_runscored := v_team1_runscored1 + v_team1_runscored2;

select nvl(sum(fi_team_run),0) INTO v_team1_runconceded1 FROM sp_tbl_match WHERE si_team_id = v_team_id AND stage='l';
select nvl(sum(si_team_run),0) INTO v_team1_runconceded2 FROM sp_tbl_match WHERE fi_team_id = v_team_id AND stage='l';

v_team1_runconceded := v_team1_runconceded1 + v_team1_runconceded2;

SELECT sum(trunc(over))*6 + sum(over - trunc(over))*10 as ballfaced into v_ballsfaced
from (
		SELECT CASE WHEN fi_team_wicket = 10 then 20 else fi_team_over END AS over
		FROM sp_tbl_match WHERE fi_team_id = v_team_id AND stage='l'
		union all
		SELECT CASE WHEN si_team_wicket = 10 then 20 else si_team_over END AS over
		FROM sp_tbl_match WHERE si_team_id = v_team_id AND stage='l'
	);

v_team1_overfaced := trunc(v_ballsfaced/6) + mod(v_ballsfaced,6)/10;

select sum(trunc(over))*6+sum(over - trunc(over))*10 as ballbowled into v_ballsconceded
from (
		SELECT CASE WHEN  si_team_wicket = 10 then 20 else si_team_over END AS over
    FROM sp_tbl_match WHERE fi_team_id = v_team_id AND stage='l'
		union all
		SELECT CASE WHEN  fi_team_wicket = 10 then 20 else fi_team_over END AS over
		FROM sp_tbl_match WHERE si_team_id = v_team_id AND stage='l'
	);

v_team1_overbowled := trunc(v_ballsconceded/6) + mod(v_ballsconceded,6)/10;

RETURN (v_team1_runscored/v_team1_overfaced)-(v_team1_runconceded/v_team1_overbowled);

end;
/

--SELECT  Round(sp_getNrr('Mumbai Indians'),3) FROM dual;
--SELECT  sp_getNrr('Chennai Super Kings') FROM dual;
--SELECT  sp_getNrr('Sunrisers Hyderabad') FROM dual;
--SELECT  sp_getNrr('Kings XI Punjab') FROM dual;
--SELECT  sp_getNrr('Kolkata Knight Riders') FROM dual;
--SELECT  sp_getNrr('Rajasthan Royals') FROM dual;
--SELECT  sp_getNrr('Royal Challengers Bangalore') FROM dual;

--DROP FUNCTION sp_getNrr;


-- View for League Table
CREATE OR REPLACE VIEW sp_vw_league_table AS
SELECT t1.team AS team, To_Char(pld1+pld2) AS pld,To_Char(W)AS W,To_Char((pld1+pld2)-W)AS L,To_Char(tie)AS t, To_Char(nr)AS nr,To_Char((W*2))AS pts,To_Char(Round(sp_getNrr(t1.team),3))AS nrr
FROM
(
  (SELECT t.team_name AS team, Count(m.home_team_id)AS pld1 FROM sp_tbl_match m JOIN sp_tbl_team t ON m.home_team_id=t.team_id WHERE m.stage='l' GROUP BY t.team_name) t1
    JOIN
  (SELECT t.team_name AS team, Count(m.away_team_id)AS pld2 FROM sp_tbl_match m JOIN sp_tbl_team t ON m.away_team_id=t.team_id WHERE m.stage='l' GROUP BY t.team_name) t2 ON t1.team=t2.team
    JOIN
  (SELECT sum(m.tie)AS tie, t.team_name AS team FROM sp_tbl_match m JOIN sp_tbl_team t ON m.home_team_id=t.team_id WHERE m.stage='l' GROUP BY t.team_name)t3 ON t1.team=t3.team
    JOIN
  (SELECT t.team_name AS team, m.winning_team, Count(m.winning_team)AS W FROM sp_tbl_match m JOIN sp_tbl_team t ON m.winning_team=t.team_id WHERE m.stage='l' GROUP BY winning_team,t.team_name ORDER BY W desc)t4 ON t1.team=t4.team
    JOIN
  (SELECT t.team_name AS team, Sum(m.nr)AS nr FROM sp_tbl_match m JOIN sp_tbl_team t ON m.home_team_id=t.team_id WHERE m.stage='l' GROUP BY t.team_name)t5 ON t1.team=t5.team
)
ORDER BY pts DESC, nrr DESC;

--SELECT * FROM sp_vw_league_table;

------ INSERTING MATCH THAT ARE AFTER LEAGUE I.E Q1/E, Q2 AND FINAL
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,stage) VALUES(57,'SRH','CSK','SRH',139,7,20,'CSK',140,8,19.1,'Q1');
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,stage) VALUES(58,'KKR','RR','KKR',169,7,20,'RR',144,4,20,'E');
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,stage) VALUES(59,'SRH','KKR','SRH',174,7,20,'KKR',160,9,20,'Q2');
Insert INTO sp_tbl_match (match_id,home_team_id,away_team_id,fi_team_id,fi_team_run,fi_team_wicket,fi_team_over,si_team_id,si_team_run,si_team_wicket,si_team_over,stage) VALUES(60,'SRH','CSK','SRH',178,6,20,'CSK',181,2,18.3,'F');

--UPDATE sp_tbl_match
--SET stage='E' WHERE match_id=58
--SELECT * FROM sp_tbl_match;

----- AFTER NEW VALUES INSERTED EXEC PROCEDURE TO STORE IT'S CORRESPONDING INFORMATION i.e winner, tie, nr remarks
EXEC sp_update_match_tbl;

---- function that takes 2param, 1->team_name and 2-> game_number
---- according to input game_number while loop keeps executing and keep upading points and finally returns points
CREATE OR REPLACE FUNCTION sp_get_point(in_team VARCHAR2, in_game_no NUMBER)
RETURN NUMBER
AS
  v_team_id       VARCHAR2(50);
  v_game_counter  NUMBER;
  v_point         NUMBER;

  CURSOR c1 IS
    SELECT * FROM sp_tbl_match ;

BEGIN
    v_game_counter := 0;
    v_point  := 0;
--    SELECT team_id FROM sp_tbl_team WHERE team_name='Chennai Super Kings';
    SELECT team_id INTO v_team_id FROM sp_tbl_team WHERE team_name=in_team;

    WHILE v_game_counter <= in_game_no LOOP
--      Dbms_Output.put_line('inside while loop :' || v_game_counter || in_game_no);
      FOR rec IN c1 LOOP
        IF(rec.fi_team_id = v_team_id OR rec.si_team_id = v_team_id) THEN
          v_game_counter := v_game_counter + 1;
        END IF;
        IF(v_team_id = rec.winning_team) THEN
          v_point := v_point + 2;
        ELSE
          v_point := v_point;
        END IF;
--        Dbms_Output.put_line(v_game_counter);
--        Dbms_Output.put_line(v_point);
--      if input game_number matched just return
        IF(v_game_counter = in_game_no) THEN
          RETURN v_point;
        END IF;

      END LOOP;
    END LOOP;
--    Dbms_Output.put_line(v_point);
    RETURN v_point;
END;
/

----- function takes team_name and team stage as input and return w if winner and l if team is loser
CREATE OR REPLACE FUNCTION sp_get_playoff_result(in_team VARCHAR2, in_stage VARCHAR2)
RETURN varchar2
AS
  v_team_id       VARCHAR2(50);
  v_winning_team  VARCHAR2(50);
  v_batting       VARCHAR2(50);
  v_bowling       VARCHAR2(50);

BEGIN
    Dbms_Output.put_line(in_team|| ' ' || in_stage);
--    SELECT team_id FROM sp_tbl_team WHERE team_name='Chennai Super Kings';
    SELECT team_id INTO v_team_id FROM sp_tbl_team WHERE team_name=in_team;
    SELECT winning_team, fi_team_id, si_team_id INTO v_winning_team, v_batting, v_bowling FROM sp_tbl_match WHERE stage=in_stage;

    IF(v_batting != v_team_id AND v_bowling != v_team_id)THEN
      RETURN NULL;
    END IF;
    IF(v_team_id = v_winning_team) THEN
      RETURN 'W';
    ELSE
      RETURN 'L';
    END IF;
END;
/

--SELECT sp_get_playoff_result('Chennai Super Kings', 'Q1') FROM dual;

--SELECT sp_get_point('Mumbai Indians', 9) FROM dual;

--DROP FUNCTION sp_get_point;

----- creating league progression view
----- here league grp is left join to playoff
CREATE OR REPLACE VIEW sp_vw_league_progression AS
SELECT grp.team AS "League progression ->",grp.o AS "1", grp.t AS "2", grp.th AS "3", grp.f AS "4", grp.fi AS "5", grp.s AS "6", grp.se AS "7", grp.e AS "8", grp.n AS "9", grp.te AS "10", grp.el AS "11", grp.tw AS "12", grp.thr AS "13", grp.fteen AS "14",play.Q1 AS "Q1/E", play.Q2 AS Q2, play.f AS F
FROM
(
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='CSK'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='DD'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='KXIP'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='KKR'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='MI'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='RR'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='RCB'
  UNION ALL
  SELECT team_name AS team,To_Char(sp_get_point(team_name, 1))AS o,To_Char(sp_get_point(team_name, 2))AS t,To_Char(sp_get_point(team_name, 3))AS th, To_Char(sp_get_point(team_name, 4))AS f, To_Char(sp_get_point(team_name, 5))AS fi, To_Char(sp_get_point(team_name, 6))AS s, To_Char(sp_get_point(team_name, 7))AS se, To_Char(sp_get_point(team_name, 8))AS e, To_Char(sp_get_point(team_name, 9))AS n, To_Char(sp_get_point(team_name, 10))AS te,To_Char(sp_get_point(team_name, 11))AS el,To_Char(sp_get_point(team_name, 12))AS tw,To_Char(sp_get_point(team_name, 13))AS thr,To_Char(sp_get_point(team_name, 14))AS fteen FROM sp_tbl_team WHERE team_id='SRH'
)grp
LEFT JOIN
(
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'Q1')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='CSK'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'Q1')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='DD'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'Q1')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='KXIP'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'E')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='KKR'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'Q1')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='MI'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'E')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='RR'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'Q1')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='RCB'
  UNION ALL
  SELECT team_name AS team,sp_get_playoff_result(team_name, 'Q1')AS Q1, sp_get_playoff_result(team_name, 'Q2')AS Q2, sp_get_playoff_result(team_name, 'F')AS F FROM sp_tbl_team WHERE team_id='SRH'
)play ON grp.team=play.team
/
-- qualifier 1 view
CREATE OR REPLACE VIEW sp_vw_qualifier1 AS
SELECT team AS "Qualifier-1", score AS " "
FROM
(
SELECT t.team_name AS team, (fi_team_run||'/'||fi_team_wicket||' ('||fi_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.fi_team_id=t.team_id WHERE stage='Q1'
UNION ALL
SELECT t.team_name AS team, (si_team_run||'/'||si_team_wicket||' ('||si_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.si_team_id=t.team_id WHERE stage='Q1'
)
/
--SELECT * FROM sp_vw_qualifier1

-- eliminator view
CREATE OR REPLACE VIEW sp_vw_eliminator AS
SELECT team AS "Qualifier-1", score AS " "
FROM
(
SELECT t.team_name AS team, (fi_team_run||'/'||fi_team_wicket||' ('||fi_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.fi_team_id=t.team_id WHERE stage='E'
UNION ALL
SELECT t.team_name AS team, (si_team_run||'/'||si_team_wicket||' ('||si_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.si_team_id=t.team_id WHERE stage='E'
)
/
--SELECT * FROM sp_vw_eliminator

-- qualifier 2 view
CREATE OR REPLACE VIEW sp_vw_qualifier2 AS
SELECT team AS "Q2", score AS " "
FROM
(
SELECT fi_team_id AS team, (fi_team_run||'/'||fi_team_wicket||' ('||fi_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.fi_team_id=t.team_id WHERE stage='Q2'
UNION ALL
SELECT si_team_id AS team, (si_team_run||'/'||si_team_wicket||' ('||si_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.si_team_id=t.team_id WHERE stage='Q2'
)
/
-- SELECT * FROM sp_vw_qualifier2

-- final view
CREATE OR REPLACE VIEW sp_vw_final AS
SELECT team AS Final, score AS " "
FROM
(
SELECT t.team_name AS team, (fi_team_run||'/'||fi_team_wicket||' ('||fi_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.fi_team_id=t.team_id WHERE stage='F'
UNION ALL
SELECT t.team_name AS team, (si_team_run||'/'||si_team_wicket||' ('||si_team_over||' overs)') AS score FROM sp_tbl_match m JOIN sp_tbl_team t ON m.si_team_id=t.team_id WHERE stage='F'
)
/
-- SELECT * FROM sp_vw_final

--- working with middle
CREATE OR REPLACE VIEW sp_vw_middle_portion AS
SELECT 'League_progression->'col1,'1'col2,'2'col3,'3'col4,'4'col5,'5'col6,'6'col7,'7'col8,'8'col9,'9'col10,'10'col11,'11'col12,'12'col13,'13'col14,'14'col15,' Q1/E'col16,'Q2'col17,'F'col18 FROM dual
UNION ALL
SELECT p.* FROM sp_vw_league_progression p
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT 'Match summary','CSK','DD','KXIP','KKR','MI','RR','RCB','SRH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM DUAL
UNION ALL
SELECT a.*,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM sp_vw_match_summary a
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT 'League Table',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT 'Team','pld','W','L','T','NR','Pts','Nrr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT l.*,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM sp_vw_league_table l
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT 'Qualifier-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT q.*,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM sp_vw_qualifier1 q
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,'Q2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL, q2.*,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM sp_vw_qualifier2 q2
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT 'Eliminator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT e.*,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM sp_vw_eliminator e
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual connect by level <= 27
/
--SELECT * FROM sp_vw_middle_portion;

--- vertical view // that show playoff and final
CREATE OR REPLACE VIEW sp_vw_vertical AS
SELECT * FROM
(
  SELECT NULL AS o, NULL AS t, NULL AS th from dual connect by level <= 35
  UNION ALL
  SELECT NULL AS o, 'P' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'L' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'A' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'Y' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'O' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'F' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'F' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'S' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual connect by level <= 4
  UNION ALL
  SELECT NULL AS o, 'F' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'I' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'N' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'A' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, 'L' AS t, NULL AS th from dual
  UNION ALL
  SELECT NULL AS o, NULL AS t, NULL AS th from dual connect by level <= 25
)
/
--SELECT ROWNUM AS sn, m.* FROM sp_vw_middle_portion m;
--SELECT ROWNUM AS sn, v.* FROM sp_vw_vertical v;

CREATE OR REPLACE VIEW sp_vw_mp AS
(SELECT ROWNUM AS sn, m.* FROM sp_vw_middle_portion m)
/

CREATE OR REPLACE VIEW sp_vw_verti AS
(SELECT ROWNUM AS sn, v.* FROM sp_vw_vertical v)
/

CREATE OR REPLACE VIEW sp_vw_finalmiddle AS (
  SELECT  v.*,m.col1,m.col2,m.col3,m.col4,m.col5,m.col6,m.col7,m.col8,m.col9,m.col10,m.col11,
          m.col12,m.col13,m.col14,m.col15,m.col16,m.col17,m.col18
  FROM sp_vw_verti v JOIN sp_vw_mp m ON v.sn=m.sn
)
/

--SELECT * FROM sp_vw_finalmiddle;


--- match result view
CREATE OR REPLACE VIEW sp_vw_mresult AS
  SELECT * FROM
  (
    SELECT m.match_id+0.1 AS id, t1.team_name AS teamA, 'v' AS v, t2.team_name AS teamB, m.remarks AS results FROM sp_tbl_match m
      JOIN  sp_tbl_team t1
        ON m.fi_team_id=t1.team_id
      JOIN sp_tbl_team t2
        ON m.si_team_id=t2.team_id
      WHERE stage='l'
    UNION ALL
    SELECT match_id+0.2 AS id,fi_team_run||'/'||fi_team_wicket||' ('||fi_team_over||' overs)'AS teamA,NULL AS  v,si_team_run||'/'||si_team_wicket||' ('||si_team_over||' overs)'AS teamB, NULL AS results FROM sp_tbl_match WHERE stage='l'
    UNION ALL
    SELECT  m.match_id +0.3 AS id, '', '', '', '' FROM sp_tbl_match m WHERE stage='l'
  )order BY id
/

--SELECT * FROM sp_vw_mresult;

/*
--- total result
CREATE OR REPLACE VIEW sp_vw_total_result AS
SELECT ROWNUM AS sn, teamA, v, teamB, results FROM
(
SELECT NULL, NULL AS teamA, NULL AS v, NULL AS teamB, NULL AS results FROM dual
UNION ALL
SELECT NULL, teamA, v,teamB,results FROM sp_vw_mresult
)

--SELECT * FROM sp_vw_total_result;

-- left side view
CREATE OR REPLACE VIEW sp_vw_final_leftside AS
SELECT * FROM sp_vw_total_result WHERE sn<85;

--SELECT * FROM sp_vw_final_leftside;

-- view right side
CREATE OR REPLACE VIEW sp_vw_right1 AS
WITH temp AS (
SELECT * FROM sp_vw_total_result WHERE sn>85 ORDER BY sn DESC
)
SELECT * FROM temp ORDER BY sn asc;

CREATE OR REPLACE VIEW sp_vw_final_rightside AS
SELECT ROWNUM AS sn,NULL AS z, teamA, v, teamB, results FROM
(
SELECT NULL, NULL, NULL AS teamA, NULL AS v, NULL AS teamB, NULL AS results FROM dual
UNION ALL
SELECT NULL, NULL, teamA, v,teamB,results FROM sp_vw_right1
);

--SELECT * FROM sp_vw_final_rightside;
*/

--- total league result view i.e 56 matches
CREATE OR REPLACE VIEW sp_vw_total_result AS
SELECT ROWNUM AS sn, teamA, v, teamB, results FROM
(SELECT NULL, teamA, v,teamB,results FROM sp_vw_mresult)
/

--SELECT * FROM sp_vw_total_result;

-- left side view
CREATE OR REPLACE VIEW sp_vw_final_leftside AS
(SELECT * FROM sp_vw_total_result WHERE sn<85)
/

--SELECT * FROM sp_vw_final_leftside;

-- view right side
CREATE OR REPLACE VIEW sp_vw_right1 AS
  WITH temp AS (
  SELECT * FROM sp_vw_total_result WHERE sn>84 ORDER BY sn DESC
  )
  SELECT * FROM temp ORDER BY sn asc
/

--SELECT * FROM  sp_vw_right1;

CREATE OR REPLACE VIEW sp_vw_final_rightside AS (
  SELECT ROWNUM AS sn,NULL AS z, teamA, v, teamB, results FROM
  (
  SELECT NULL, NULL, teamA, v,teamB,results FROM sp_vw_right1
  )
)
/

--SELECT * FROM sp_vw_final_rightside;


CREATE OR REPLACE VIEW sp_vw_final_ipl2018 AS
SELECT l.teama, l.v,l.teamb,l.results,
m.o,m.t,m.th,m.col1,m.col2,m.col3,m.col4,m.col5,m.col6,m.col7,m.col8,m.col9,m.col10,m.col11,m.col12,m.col13,m.col14,m.col15,m.col16,m.col17,m.col18,
r.z,r.teama AS team1,r.v AS vs,r.teamb AS team2,r.results AS remarks
FROM sp_vw_final_leftside l
left JOIN sp_vw_finalmiddle m ON l.sn=m.sn
left JOIN sp_vw_final_rightside r ON l.sn=r.sn
/


SELECT * FROM sp_vw_final_ipl2018;
