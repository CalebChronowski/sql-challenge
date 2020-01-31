--Question 1
--For each employee list the following: 
--employee number, last name, first name, gender, salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary   
FROM employees  
INNER JOIN salaries  
ON employees.emp_no = salaries.emp_no;

--Question 2
--List all employees hired in 1986:

SELECT employees.last_name, employees.first_name, employees.emp_no
FROM employees
WHERE hire_date BETWEEN '1986-01-01'AND '1986-12-31';

--Question 3
--List the manager of each department with the following information:
--dept_no, dept_name manager's emp_no, dept_name, last_name, first_name, start_date, end_date

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE to_date = '9999-01-01';

--Question 4
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--Question 5
--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.last_name, employees.first_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Question 6
--List all employees in the Sales department, including their:
--employee number, last name, first name, and department name

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--Question 7
--List all employees in the Sales and Development departments, including their:
--employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--Question 8
--In descending order, list the frequency count of employee last names

SELECT employees.last_name, COUNT(employees.last_name) 
FROM employees
GROUP BY employees.last_name
ORDER BY 2 DESC;