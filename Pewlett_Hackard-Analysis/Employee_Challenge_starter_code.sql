-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;
SELECT 
	emp_no,
    first_name,
	last_name
INTO EMP
FROM employees;

SELECT 
	title,
    from_date,
	to_date
INTO TITLE
FROM titles;

SELECT 
	employees.emp_no,
    employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_title
FROM employees
Inner Join titles
on employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

DROP TABLE retirement_title CASCADE;
select * FROM retirement_title;