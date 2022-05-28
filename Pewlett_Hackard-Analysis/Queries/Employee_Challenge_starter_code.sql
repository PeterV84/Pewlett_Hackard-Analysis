CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
CREATE TABLE employees ( 
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no) 
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE titles (
  emp_no INT NULL,
  title VARCHAR(40) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no, title, from_date, to_date)
);


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
ORDER BY employees.emp_no
;

ALTER TABLE retirement_title


DROP TABLE retirement_title CASCADE;
select * FROM retirement_title;
select*from departments

SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_title
--WHERE (retirement_title.from_date BETWEEN '1952-01-01' AND '1955-12-31')
WHERE (retirement_title.to_date = '9999-01-01')
ORDER BY emp_no;

FROM unique_titles



DROP TABLE unique_titles CASCADE;
select*from unique_titles;

SELECT COUNT (title) as "count title",
title
Into retiring_title
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY "count title" desc;

SELECT*FROM retiring_title
DROP TABLE retiring_title CASCADE;

SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
Birth_date
from employees

SELECT
from_date,
to_date
from dept_emp

SELECT
title
from titles

SELECT
employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.to_date,
dept_emp.from_date
INTO Mentor
from employees
INNER JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no;

SELECT*FROM Mentor;
DROP TABLE Mentor CASCADE;

SELECT DISTINCT ON (emp_no)Mentor.emp_no,
Mentor.first_name,
Mentor.last_name,
Mentor.birth_date,
Mentor.to_date,
Mentor.from_date,
titles.title
INTO mentorship_eligibility
from Mentor
INNER JOIN titles
ON titles.emp_no = Mentor.emp_no
WHERE (Mentor.to_date = '9999-01-01')
AND (Mentor.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;


SELECT*FROM mentorship_eligibility;
