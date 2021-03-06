--COMP214 Final Project Script
--Joanna Lu 300916162


--Drop Tables
--DROP TABLE clients CASCADE CONSTRAINTS;
--DROP TABLE housekeepers CASCADE CONSTRAINTS;
--DROP TABLE service_types CASCADE CONSTRAINTS;
--DROP TABLE salary_payments CASCADE CONSTRAINTS;
--DROP TABLE service_payments CASCADE CONSTRAINTS;
--DROP TABLE services CASCADE CONSTRAINTS;
--DROP TABLE status CASCADE CONSTRAINTS;


--clients table
CREATE TABLE clients(
client_ID NUMBER(4,0) PRIMARY KEY,
first_name VARCHAR2(30) NOT NULL,
last_name VARCHAR2(30) NOT NULL,
street VARCHAR2(30) NOT NULL,
city VARCHAR2(30) NOT NULL,
state VARCHAR2(2) NOT NULL,
zip VARCHAR2(6) NOT NULL,
phone VARCHAR2(12) NOT NULL,
email VARCHAR2(30) NOT NULL
);

--housekeepers table
CREATE TABLE housekeepers(
housekeeper_ID NUMBER(4,0) PRIMARY KEY,
first_name VARCHAR2(30) NOT NULL,
last_name VARCHAR2(30) NOT NULL,
street VARCHAR2(30),
city VARCHAR2(30) NOT NULL,
state VARCHAR2(2) NOT NULL,
zip VARCHAR2(6) NOT NULL,
phone VARCHAR2(12) NOT NULL,
email VARCHAR2(30),
date_of_entry DATE NOT NULL,
hourly_wage NUMBER(5,2) NOT NULL
);

--service_types table
CREATE TABLE service_types(
service_type_number NUMBER(4,0) NOT NULL,
charge_per_unit_area NUMBER(5,2) NOT NULL,
service_type_description VARCHAR2(30) NOT NULL, 
CONSTRAINT service_type_number_pk PRIMARY KEY(service_type_number));

--service_payments table
CREATE TABLE service_payments(
service_payment_number NUMBER(4,0) PRIMARY KEY,
total_price NUMBER(5,2) NOT NULL,
payment_option VARCHAR2(10),
Payment_status VARCHAR2(1) NOT NULL,
remainder NUMBER(5,2) NOT NULL,
CONSTRAINT payment_status_ck CHECK(payment_status IN('Y','N')));

--Services table
CREATE TABLE services(
service_number NUMBER(4,0) NOT NULL,
service_type_number NUMBER(4,0) NOT NULL,
client_ID NUMBER(4,0) NOT NULL,
housekeeper_ID NUMBER(4,0) NOT NULL,
service_date DATE NOT NULL,
service_hour NUMBER(5) NOT NULL,
unit_area VARCHAR2(12) NOT NULL,
pet VARCHAR2(1) NOT NULL,
status_code VARCHAR2(1) NOT NULL,
service_payment_number NUMBER(4,0) NOT NULL,
CONSTRAINT service_number_pk PRIMARY KEY(service_number),
CONSTRAINT service_type_number_fk FOREIGN KEY(service_type_number)
REFERENCES service_types (service_type_number),
CONSTRAINT client_id_fk FOREIGN KEY(client_ID)
REFERENCES clients (client_ID),
CONSTRAINT housekeeper_ID_fk FOREIGN KEY(housekeeper_ID)
REFERENCES housekeepers (housekeeper_ID),
CONSTRAINT pet_ck CHECK(pet IN('Y','N')),
CONSTRAINT status_code_ck CHECK(status_code IN('F','U','C')),
CONSTRAINT service_payment_number_fk FOREIGN KEY(service_payment_number)
REFERENCES service_payments (service_payment_number));

--Salary_Payments table
CREATE TABLE salary_payments(
salary_payment_number NUMBER(4,0) PRIMARY KEY,
housekeeper_id NUMBER(4,0) NOT NULL,
payment_date Date NOT NULL,
total_salary NUMBER(5,2) NOT NULL,
CONSTRAINT housekeepers_id_fk FOREIGN KEY(housekeeper_id)
 REFERENCES housekeepers(housekeeper_id));

--Status (Lookup table)
CREATE TABLE status(
status_code VARCHAR2(1) PRIMARY KEY,
status_description CHAR(15));


--Status Description
INSERT INTO status(status_code, status_description)
VALUES('F', 'Finished');
INSERT INTO status(status_code, status_description)
VALUES('U', 'Unfinished');
INSERT INTO status(status_code, status_description)
VALUES('C', 'Canceled');
INSERT INTO status(status_code, status_description)
VALUES('P', 'Pending');
INSERT INTO status(status_code, status_description)
VALUES('I', 'In-Progress');


--Housekeepers Table
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('1','JAY','SMITH','THERMOS ROAD','SCARBOROUGH','ON','M1L0E6','437-311-2837','jsmith106@gmail.com', '05-DEC-2018', '24.80');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('2','WILLIAM','HARPER','OVELEA BOULEVARD','TORONTO','ON','M4H1B6','647-232-2132','wharper416@gmail.com', '13-JUL-2019', '22.70');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('3','HAZEL','JACKSON','BISCAYNE CRESCENT','BRAMPTON','ON','L6W4S1','705-194-3958','hjackson641@gmail.com', '05-APR-2016', '29.30');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('4','CHRISTIAN','MADISON','LAIRD ROAD','MISSISSAUGA','ON','L5L6A5','807-694-4986','cmadison565@gmail.com', '21-MAY-2017', '26.10');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('5','ALEX','HUNTER','JOHN BIRCHALL ROAD','REICHMOND HILL','ON','L4S0B2','647-496-2985','ahunter402@gmail.com', '01-JAN-2018', '25.20');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('6','SEAN','NOVAK','MINGAY AVENUE','MARKHAM','ON','L3R1E5','613-9873-6078','seannovak@gmail.com', '05-FEB-2018', '23.10');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('7','SELENA','WALKER','123 MAIN STREET','TORONTO','ON','C0A 1H3','226-385-2984','selenaw@gmail.com', '26-Apr-2017', '25.50');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('8','JENNIFER','TU','12 APPLE BLOSSOM CRES','GEORGETOWN','ON','L7G 6L5','807-273-4977','jennifertu12@gmail.com', '31-Aug-2018', '23.10');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('9','MIKE','YEH','CHURCH STREET','TORONTO','ON','M5E 1Y6','647-193-3874','mikeyeh@hotmail.com', '25-July-2017', '27.00');
INSERT INTO housekeepers(housekeeper_id, first_name, last_name, street, city, state, zip, phone, email, date_of_entry, hourly_wage)
VALUES ('10','NICK','BROWN','114 KINGSTON ROAD','TORONTO','ON','M4L 1S7','226-394-4765','nickbrown@gmail.com', '10-May-2017', '27.80');


--Clients Table
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('1','JOEY','WHITW','DANFORTH AVENUE','TORONTO','ON','M4K1A7','416-193-4954','joeywhite@gmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('2','MIKO','CHEN','ADASTRA PLACE','BRAMPTON','ON','L6P3B4','416-122-7217','mikochen@gmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('3','CATO','SMITH','AVENUE ROAD','SCARBOROUGH','ON','M6H1N4','437-964-0382','catosmith@hotmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('4','PHOEBE','JOHNSON','7TH STREET','MISSISSAUGA','ON','R7A3S5','416-985-0149','phoebe99@gmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('5','NICK','MILLER','CHRISTIE STREET','TORONTO','ON','M6H1K0','438-263-3758','nickmiller23@hotmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('6','SIMON','WONG','CUMMER AVENUE','TORONTO','ON','M2M2E9','416-328-2846','simonw2983@yahoo.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('7','TERRY','JONES','ADMIRAL DRIVE','LONDON','ON','N5V1H8','439-193-4860','terryjones@gmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('8','EDISON','DAVIS','MAIN AVENUE','OTTAWA','ON','K1R1A7','343-443-8873','ed1937@gmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('9','EMMA','WILSON','QUEEN STREET WEST','TORONTO','ON','M6K1L4','416-496-2789','emmawilson@hotmail.com');
INSERT INTO clients(client_ID, first_name, last_name, street, city, state, zip, phone, email)
VALUES ('10','MARTIN','BROWN','CHURCH STREET','TORONTO','ON','M5C8E2','437-294-6935','martinb35@gmail.com');


--Service_Types Table
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('1','25','DISH WASHING');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('2','30','WASHING BLINDS');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('3','35','MAKING BED');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('4','40','LAUNDRY');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('5','40','WASHING WINDOWS');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('6','50','CLEANING BEDROOM');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('7','60','CLEANING BATHROOM');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('8','60','POLISHING FURNITURE');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('9','70','CLEANING KITCHEN');
INSERT INTO service_types(service_type_number, charge_per_unit_area, service_type_description)
VALUES ('10','100','TIDYING UP ROOMS');


--Service Payments_Table
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('1','20','Y','0');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('2','30','Y','0');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('3','40','Y','0');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('4','50','Y','0');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('5','60','N','10');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('6','70','Y','0');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('7','80','N','30');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('8','250','N','150');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('9','160','Y','0');
INSERT INTO service_payments(service_payment_number,total_price, payment_status,remainder)
VALUES ('10','300','Y','0');


--Services Table
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('1','1','1','1','02-FEB-2020','2','1','N','F','1');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('2','8','2','2','12-FEB-2020','0','1','N','U','2');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('3','3','4','3','09-MAR-2020','2','2','Y','F','3');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('4','6','6','4','12-MAR-2020','2','3','Y','F','4');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('5','8','7','5','18-MAR-20','0','5','Y','C','5');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('6','6','9','9','31-MAR-2020','4','2','N','F','6');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('7','8','4','10','03-APR-2019','6','5','N','P','7');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('8','5','10','8','11-APR-2020','10','8','Y','I','8');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('9','4','8','7','20-MAR-2019','3','2','N','I','9');
INSERT INTO services(service_number, service_type_number, client_id, housekeeper_id, service_date, service_hour, unit_area, pet, status_code,service_payment_number)
VALUES ('10','7','3','6','15-AUG-2018','3','4','Y','P','10');

--Salary Payments_Table
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('1','4','10-APR-2020','45');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('2','1','15-APR-2020','40.22');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('3','2','10-APR-2020','60.32');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('4','3','10-APR-2020','80.42');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('5','8','10-APR-2020','90.52');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('6','10','15-APR-2020','62');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('7','9','10-APR-2020','72');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('8','6','15-APR-9020','60');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('9','5','15-APR-9020','80');
INSERT INTO salary_payments(salary_payment_number, housekeeper_id, payment_date, total_salary)
VALUES ('10','7','15-APR-9020','55');

