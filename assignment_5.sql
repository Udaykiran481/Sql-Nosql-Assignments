---MySql

--1. Find all the departments where the minimum salary is less than 2000.
SELECT d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING MIN(e.salary) < 2000;

--2.Find all the countries where no employees exist.

WITH country_employees AS(
  SELECT DISTINCT c.country_id
  FROM employees e join departments d on d.department_id =e.department_id 
  join locations l on l.location_id =d.location_id 
  join countries c on c.country_id =l.country_id )
SELECT c.country_name
FROM countries c
LEFT JOIN country_employees ce ON c.country_id = ce.country_id
WHERE ce.country_id is NULL ;

--3.From the following tables write a query to find all the jobs, having at least 2 employees in a
--single department.(don’t use joins)

SELECT job_title 
FROM jobs
where job_id in(select job_id from employees
WHERE department_id IN (
  SELECT department_id
  FROM employees e
  GROUP BY department_id
  HAVING COUNT(*) >= 2
));

--4.From the following tables write a query to find all the countries, having cities with all the city
--names starting with 'a'.(don’t use joins)

select country_name from countries c 
where country_id in(SELECT country_id from locations l 
where city LIKE 'h%');

--5. From the following tables write a query to find all the departments, having no cities.
SELECT d.department_id, d.department_name 
FROM departments d
left JOIN locations l ON l.location_id = d.location_id 
where d.city is null;

