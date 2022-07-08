
SELECT * FROM department
WHERE locations = '34 Home St';

SELECT DEPARTMENT_ID
FROM department
WHERE locations = '34 Home St';

SELECT DEPARTMENT_NAME
FROM DEPARTMENT
WHERE DEP_PHONE_NO = '477-1212' ;

SELECT DOCTOR_NAME
FROM DOCTOR 
WHERE DeptID = 1
GROUP BY DOCTOR_NAME
ORDER BY DOCTOR_NAME;

SELECT DOCTOR_NAME
FROM DOCTOR 
WHERE DeptID = 1
GROUP BY DOCTOR_NAME
ORDER BY DOCTOR_NAME DESC;


SELECT SALARY, DOCTOR_NAME
FROM DOCTOR 
GROUP BY DOCTOR_NAME
HAVING SALARY > '7000.00';

SELECT SALARY, DOCTOR_NAME
FROM DOCTOR 
GROUP BY DOCTOR_NAME
HAVING SALARY > '7000.00' AND  SALARY < '20000.00';

SELECT * FROM DOCTOR 
WHERE DOCTOR_NAME IN (SELECT DEPARTMENT_ID 
					  FROM DEPARTMENT  
					  WHERE DEPARTMENT_ID = '3');

SELECT * FROM DEPARTMENT
WHERE DEPARTMENT_NAME IN (SELECT DOCTOR_NAME 
						  FROM DOCTOR  
						  WHERE DeptID = '1');