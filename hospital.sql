Create database hospital;

USE hospital;


CREATE TABLE `DOCTOR` (
    `DoctorID` char(10)  NOT NULL ,
    `DOCTOR_NAME` varchar(130)  NOT NULL ,
    `ADDRESS` varchar(250)  NOT NULL ,
    `PHONE_NUMBER` char(30)  NOT NULL ,
    `SALARY` DECIMAL(7,2)  NOT NULL ,
    `gender` enum('M','F')  NOT NULL ,
    `DeptID` int  NOT NULL ,
    PRIMARY KEY (
        `DoctorID`
    )
);

CREATE TABLE `DEPARTMENT` (
    `DEPARTMENT_ID` int  NOT NULL ,
    `DEPARTMENT_NAME` varchar(30)  NOT NULL ,
    `DEP_PHONE_NO` char(30)  NOT NULL ,
    `Locations` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `DEPARTMENT_ID`
    )
);

CREATE TABLE `PATIENT` (
    `PatientID` char(10)  NOT NULL ,
    `BOOKINGRoomeNo` char(10)  NOT NULL ,
    `Name` varchar(130)  NOT NULL ,
    `age` int  NOT NULL ,
    `Phone` char(30)  NOT NULL ,
    `Email` varchar(100)  NOT NULL ,
    `Address` varchar(250)  NOT NULL ,
    `DoctorID` char(10)  NOT NULL ,
    `PHONE_NUMBER` char(30)  NOT NULL 
);

CREATE TABLE `MEDICINE` (
    `Code` char(10)  NOT NULL ,
    `Medicine_Name` char(40)  NOT NULL ,
    `Description` varchar(250)  NOT NULL ,
    `Price` DECIMAL(18,2)  NOT NULL ,
    `Date_due` TIMESTAMP(6)  NOT NULL ,
    PRIMARY KEY (
        `Code`
    )
);

CREATE TABLE `PatientMedicine` (
    `BOOKING_NO` char(10)  NOT NULL ,
    `Medicine_Code` char(10)  NOT NULL 
);

CREATE TABLE `BOOKING` (
    `Room_NUMBER` char(10)  NOT NULL ,
    `BOOKING_NUMBER` char(10)  NOT NULL ,
    `Entering_data` varchar(300)  NOT NULL ,
    PRIMARY KEY (
        `BOOKING_NUMBER`
    )
);

ALTER TABLE `DOCTOR` ADD CONSTRAINT `fk_DOCTOR_DeptID` FOREIGN KEY(`DeptID`)
REFERENCES `DEPARTMENT` (`DEPARTMENT_ID`);

ALTER TABLE `PATIENT` ADD CONSTRAINT `fk_PATIENT_BOOKINGRoomeNo` FOREIGN KEY(`BOOKINGRoomeNo`)
REFERENCES `BOOKING` (`BOOKING_NUMBER`);

ALTER TABLE `PATIENT` ADD CONSTRAINT `fk_PATIENT_DoctorID` FOREIGN KEY(`DoctorID`)
REFERENCES `DOCTOR` (`DoctorID`);

ALTER TABLE `PatientMedicine` ADD CONSTRAINT `fk_PatientMedicine_BOOKING_NO` FOREIGN KEY(`BOOKING_NO`)
REFERENCES `BOOKING` (`BOOKING_NUMBER`);

ALTER TABLE `PatientMedicine` ADD CONSTRAINT `fk_PatientMedicine_Medicine_Code` FOREIGN KEY(`Medicine_Code`)
REFERENCES `MEDICINE` (`Code`);



INSERT INTO `hospital`.`department` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `DEP_PHONE_NO`, `Locations`) VALUES ('1', 'Dermatology', '455-1212', '34 Home St');
INSERT INTO `hospital`.`department` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `DEP_PHONE_NO`, `Locations`) VALUES ('2', 'Cardiology', '475-1212', '32 Home St');
INSERT INTO `hospital`.`department` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `DEP_PHONE_NO`, `Locations`) VALUES ('3', 'Psychiatry', '477-1212', '37  Home St');
INSERT INTO `hospital`.`department` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `DEP_PHONE_NO`, `Locations`) VALUES ('5', 'Oncology', '478-1212', '39  Home St');
 

INSERT INTO `hospital`.`doctor` (`DoctorID`,`DOCTOR_NAME`,`ADDRESS`,`PHONE_NUMBER`,`SALARY`,`gender`,`DeptID`) VALUES ('D1','Karen','26  Hill Drive','555-1749',6000.00,'M',2);
INSERT INTO `hospital`.`doctor`  (`DoctorID`,`DOCTOR_NAME`,`ADDRESS`,`PHONE_NUMBER`,`SALARY`,`gender`,`DeptID`) VALUES ('D2','Robert','23 Hill Drive','555-1748',7000.00,'M',1);
INSERT INTO `hospital`.`doctor` (`DoctorID`,`DOCTOR_NAME`,`ADDRESS`,`PHONE_NUMBER`,`SALARY`,`gender`,`DeptID`) VALUES ('D3','Mary','8  Hill Drive','555-1748',8000.00,'F',3);
INSERT INTO `hospital`.`doctor`  (`DoctorID`,`DOCTOR_NAME`,`ADDRESS`,`PHONE_NUMBER`,`SALARY`,`gender`,`DeptID`) VALUES ('D4','Linda','9  Hill Drive','557-1748',10000.00,'F',3);
INSERT INTO `hospital`.`doctor` (`DoctorID`,`DOCTOR_NAME`,`ADDRESS`,`PHONE_NUMBER`,`SALARY`,`gender`,`DeptID`) VALUES ('D5','Susan','10  Hill Drive','557-3048',20000.00,'F',1);


SELECT * FROM hospital.department; 

SELECT * FROM hospital.doctor; 



##command 1 
SELECT * FROM department
WHERE locations = '34 Home St';

##command 2
SELECT DEPARTMENT_ID
FROM department
WHERE locations = '34 Home St';

##command 3
SELECT DEPARTMENT_NAME
FROM DEPARTMENT
WHERE DEP_PHONE_NO = '477-1212' ;

##command 4
SELECT DOCTOR_NAME
FROM DOCTOR 
WHERE DeptID = 1
GROUP BY DOCTOR_NAME
ORDER BY DOCTOR_NAME;

##command 5
SELECT DOCTOR_NAME
FROM DOCTOR 
WHERE DeptID = 1
GROUP BY DOCTOR_NAME
ORDER BY DOCTOR_NAME DESC;

##command 6
SELECT SALARY, DOCTOR_NAME
FROM DOCTOR 
GROUP BY DOCTOR_NAME
HAVING SALARY > '7000.00';

##command 7
SELECT SALARY, DOCTOR_NAME
FROM DOCTOR 
GROUP BY DOCTOR_NAME
HAVING SALARY > '7000.00' AND  SALARY < '20000.00';

##command 8
SELECT * FROM DOCTOR 
WHERE DOCTOR_NAME IN (SELECT DEPARTMENT_ID 
					  FROM DEPARTMENT  
					  WHERE DEPARTMENT_ID = '3');

##command 9
SELECT * FROM DEPARTMENT
WHERE DEPARTMENT_NAME IN (SELECT DOCTOR_NAME 
						  FROM DOCTOR  
						  WHERE DeptID = '1');
						  
						  
##command 10
SELECT doctor.DoctorID, department.DEPARTMENT_NAME, department.DEPARTMENT_ID
FROM department
INNER JOIN doctor ON doctor.DeptID=department.DEPARTMENT_ID; 


##command 11
SELECT doctor.DOCTOR_NAME, department.DEPARTMENT_NAME, PHONE_NUMBER
FROM doctor
INNER JOIN department ON doctor.DeptID=department.DEPARTMENT_ID; 