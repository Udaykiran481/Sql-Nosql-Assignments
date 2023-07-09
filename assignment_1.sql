-- Q.1. Create the following schema 
-- MySql
create table regions(
region_id int primary key,
region_name varchar(50)
);
create table countries(
country_id int primary key,
country_name varchar(50),
region_id int,
foreign key (region_id) references regions(region_id)
);
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    postal_code VARCHAR(50),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    CHECK (CHAR_LENGTH(postal_code) <= 10)
);
create table departments(
department_id int primary key,
department_name varchar(50),
location_id int,
foreign key(location_id) references locations(location_id)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    min_salary int check(min_salary>1000),
    max_salary int
);
CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name varchar(50) not null,
last_name varchar(50)not null,
email varchar(50),
phone_number INT,
hire_date varchar(50),
job_id int,
salary int,
manager_id int,
department_id int,
foreign key (job_id) references jobs(job_id),
foreign key(manager_id) references employees(employee_id),
foreign key(department_id) references departments(department_id)
);
create table dependents(
dependent_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
relationship varchar(50),
employee_id int,
foreign key(employee_id) references employees(employee_id)
);

/* Q.2.Insert 5 rows in the jobs, dependents, regions, countries, locations, departments tables and  10 
rows in the Employee table.*/
INSERT into regions(region_id,region_name)
values (1,"hyderabad"),
       (2,"chennai"),
       (3,"kolkata"),
       (4,"mumbai"),
       (5,"banglore");
      
INSERT into countries(country_id ,country_name ,region_id)
values (10,"india",1),
       (11,"nepal",2),
       (12,"usa",3),
       (13,"australia",4),
       (14,"japan",5);

      
INSERT into locations(location_id, street_address, postal_code, city, state_province, country_id)
values (101,"palakurthy",506222,"hyderabad","ts",10),
       (102,"teegaram",506201,"warangal","ap",11),
       (103,"khammam",500020,"plk","mp",12),
       (104,"thorur",503333,"hanamkonda","up",13),
       (105,"visnoor",504343,"kazipet","kerala",14);   
INSERT into departments(department_id,department_name,location_id)
values (101,"hr",101),
       (102,"manager",102),
       (103,"sde",103),
       (104,"asde",104),
       (105,"non-technical",105);
insert into jobs(job_id,job_title,min_salary,max_salary)
values (1,"web developer",20000,100000),
       (2,"saas",25000,45000),
       (3,"data analasis",35000,60000),
       (4,"se",40000,90000),
       (5,"android",30000,60000); 
insert into employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES
    (1, 'David', 'Brown', 'davidbrown@example.com', 123456789, '2022-01-01', 1, 5000, 1,101),
    (2, 'Emily', 'Williams', 'emilywilliams@example.com', 987654321, '2022-02-01', 2, 6000, 2,102),
    (3, 'Olivia', 'Jones', 'oliviajones@example.com', 555555555, '2022-03-01', 1, 5500, 1,103),
    (4, 'James', 'Wilson', 'jameswilson@example.com', 111111111, '2022-04-01', 3, 7000, 2,104),
    (5, 'Chris', 'Wilson', 'chriswilson@example.com', 999999999, '2022-05-01', 2, 6500, 1,105),
    (6, 'Benjamin', 'Anderson', 'benjaminanderson@example.com', 444444444, '2022-06-01', 1, 5200, 2,103),
    (7, 'Michael', 'Brown', 'michaelbrown@example.com', 222222222, '2022-07-01', 3, 7200, 1,102),
    (8, 'Jessica', 'Taylor', 'jessicataylor@example.com', 888888888, '2022-08-01', 2, 6300, 2,101),
    (9, 'Lucas', 'Lewis', 'lucaslewis@example.com', 666666666, '2022-09-01', 1, 5100, 1,102),
    (10, 'Amy', 'Moore', 'amymoore@example.com', 333333333, '2022-10-01', 3, 6800, 2,103);
   
insert into dependents(dependent_id,first_name,last_name,relationship,employee_id)
values (101,"venkateshwarlu","gajji","father",1),
       (102,"lavanya","g","mother",2),
       (103,"ramesh","kumari","sister",3),
       (104,"uday","kiran","brother",4),
       (105,"surabhi","patel","mother",5);
-- Q.3.aIn departments table, add a new field ‘manager_name’ of type VARCHAR       
ALTER table departments add column manager_name varchar(50); 
-- Q.3.b REMOVE field max_salary from jobs.
alter table jobs drop column max_salary;
-- Q.3.c In the locations table, rename postal_code column to pincode.
alter table locations drop constraint locations_chk_1;
alter table locations change column postal_code pincode varchar(50);
-- Q.4 // all the constraints are imposed while creating tables 





