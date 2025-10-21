# FROM AND SELECT statements :
/*
The From and Select statements ar used to basically import the data in the form of tables present in DBs.
*/
SELECT *
FROM employee_salary;

# WHERE Clause:
/* The WHERE clause is used to filter records (rows of data)

It's going to extract only those records that fulfill a specified condition.
So basically if we say "Where name is = 'Alex' - only rows were the name = 'Alex' will return
So this is only effecting the rows, not the columns
*/

#Let's take a look at how this looks
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_demographics
WHERE gender = 'Female';


#We can also return rows that do have not "Scranton"
SELECT *
FROM employee_demographics
WHERE gender != 'Female';


#We can use WHERE clause with date value also
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

-- Here '1990-01-01' is the default data formate in MySQL.
-- There are other date formats as well that we will talk about in a later lesson.


# LIKE STATEMENT

-- two special characters a % and a _

-- % means anything
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

-- _ means a specific value
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

#GROUP BY and ORDER BY clause :
/*
1. GROUP BY - 
When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them.
*/
select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;

select occupation, salary
from employee_salary
group by occupation, salary;

/*2. ORDER BY - 
The ORDER BY keyword is used to sort the result-set in ascending or descending order.
The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
*/
select *
from employee_demographics
order by gender, age desc;

# Where vs Having Clause
/*
Both were created to filter rows of data, but they filter 2 separate things
Where is going to filters rows based off columns of data
Having is going to filter rows based off aggregated columns when grouped
*/
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;


-- let's try to filter on the avg age using where

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;
-- this doesn't work because of order of operations. On the backend Where comes before the group by. So you can't filter on data that hasn't been grouped yet
-- this is why Having was created

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT gender, AVG(age) as AVG_age
FROM employee_demographics
GROUP BY gender
HAVING AVG_age > 40
;
























