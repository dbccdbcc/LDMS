--create table department
CREATE TABLE department(

department_id number(5) NOT NULL,
department_name varchar(50) NOT NULL,
location varchar(50) NOT NULL,
CONSTRAINT pk_department PRIMARY KEY (department_id));

COMMENT ON COLUMN department.department_id
IS 'The unique identifier for the department';

COMMENT ON COLUMN department.department_name
IS 'The name of the department';

COMMENT ON COLUMN department.location
IS 'The physical location of the department';


--create table employee
CREATE TABLE employees(

employee_id NUMBER(10) NOT NULL,
employee_name VARCHAR(50) NOT NULL,
job_title VARCHAR(50) NOT NULL,
manager_id NUMBER(10),
date_hired Timestamp NOT NULL,
salary   NUMBER(10) NOT NULL,
department_id NUMBER(5) NOT NULL,

CONSTRAINT pk_employees PRIMARY KEY (employee_id),

CONSTRAINT fk_department_employees FOREIGN KEY (department_id)
REFERENCES department (department_id)

);

COMMENT ON COLUMN employees.employee_id
IS 'The unique identifier for the employee';

COMMENT ON COLUMN employees.employee_name
IS 'The name of the employee';

COMMENT ON COLUMN employees.job_title
IS 'The job role undertaken by the employee. Some employees may undertaken the same job role';

COMMENT ON COLUMN employees.manager_id
IS 'Line manager of the employee';

COMMENT ON COLUMN employees.date_hired
IS 'The date the employee was hired';

COMMENT ON COLUMN employees.salary
IS 'Current salary of the employee';

COMMENT ON COLUMN employees.department_id
IS 'Each employee must belong to a department';
