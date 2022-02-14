CREATE OR REPLACE
PACKAGE PKG_EMPLOYEE AS

PROCEDURE add_employee(
p_emp_Name IN VARCHAR,
p_job_Title IN VARCHAR,
p_man_Id IN NUMBER,
p_date_Hire IN VARCHAR,
p_sal IN NUMBER,
p_dep_Id IN NUMBER
);

PROCEDURE modify_salary(
p_emp_id IN NUMBER,
p_change IN NUMBER
);

PROCEDURE transfer_dept(
p_emp_id IN NUMBER,
p_dept_id IN NUMBER
);

FUNCTION get_salary(p_emp_id IN NUMBER) RETURN NUMBER;

END PKG_EMPLOYEE;

/

CREATE OR REPLACE
PACKAGE BODY PKG_EMPLOYEE AS

  PROCEDURE add_employee(
p_emp_Name IN VARCHAR,
p_job_Title IN VARCHAR,
p_man_Id IN NUMBER,
p_date_Hire IN VARCHAR,
p_sal IN NUMBER,
p_dep_Id IN NUMBER
) AS

v_dateHire TIMESTAMP;

  BEGIN

    SELECT TO_DATE(p_date_Hire,'dd/mm/yy') INTO v_dateHire FROM dual;

    INSERT INTO employees (
        employee_id,
        employee_name,
        job_title,
        manager_id,
        date_hired,
        salary,
        department_id)
    VALUES(
        SEQ_EMP_ID.NEXTVAL,
        p_emp_Name,
        p_job_Title,
        p_man_Id,
        v_dateHire,
        p_sal,
        p_dep_Id
    );
    COMMIT;

END add_employee;

  PROCEDURE modify_salary(
p_emp_id IN NUMBER,
p_change IN NUMBER
) AS

v_change NUMBER DEFAULT 1;

  BEGIN
    v_change:= v_change + (p_change/100);

    UPDATE employees SET salary = salary*v_change WHERE employee_id = p_emp_id;

    COMMIT;
  END modify_salary;

  PROCEDURE transfer_dept(
p_emp_id IN NUMBER,
p_dept_id IN NUMBER
) AS
  BEGIN
    UPDATE employees SET department_id = p_dept_id WHERE employee_id = p_emp_id;

  END transfer_dept;

  FUNCTION get_salary(p_emp_id IN NUMBER) RETURN NUMBER AS

  v_salary NUMBER;

  BEGIN

    SELECT SALARY INTO v_salary FROM employees WHERE employee_id = p_emp_id;

    RETURN v_salary;
  END get_salary;

END PKG_EMPLOYEE;
