
DROP TABLE IF EXISTS salaries_tb;
DROP TABLE IF EXISTS dept_manager_tb;
DROP TABLE IF EXISTS dept_emp_tb;
DROP TABLE IF EXISTS departments_tb;
DROP TABLE IF EXISTS employees_tb;
DROP TABLE IF EXISTS titles_tb;

--creates the table for the titles csv
CREATE TABLE titles_tb(
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(20) UNIQUE
);
--creates the table for the employees csv
CREATE TABLE employees_tb (
	emp_no VARCHAR(6) PRIMARY KEY,
	emp_title_id VARCHAR(5),
	FOREIGN KEY (emp_title_id) REFERENCES titles_tb(title_id),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE
);
--creates the table for the departments csv
CREATE TABLE departments_tb(
		dept_no VARCHAR(4) PRIMARY KEY,
		dept_name VARCHAR(30) Unique
);
--creates the table for the dept_emp csv
Create TABLE dept_emp_tb(
	emp_no VARCHAR(6),
	FOREIGN KEY (emp_no) REFERENCES employees_tb(emp_no),
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments_tb(dept_no),
	PRIMARY KEY(emp_no,dept_no)	
);
--creates the table for the dept_manager csv
CREATE TABLE dept_manager_tb(
	dept_no VARCHAR(4),
	FOREIGN KEY(dept_no) REFERENCES departments_tb(dept_no),
	emp_no VARCHAR (6),
	FOREIGN KEY (emp_no) REFERENCES employees_tb,
	---- need to make this a junction of the 2 foreign keys in the table
	PRIMARY KEY (emp_no,dept_no) 
);
--creates the table for the salaries csv
CREATE TABLE salaries_tb(
	emp_no VARCHAR(6),
	FOREIGN KEY (emp_no) REFERENCES employees_tb(emp_no),
	salary INTEGER
)



