-- creating sequence so that team doesnot exceed more than 8 teams
CREATE SEQUENCE seq_team
  MINVALUE 1
  MAXVALUE 8
  START WITH 1
  INCREMENT BY 1;
  
  -- Initial Table    -- values are inserted statically(by user)
-- creating team table
CREATE TABLE tbl_team(
	team_id NUMBER NOT NULL PRIMARY KEY,
	team_name VARCHAR2(255),
	team_alias VARCHAR2(255)
);

-- Initial Table    -- values are inserted statically(by user)
-- creating match table
CREATE TABLE tbl_match(
	team_A VARCHAR2(255), 
	Run_A NUMBER,
	Wicket_A NUMBER, 
	Overs_A NUMBER(5,2),
	team_B VARCHAR2(255), 
	Run_B NUMBER,
	Wicket_B NUMBER, 
	Overs_B NUMBER(5,2)
);


-- creating league table    -- values are inserted dynamically(Evaluate data from initial table and Insert)
CREATE TABLE tbl_league_table (
    Team    VARCHAR2(35),
    Pld     NUMBER,
    W       NUMBER,
    L       NUMBER,
    T       NUMBER,
    NR      NUMBER,
    Pts     NUMBER,
    NRR     VARCHAR2(10)
);