UPDATE employees SET manager_id = 90001 WHERE employee_id =90002;
UPDATE employees SET manager_id = 90002 WHERE employee_id =90003;
UPDATE employees SET manager_id = 90003 WHERE employee_id =90004;
UPDATE employees SET manager_id = 90006 WHERE employee_id =90005;
UPDATE employees SET manager_id = 90001 WHERE employee_id =90006;
UPDATE employees SET manager_id = 90006 WHERE employee_id =90007;
UPDATE employees SET manager_id = 90009 WHERE employee_id =90008;
UPDATE employees SET manager_id = 90001 WHERE employee_id =90009;
UPDATE employees SET manager_id = 90001 WHERE employee_id =90010;


commit;
