CREATE OR REPLACE FUNCTION fn_get_nrr(team_name IN tbl_team.team_name%type)
RETURN NUMBER
AS
    v_nrr           NUMBER;
    v_run_scored    NUMBER;
    v_run_conceded  NUMBER;
    v_over_faced    NUMBER;
    v_over_bowled   NUMBER;
    
    cursor c1 is
        select * 
        from tbl_match
        WHERE team_a=team_name OR team_b=team_name;
BEGIN
    v_nrr:= 0;
    v_run_scored:= 0;
    v_run_conceded:= 0;
    v_over_faced:= 0;
    v_over_bowled:= 0;
    
    FOR rec in c1 LOOP
--        dbms_output.put_line(rec.team_a);
--        DBMS_OUTPUT.PUT_LINE('Run Scored: '|| v_run_scored);
--        DBMS_OUTPUT.PUT_LINE('Over Faced: ' || v_over_faced);
--        DBMS_OUTPUT.PUT_LINE('Run Conceded: ' || v_run_conceded);
--        DBMS_OUTPUT.PUT_LINE('Over Bowled: ' || v_over_bowled);
        
        IF rec.team_a=team_name THEN 
          v_run_scored:= v_run_scored + rec.run_a;
          v_run_conceded:= v_run_conceded + rec.run_b;
          v_over_faced:= v_over_faced + rec.overs_a;
          v_over_bowled:= v_over_bowled + rec.overs_b;
        
        ELSIF rec.team_b=team_name THEN 
            v_run_scored:= v_run_scored + rec.run_b;
            v_run_conceded:= v_run_conceded + rec.run_a;
            v_over_faced:= v_over_faced + rec.overs_b;
            v_over_bowled:= v_over_bowled + rec.overs_a;
        ELSE
            DBMS_OUTPUT.PUT_LINE('TEAM NOT FOUND');
        END IF;
--    DBMS_OUTPUT.PUT_LINE('Run Scored: '|| v_run_scored);
--    DBMS_OUTPUT.PUT_LINE('Over Faced: ' || v_over_faced);
--    DBMS_OUTPUT.PUT_LINE('Run Conceded: ' || v_run_conceded);
--    DBMS_OUTPUT.PUT_LINE('Over Bowled: ' || v_over_bowled);
    END LOOP;
--    DBMS_OUTPUT.PUT_LINE('Run Scored: '|| v_run_scored);
--    DBMS_OUTPUT.PUT_LINE('Over Faced: ' || v_over_faced);
--    DBMS_OUTPUT.PUT_LINE('Run Conceded: ' || v_run_conceded);
--    DBMS_OUTPUT.PUT_LINE('Over Bowled: ' || v_over_bowled);

    v_nrr := v_run_scored/v_over_faced - v_run_conceded/v_over_bowled;
    RETURN v_nrr;
END;
/

SET SERVEROUTPUT ON
begin
    dbms_output.put_line(Round(fn_get_nrr('Royal Challengers Bangalore'),3));
end;
/

select fn_get_nrr('Tiger')AS NRR FROM DUAL;
select ROUND(fn_get_nrr('Chennai Super Kings'),3)AS NRR FROM DUAL;