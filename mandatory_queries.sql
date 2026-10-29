-- Exercise 3.11 (a)
SELECT DISTINCT s.ID, s.name
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE c.dept_name = 'Comp. Sci.';


-- Exercise 3.11 (b)
SELECT s.ID, s.name
FROM student s
WHERE NOT EXISTS (
    SELECT 1
    FROM takes t
    WHERE t.ID = s.ID
      AND t.year < 2017
);


-- Exercise 3.11 (c)
SELECT dept_name, MAX(salary) AS max_salary
FROM instructor
GROUP BY dept_name;


-- Exercise 3.11 (d)
SELECT MIN(max_salary) AS min_of_max_salaries
FROM (
    SELECT dept_name, MAX(salary) AS max_salary
    FROM instructor
    GROUP BY dept_name
) AS dept_salaries;


-- Exercise 3.15 (a)
SELECT c.customer_id, c.customer_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM branch b
    WHERE b.branch_city = 'Brooklyn'
      AND NOT EXISTS (
          SELECT 1
          FROM depositor d
          JOIN account a
            ON d.account_number = a.account_number
          WHERE d.customer_id = c.customer_id
            AND a.branch_name = b.branch_name
      )
);


-- Exercise 3.15 (b)
SELECT SUM(amount) AS total_loan_amount
FROM loan;


-- Exercise 3.15 (c)
SELECT branch_name
FROM branch
WHERE assets > ANY (
    SELECT assets
    FROM branch
    WHERE branch_city = 'Brooklyn'
);


-- Exercise 3.24
SELECT s.ID, s.name
FROM student s
JOIN advisor a ON s.ID = a.s_ID
JOIN instructor i ON a.i_ID = i.ID
WHERE s.dept_name = 'Accounting'
  AND i.dept_name = 'Physics';


-- Exercise 3.25
SELECT dept_name
FROM department
WHERE budget > (
    SELECT budget
    FROM department
    WHERE dept_name = 'Philosophy'
)
ORDER BY dept_name ASC;
