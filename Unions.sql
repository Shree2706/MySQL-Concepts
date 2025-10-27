-- Unions

#A union is how you can combine rows together- not columns like we have been doing with joins where one column is put next to another
#Joins allow you to combine the rows of data

#Now you should keep it the same kind of data otherwise if you start mixing tips with first_names it would be really confusing, but you can do it.

SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
from employee_salary ;

SELECT first_name, last_name, 'Old Woman' AS Label
FROM employee_demographics
WHERE age > 40 AND gender='Female'
UNION
SELECT first_name, last_name, 'Old Man'
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, "Highly paid Employee" AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;























