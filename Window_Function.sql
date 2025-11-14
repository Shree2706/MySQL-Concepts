-- Window Functions - 
-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank
SELECT *
FROM employee_demographics AS dem
JOIN employee_demographics AS sal
	ON dem.employee_id = sal.employee_id
;

-- first let's look at group by
SELECT gender, ROUND(AVG(salary),1)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- now let's try doing something similar with a window function

SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER() as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- now we can add any columns and it works. We could get this exact same output with a subquery in the select statement, 
-- but window functions have a lot more functionality,

SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- let's take a look at row number (sort of an aggregate number)
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_no,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_no
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- there's another form of rank called dense rank
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) row_num,
Rank() OVER(PARTITION BY gender ORDER BY salary desc) rank_1,
dense_rank() OVER(PARTITION BY gender ORDER BY salary desc) dense_rank_2 -- this is numerically ordered instead of positional like rank
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;



















