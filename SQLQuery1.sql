CREATE DATABASE Task
use Task

CREATE TABLE REGIONS(
REGION_ID INT PRIMARY KEY,
REGION_NAME VARCHAR(25)

)

CREATE TABLE DEPARTMENTS(
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(30),
MANAGER_ID INT ,
LOCATION_ID INT ,
FOREIGN KEY(LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID)
)

CREATE TABLE JOP_HISTORY(
EMPLOYEE_ID INT  ,
START_DATE DATE ,
END_DATE DATE,
JOB_ID VARCHAR(10),
DEPARTMENT_ID INT 
PRIMARY KEY (EMPLOYEE_ID ,START_DATE )
FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
)

CREATE TABLE COUNTRIES(
COUNTRY_ID CHAR(2) PRIMARY KEY ,
COUNTRY_NAME VARCHAR(40),
REGION_ID INT 
FOREIGN KEY(REGION_ID) REFERENCES REGIONS(REGION_ID)
)

CREATE TABLE EMPLOYEES(
EMPLOYEE_ID INT PRIMARY KEY ,
FIRST_NAME VARCHAR(20),
FIRST_LAST VARCHAR(25),
EMAIL VARCHAR(25),
PHONE_NUMBER VARCHAR(20),
HIRE_DATE DATE,
JOP_ID VARCHAR(10),
SALARY INT ,
COMMISSION_PCT INT,
MANAGER_ID INT,
DEPARTMENT_ID INT
FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
)

CREATE TABLE LOCATIONS(
LOCATION_ID INT PRIMARY KEY,
STREET_ADDRESS VARCHAR(25),
POSTAL_CODE VARCHAR(12),
CITY VARCHAR(30),
STATE_PROVINCE VARCHAR(12),
COUNTRY_ID CHAR(2)
FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES(COUNTRY_ID)
)

CREATE TABLE JOPS(
JOP_ID VARCHAR(10) PRIMARY KEY,
JOP_TITLE VARCHAR(35),
MIN_SALARY INT,
MAX_SALARY INT,
FOREIGN KEY(JOP_ID) REFERENCES JOP_HISTORY(JOB_ID)
)

CREATE TABLE JOP_GRADES(
GRADE_LEVEL VARCHAR(2) PRIMARY KEY,
LOWEST_SAL INT,
HIGHEST_SAL INT
)


