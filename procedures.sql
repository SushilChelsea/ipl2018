CREATE OR REPLACE PROCEDURE sp_insert_league_table
IS
	v_team_name VARCHAR2(255);
    v_home_pld  NUMBER;
    v_away_pld  NUMBER;
    v_pld       NUMBER;
    v_win       NUMBER;
    v_lost      NUMBER;
    v_tie       NUMBER;
    v_nr        NUMBER;
    v_pts       NUMBER;
    vc_nrr      VARCHAR2(10);
cursor c1 is
        select team_name from tbl_team; 
BEGIN
    v_tie:=0;
    v_nr:=0; 
        
    FOR rec in c1
   LOOP
        v_team_name:= rec.team_name;  
        -- count number of matches specific team wons
        select count(*) into v_win from vw_league_match_results where result like '%'||rec.team_name||'%';
        select count(team_a)home_played into v_home_pld from tbl_match where team_a=rec.team_name;
        select count(team_b)away_played into v_away_pld from tbl_match where team_b=rec.team_name;
        
        v_pld:= v_home_pld+v_away_pld;
        v_lost:= 14-v_win;
        v_pts:= v_win*2;

        vc_nrr := TO_CHAR(Round(fn_get_nrr(v_team_name), 3));
--        dbms_output.put_line(v_team_name ||' played: '||v_pld|| ' won:' || v_win || ' lost:' || v_lost || ' points:' || v_pts);
--        dbms_output.put_line('NRR: ' || v_nrr);
        INSERT INTO tbl_league_table (Team,Pld,W,L,T,NR,Pts,NRR) VALUES(v_team_name, v_pld, v_win, v_lost, v_tie, v_nr, v_pts, vc_nrr);
   END LOOP;

END;
/

EXECUTE sp_insert_league_table;