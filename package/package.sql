create or replace NONEDITIONABLE PACKAGE PKG_EMPLOYEE AS

PROCEDURE add_employee(
p_emp_Name IN VARCHAR2,
p_job_Title IN VARCHAR2,
p_man_Id IN NUMBER,
p_date_Hire IN VARCHAR2,
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

FUNCTION check_date_format(p_date IN VARCHAR2) RETURN TIMESTAMP;


END PKG_EMPLOYEE;

/

create or replace PACKAGE BODY PKG_EMPLOYEE AS

  PROCEDURE add_employee(
p_emp_Name IN VARCHAR2,
p_job_Title IN VARCHAR2,
p_man_Id IN NUMBER,
p_date_Hire IN VARCHAR2,
p_sal IN NUMBER,
p_dep_Id IN NUMBER
) AS

    v_dateHire TIMESTAMP;

  BEGIN

    v_dateHire := check_date_format(p_date_Hire);

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

    v_chk_exist NUMBER;

  BEGIN

    SELECT employee_id INTO v_chk_exist FROM employees WHERE employee_id = p_emp_id;

    UPDATE employees SET department_id = p_dept_id WHERE employee_id = p_emp_id;


    COMMIT;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'Employee ID ' || p_emp_id ||  ' does not exist - ');
        WHEN OTHERS THEN
        raise_application_error(-20001,'Department ID ' || p_dept_id ||  ' does not exist - ');


  END transfer_dept;

  FUNCTION get_salary(p_emp_id IN NUMBER) RETURN NUMBER AS

  v_salary NUMBER;

  BEGIN

    SELECT SALARY INTO v_salary FROM employees WHERE employee_id = p_emp_id;
    RETURN v_salary;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            BEGIN
            dbms_output.put_line('Employee ID ' || p_emp_id ||  ' does not exist');
            RETURN NULL;
            END;

  END get_salary;


  FUNCTION check_date_format(p_date IN VARCHAR2) RETURN TIMESTAMP AS



  BEGIN
    return to_date(p_date, 'yymmdd');
      exception
       when OTHERS then
        dbms_output.put_line('Date format is yymmdd');
        raise_application_error(-20001, 'Not a valid date. Date format is yymmdd');
  END check_date_format;

END PKG_EMPLOYEE;
