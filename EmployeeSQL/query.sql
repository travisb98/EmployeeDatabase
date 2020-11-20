
-- SELECT * FROM titles_tb
-- SELECT * FROM employees_tb
-- SELECT * FROM departments_tb
-- SELECT * FROM dept_emp_tb
-- SELECT * FROM dept_manager_tb
-- SELECT * FROM salaries_tb


-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT
	e.emp_no AS "Employee Num",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Gender",
	s.salary AS "Salary"
FROM employees_tb AS e
LEFT join salaries_tb AS S ON
e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees_tb
Where hire_date > '1986-01-01'::date
AND hire_date < '1986-12-31'::date;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no as "Department Num",
	d.dept_name AS "Department Name",
	dm.emp_no AS "Managers Employee Number",
	em.last_name AS "Managers Last Name",
	em.first_name AS "Managers First Name"
FROM departments_tb AS d
LEFT JOIN dept_manager_tb as dm
ON d.dept_no = dm.dept_no
JOIN employees_tb as em 
on dm.emp_no=em.emp_no;
	


-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	em.emp_no AS "Employee Number",
	em.last_name AS "Last Name",
	em.first_name AS "First Name",
	de.dept_no AS "Department Number",
	dp.dept_name AS "Department Name"
FROM employees_tb AS em
LEFT JOIN dept_emp_tb AS de
ON em.emp_no = de.emp_no
LEFT JOIN departments_tb AS dp
ON de.dept_no=dp.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex FROM employees_tb AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';



-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	dp.dept_name AS "Department Name"
FROM employees_tb AS e
JOIN dept_emp_tb AS de
ON e.emp_no=de.emp_no
JOIN departments_tb AS dp
ON de.dept_no=dp.dept_no
WHERE dp.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
dp.dept_name AS "Department Name"
FROM employees_tb AS e
LEFT Join dept_emp_tb AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments_tb AS dp
ON de.dept_no = dp.dept_no
WHERE (dp.dept_name = 'Sales') OR (dp.dept_name ='Development')
ORDER BY e.first_name ASC;



-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", (SELECT COUNT(last_name) AS "Number of Employees") FROM employees_tb
GROUP BY last_name
ORDER BY last_name DESC;
