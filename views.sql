--  creating views to display league match results
CREATE OR REPLACE VIEW vw_league_match_results AS
SELECT  team_a||' ' || chr(10) ||run_a||'/'||wicket_a||' ('||overs_a||' overs)' as team_A, 'Vs' as Vs,
        team_b||' ' || chr(10) ||run_b||'/'||wicket_b||' ('||overs_b||' overs)' as team_B,
            CASE
                WHEN team_a='Rajasthan Royals' and team_b='Delhi Daredevils' and run_a=153 
                    and run_b=60 and wicket_a=5 and wicket_b=4 and overs_a=17.5 and overs_b=6 THEN 
                    'Rajasthan Royals won by 10 runs(DLS Method)'
                WHEN team_a='Kolkata Knight Riders' and team_b='Kings XI Punjab' and run_a=191
                    and run_b=126 and wicket_a=7 and wicket_b=1 and overs_a=20 and overs_b=11.1 THEN 
                    'Kings XI Punjab won by 9 wickets(DLS Method)'
                WHEN team_a='Delhi Daredevils' and team_b='Rajasthan Royals' and run_a=196
                    and run_b=146 and wicket_a=6 and wicket_b=5 and overs_a=17.1 and overs_b=12 THEN 
                    'Delhi Daredevils won by 4 runs(DLS Method)'
                WHEN run_a > run_b THEN team_a||' won by '|| (run_a - run_b) || ' runs'
                WHEN run_a < run_b THEN team_b||' won by '|| (10 - wicket_b) || ' wickets'
                ELSE 'DRAW'
            END AS RESULT
from tbl_match;

select * from vw_league_match_results;