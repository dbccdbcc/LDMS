DECLARE
  P_EMP_NAME VARCHAR2(50);
  P_JOB_TITLE VARCHAR2(50);
  P_MAN_ID NUMBER;
  P_DATE_HIRE VARCHAR2(6);
  P_SAL NUMBER;
  P_DEP_ID NUMBER;
BEGIN
  P_EMP_NAME := 'TEST003';
  P_JOB_TITLE := 'Manager';
  P_MAN_ID := NULL;
  P_DATE_HIRE := '190225';
  P_SAL := 30000;
  P_DEP_ID := 1;

  PKG_EMPLOYEE.ADD_EMPLOYEE(
    P_EMP_NAME => P_EMP_NAME,
    P_JOB_TITLE => P_JOB_TITLE,
    P_MAN_ID => P_MAN_ID,
    P_DATE_HIRE => P_DATE_HIRE,
    P_SAL => P_SAL,
    P_DEP_ID => P_DEP_ID
  );
--rollback;
END;

--with invalid date
DECLARE
  P_EMP_NAME VARCHAR2(50);
  P_JOB_TITLE VARCHAR2(50);
  P_MAN_ID NUMBER;
  P_DATE_HIRE VARCHAR2(6);
  P_SAL NUMBER;
  P_DEP_ID NUMBER;
BEGIN
  P_EMP_NAME := 'TEST003';
  P_JOB_TITLE := 'Manager';
  P_MAN_ID := NULL;
  P_DATE_HIRE := '222222';
  P_SAL := 30000;
  P_DEP_ID := 1;

  PKG_EMPLOYEE.ADD_EMPLOYEE(
    P_EMP_NAME => P_EMP_NAME,
    P_JOB_TITLE => P_JOB_TITLE,
    P_MAN_ID => P_MAN_ID,
    P_DATE_HIRE => P_DATE_HIRE,
    P_SAL => P_SAL,
    P_DEP_ID => P_DEP_ID
  );
--rollback;
END;
