DECLARE
	today date;
	curr_day varchar2(9);

BEGIN
	today:=sysdate;
	curr_day:=to_char(today,'day');
	curr_day:=initcap(curr_day);
	curr_day:=rtrim(curr_day);
	dbms_output.put_line('Today is:'||curr_day);

END;
/