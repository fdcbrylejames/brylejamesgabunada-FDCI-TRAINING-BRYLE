--1.
   SELECT 
   first_name,
   last_name

   FROM employees;

--2.
   SELECT 
   first_name,
   last_name

   FROM employees
   WHERE 
   last_name = 'Piveteau';

--3. 
 SELECT 
	hire_date,
   first_name,
   last_name

   FROM employees
   ORDER BY hire_date ASC;

--4. 
--explain SELECT-> check the query
SELECT
    COUNT(emp_no)
    FROM employees;
--5.
SELECT YEAR(hire_date) AS Year, COUNT(emp_no) AS NumberHired
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY Year;

--6.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no -- Join on matching emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no; -- Join on matching dept_no

--7.
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    COALESCE(t.title, 'No Title Assigned') AS title -- if null return string 
FROM 
    employees AS e
LEFT JOIN 
    titles AS t ON e.emp_no = t.emp_no;
--8
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    s.salary
FROM 
    employees AS e
LEFT JOIN 
    dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN 
    departments AS d ON de.dept_no = d.dept_no
LEFT JOIN 
    salaries AS s ON e.emp_no = s.emp_no
WHERE 
    d.dept_name = 'Sales'
    AND s.salary > (
        SELECT 
            AVG(s2.salary)
        FROM 
            salaries AS s2
        JOIN 
            dept_emp AS de2 ON s2.emp_no = de2.emp_no
        JOIN 
            departments AS d2 ON de2.dept_no = d2.dept_no
        WHERE 
            d2.dept_name = 'Sales'-- calculates only on SALES dept.
    );
--9.
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name,
    (SELECT COUNT(*)
     FROM titles AS t
     WHERE t.emp_no = e.emp_no) AS title_count
FROM 
    employees AS e;

--10. tentative answer
SELECT 
    de.dept_no, 
	e.emp_no,
    e.first_name, 
    e.last_name

FROM employees AS e
INNER JOIN dept_emp AS de on e.emp_no = de.emp_no
GROUP BY dept_no;

--11 
SELECT 
    d.dept_name, 
    AVG(s.salary) AS avg_salary
FROM 
    departments AS d
INNER JOIN 
    dept_emp AS de ON d.dept_no = de.dept_no
INNER JOIN 
    employees AS e ON de.emp_no = e.emp_no
INNER JOIN 
    salaries AS s ON e.emp_no = s.emp_no
GROUP BY 
    d.dept_name;

--12
SELECT 
    e.emp_no AS EmployeeNumber,
    e.first_name AS EmployeeFirstName,
    e.last_name AS EmployeeLastName,
    CONCAT(m.first_name, ' ', m.last_name) AS ManagerName,
    dept_name

FROM 
    dept_manager AS dm
LEFT JOIN 
    employees AS e ON dm.emp_no = e.emp_no
LEFT JOIN 
    employees AS m ON dm.emp_no = m.emp_no 
LEFT JOIN departments AS dep on dm.dept_no =  dep.dept_no
ORDER BY 
    e.emp_no;

--13. not yet working
SELECT CONCAT(A.first_name, ' ', A.last_name) AS employee1,
       CONCAT(B.first_name, ' ', B.last_name) AS employee2,
       A.birth_date
FROM employees AS A
INNER JOIN employees AS B ON A.birth_date = B.birth_date
WHERE A.emp_no <> B.emp_no 
ORDER BY A.birth_date; 
--14
select first_name, last_name, dept_name, from_date, to_date
FROM dept_emp AS d
LEFT JOIN employees AS e ON d.emp_no = e.emp_no
LEFT JOIN departments AS dept ON d.dept_no = dept.dept_no
WHERE dept_name = 'Sales';

--15
SELECT dep.dept_name, MAX(s.salary) AS max_salary
FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS dep ON de.dept_no = dep.dept_no
GROUP BY dep.dept_name;
