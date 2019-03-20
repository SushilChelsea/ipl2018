-- triggers when user tries to enter invalid entry
CREATE OR REPLACE TRIGGER trig_insert_team
BEFORE INSERT OR UPDATE OF team_name, team_id ON tbl_team 
FOR EACH ROW 
DECLARE
    invalid_team_name exception;
    invalid_team_id exception;
BEGIN
if :new.team_id > 8 then
    raise invalid_team_id;
end if;
if :New.team_name NOT IN ( 'Chennai Super Kings', 'Delhi Daredevils', 'Kings XI Punjab', 'Kolkata Knight Riders',
                        'Mumbai Indians', 'Rajasthan Royals', 'Royal Challengers Bangalore', 'Sunrisers Hyderabad') then 
    raise invalid_team_name;
end if;
exception
    when invalid_team_name then raise_application_error (-20099,'You are trying to insert invalid team.');
    when invalid_team_id then raise_application_error (-20099,'Only 8 teams played ipl in 2018.');
END;
/