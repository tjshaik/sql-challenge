--Q1 : List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--Q2 :List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= TO_DATE('01/01/1986', 'MM/DD/YYYY') 
  AND hire_date <= TO_DATE('12/31/1986', 'MM/DD/YYYY');
  
--Q5 : List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B   
  SELECT first_name, last_name, sex
  FROM employees
  WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--Q6: List each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no, last_name, first_name
FROM employees
WHERE employees.emp_no = department.emp_no
	AND dept_emp.dept_no = department.dept_no
	AND department.dept_name = 'Sales';
--Q8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, frequency
FROM (
  SELECT last_name, COUNT(*) AS frequency
  FROM employees
  GROUP BY last_name
) AS subquery
ORDER BY frequency DESC;