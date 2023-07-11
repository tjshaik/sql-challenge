DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;

-- Create the titles table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY NOT NULL,
  title VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
  emp_no INT PRIMARY Key NOT NULL,
  emp_title_id VARCHAR(10) NOT NULL REFERENCES titles(title_id),
  birth_date DATE NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex CHAR(1)NOT NULL,
  hire_date DATE NOT NULL
);
-- Create the department table
CREATE TABLE department (
  dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(50) NOT NULL
);

-- Create the salaries table
CREATE TABLE salaries (
  emp_no INT PRIMARY KEY NOT NULL REFERENCES employees(emp_no),
  salary INT NOT NULL
);
-- Create the dept_emp table
CREATE TABLE dept_emp (
  emp_no INT PRIMARY KEY NOT NULL REFERENCES employees(emp_no),
  dept_no VARCHAR(10) NOT NULL REFERENCES department(dept_no)
);
-- Create the dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(10) NOT NULL REFERENCES department(dept_no),
  emp_no INT NOT NULL REFERENCES employees(emp_no),
  PRIMARY KEY (dept_no)
);