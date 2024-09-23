SHOW TABLES;

-- SELECT * FROM ASSIGNMENT;
-- SELECT * FROM  EMPLOYEE;
-- SELECT * FROM JOB;
-- SELECT * FROM PROJECT;


SELECT EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL
FROM EMPLOYEE
HAVING EMPLOYEE.EMP_LNAME LIKE 'Smith%' 
;


SELECT PROJ_NAME, PROJ_VALUE, PROJ_BALANCE, EMP_LNAME, EMP_FNAME, EMP_INITIAL, EMPLOYEE.JOB_CODE, JOB_DESCRIPTION,JOB_CHG_HOUR
FROM EMPLOYEE INNER JOIN PROJECT ON PROJECT.EMP_NUM = EMPLOYEE.EMP_NUM
              INNER JOIN JOB ON JOB.JOB_CODE = EMPLOYEE.JOB_CODE
;

