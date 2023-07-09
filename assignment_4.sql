---MySql
--1.From the following tables write a SQL query to find the details of an employee. return full name, email, salary, 
--Department Name, postal code, and City.

SELECT
  CONCAT(e.first_name , ' ', e.last_name) AS FullName,
  e.email ,
  e.salary ,
  d.department_name ,
  l.pincode ,
  l.city 
FROM
  employees e 
JOIN
  departments d ON e.department_id =d.department_id 
JOIN
  locations l on l.location_id =d.location_id ;
  
--2. From the following tables write a SQL query to find the departments whose location is in "Jammu Kashmir" or "Jharkhand". 
--Return Department Name, state_province, street_address.

select department_name,l.state_province ,l.street_address  from 
departments d 
inner join
locations l on l.location_id =d.location_id 
where l.state_province in ( 'Jammu Kashmir', 'Jharkhand');

/*3. From the following tables write a SQL query to find the count of employees present in
different jobs whose average salary is greater than 10,000. Return all the jobs with
employee count, Job Name, and average salary.*/

SELECT COUNT(*) AS EmployeeCount, j.job_title , AVG(Salary) AS AverageSalary 
FROM employees e inner join jobs j on e.job_id =j.job_id 
GROUP BY j.job_title  
HAVING AVG(Salary) > 10000;

/*4. From the following table write a SQL query to find all the first_names and
last_names in both dependents and employees tables. Return the duplicate records as
well and order the records in descending order of the last_name column.*/

SELECT first_name, last_name
FROM (
    SELECT first_name, last_name FROM dependents
    UNION ALL
    SELECT first_name, last_name FROM employees
) AS combined_names
ORDER BY last_name DESC;

--5. From the following table write a SQL query to list every employee that has a manager with the name of his or her manager

SELECT CONCAT(e.first_name , ' ', e.last_name) AS employee_name,CONCAT(m.first_name , ' ', m.last_name) AS manager_name
from employees e
join  employees m
on e.manager_id =m.employee_id ;

/*6. Find the departments that have more than 5 employees earning a salary greater than
50,000 and are located in either New York or California. Include the department name,
location, and the number of employees meeting the criteria.*/

SELECT d.department_name, l.state_province, COUNT(*) AS num_employees
FROM departments d
JOIN locations l ON d.location_id =l.location_id 
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 50000
AND l.state_province  IN ('New York', 'California')
GROUP BY d.department_name, l.state_province 
HAVING COUNT(*) > 5;


--7. List any employees who have dependents and have a job title that includes the word 'manager', 
--and sort the results by department name in ascending order.

SELECT CONCAT(e.first_name , ' ', e.last_name) AS employee_name 
FROM employees AS e
JOIN jobs j ON j.job_id =e.job_id
JOIN departments d2 ON d2.department_id =e.department_id 
JOIN dependents AS d ON e.employee_id = d.employee_id
WHERE j.job_title LIKE '%manager%'
ORDER BY d2.department_name ASC;

/*8. Add a column in the dependent table called “city” depicting their current location of
stay. Find all employees who have been hired in the past 3 years and have dependents
living in a city that is different from the city they work in (if I work in Kolkata, then my
dependent should not be in Kolkata).
Additionally, only include employees whose salary is greater than the average salary of
their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average
salary under the same job_title “developer” is 70k), and whose manager's job title
includes the word 'director'. Finally, include the department name and location of each
employee, and sort the results by department name in ascending order*/


-- filling up empty columns
ALTER table dependents add column city varchar(50);
UPDATE dependents set city ='kolkata' where dependent_id =1;
UPDATE dependents set city ='mumbai' where dependent_id =2;
UPDATE dependents set city ='kolkata' where dependent_id =3;
UPDATE dependents set city ='chennai' where dependent_id =4;
UPDATE dependents set city ='Hyderabad' where dependent_id =5;

-- filling up empty columns
UPDATE departments set manager_name ='director' where department_id =1;
UPDATE departments set manager_name ='director' where department_id =2;
UPDATE departments set manager_name ='supervisor' where department_id =3;
UPDATE departments set manager_name ='sales head' where department_id =4;
UPDATE departments set manager_name ='director' where department_id =5;


SELECT CONCAT(e.first_name,' ',e.last_name)as emp_name,l.city as emp_city ,d.city as dependent_city ,salary ,j.job_title ,d2.manager_name as manager_name,
d2.department_name 
FROM employees e join dependents d on e.employee_id =d.employee_id
join departments d2 on e.department_id =d2.department_id 
join locations l on d2.location_id =l.location_id
join jobs j on j.job_id =e.job_id 
where e.hire_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
and l.city <> d.city
and 
 e.salary > (
      SELECT AVG(salary)
      FROM employees
      WHERE job_title = j.job_title
  )
and d2.manager_name like '%director%' 
order by d2.department_name asc
;
