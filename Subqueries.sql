-- Subqueries
# So subqueries are queries within queries
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
				FROM employee_salary
                WHERE dept_id = 1);
                
# Calculating average salary
SELECT first_name, last_name, salary,
(SELECT AVG(salary)
FROM employee_salary) AS avg_sal
FROM employee_salary;
                
-- We can also use it in the FROM Statement
-- when we use it here it's almost like we are creating a small table we are querying off of
SELECT gender, AVG(Min_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
GROUP BY gender
;
                
                
                