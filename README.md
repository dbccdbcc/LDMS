# Readme

Sequence of script execution

create tables\01_create_table.sql
create sequences\01_create_seq.sql
Init data\01_insert_department.sql
Init data\02_insert_employee.sql
Init data\03_update_employee.sql
package\package.sql


Create Employee SP

add_employee(
p_emp_Name IN VARCHAR2,
p_job_Title IN VARCHAR2,
p_man_Id IN NUMBER,
p_date_Hire IN VARCHAR2,
p_sal IN NUMBER,
p_dep_Id IN NUMBER
);

Modify Salary SP

modify_salary(
p_emp_id IN NUMBER,
p_change IN NUMBER
);

Transfer Department SP

transfer_dept(
p_emp_id IN NUMBER,
p_dept_id IN NUMBER
);

Get Employees Salary FUNCTION

get_salary(p_emp_id IN NUMBER)


Reports

All Employees for a Department

reports\ALL_EMP_DEPT.xml

Total of Employee Salary for a Department

reports\SAL_DEPT.xml
