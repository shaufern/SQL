DROP TABLE Employee;
CREATE TABLE Employee (
Empno int,
Emp_name varchar(255),
Emp_Join_Date Date,
Emp_Status varchar(1) check(Emp_Status = 'P' or Emp_Status='C' or Emp_Status='R')
);
DROP TABLE Project;
CREATE TABLE Project(
Project_Code varchar(10),
Project_Description varchar(255),
Project_Start_Date Date,
Project_End_Date Date
);
DROP TABLE Project_Allocation;
CREATE TABLE Project_Allocation(
Project_Code varchar(10),
Empno int,
Emp_Proj_Alloc_Date varchar(255),
Emp_Proj_Release_Date varchar(255)
);
INSERT INTO Employee
VALUES('101','Jhonny',TO_DATE('01/07/2005','DD/MM/YYYY'),'C');
INSERT INTO Employee
VALUES('116','Nayak',TO_DATE('16-Aug-2005','DD/MM/YYYY'),'C');
INSERT INTO Employee
VALUES('202','Meera',TO_DATE('30-Jan-2006','DD/MM/YYYY'),'C');
INSERT INTO Employee
VALUES('205','Ravi',TO_DATE('11-Feb-2006','DD/MM/YYYY'),'C');
INSERT INTO Employee
VALUES('304','Hari',TO_DATE('25-Nov-2006','DD/MM/YYYY'),'P');
INSERT INTO Employee
VALUES('307','Nancy',TO_DATE('15-Jan-2007','DD/MM/YYYY'),'P');
INSERT INTO Employee
VALUES('403','Nick',TO_DATE('21-Jan-2007','DD/MM/YYYY'),'P');

INSERT INTO Project
VALUES('P001','Environment Pollution',TO_DATE('02-Aug-2005','DD/MM/YYYY'),TO_DATE('11-Dec-2006','DD/MM/YYYY'));
INSERT INTO Project
VALUES('P002','Learning Curve',TO_DATE('01-Feb-2006','DD/MM/YYYY'),NULL);
INSERT INTO Project
VALUES('P003','Effects of IT',TO_DATE('03-Jan-2007','DD/MM/YYYY'),NULL);

INSERT INTO Project_Allocation
VALUES('P001','101','01-Aug-2005','11-Dec-2006');
INSERT INTO Project_Allocation
VALUES('P001','116','16-Aug-2005','11-Dec-2006');
INSERT INTO Project_Allocation
VALUES('P002','202','01-Feb-2006','14-Jan-2007');
INSERT INTO Project_Allocation
VALUES('P002','307','15-Jan-2007','');
INSERT INTO Project_Allocation
VALUES('P002','205','11-Feb-2006','');
INSERT INTO Project_Allocation
VALUES('P003','403','21-Jan-2007','');
INSERT INTO Project_Allocation
VALUES('P003','304','03-Jan-2007','');
INSERT INTO Project_Allocation
VALUES('P003','101','03-Jan-2007','');
INSERT INTO Project_Allocation
VALUES('P003','116','03-Jan-2007','');
INSERT INTO Project_Allocation
VALUES('P003','202','15-Jan-2007','');

SELECT * FROM Project;
SELECT * FROM Employee;
SELECT * FROM Employee where Emp_Status='C';
SELECT * FROM Employee where EMP_JOIN_DATE>TO_DATE('1/11/2006','DD/MM/YYYY');
SELECT * FROM Project where Project_Start_Date>TO_DATE('1/1/2006','DD/MM/YYYY');
SELECT Empno From (SELECT * FROM Project_Allocation where Project_Code='P003');
SELECT * FROM Project where Project_End_Date is null;
SELECT * FROM Project_Allocation where Project_Code='P002' and Emp_Proj_Release_Date is not null;
SELECT Project_End_Date-Project_Start_Date FROM Project where Project_Code='P001' ;
SELECT Project_End_Date-Project_Start_Date FROM Project;

ALTER TABLE Project
    ADD Project_Manager varchar(50);

UPDATE Project
SET PROJECT_MANAGER='101' where Project_Code='P001';
UPDATE Project
SET PROJECT_MANAGER='202' where Project_Code='P002';
UPDATE Project
SET PROJECT_MANAGER='116' where Project_Code='P003';

INSERT INTO Project
VALUES('P004','Election Rage',TO_DATE('01-Mar-2007','DD/MM/YYYY'),null,null);

DELETE FROM Project where Project_Code='P004';