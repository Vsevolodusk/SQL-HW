CREATE TABLE workers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(60) , 
  birthday DATE , 
  SALARY NUMERIC(8 , 2)
);

DROP TABLE employees;


ALTER TABLE workers 
ADD COLUMN vacation_days INTEGER NOT NULL DEFAULT 0 CHECK(vacation_days > 0) ,
ADD COLUMN email VARCHAR(120) UNIQUE ;

ALTER TABLE workers 
ALTER COLUMN email 
SET NOT NULL;

ALTER TABLE workers 
ADD CHECK(email != '');

ALTER TABLE workers
ALTER COLUMN salary 
SET DEFAULT 500;

ALTER TABLE workers RENAME TO employees;


UPDATE employees SET salary = 2000 
WHERE name = 'Pavel' ; 

UPDATE employees SET birthday = '1987-01-01'
WHERE id = 4 ;


UPDATE employees SET salary = 700
WHERE salary < 650;


UPDATE employees SET vacation_days = 5 
WHERE id > 2 AND id <= 5;


UPDATE employees SET 
name = 'Yevgen' , 
salary = salary + 200 
WHERE name = 'Yaroslav';


SELECT * FROM employees
WHERE id = 3;


select * FROM employees
WHERE salary < 800

select * FROM employees
WHERE salary != 500


select salary , vacation_days FROM employees 
WHERE name = 'Yevgen'

select * FROM employees
WHERE name = 'Petro'

select * FROM employees
WHERE name != 'Petro'


SELECT * FROM employees
WHERE (DATE_PART('year', AGE(CURRENT_DATE, birthday)) > 27) OR salary = 1000

DELETE FROM employees
WHERE id = 7

DELETE  FROM employees
WHERE name = 'Mykola'

DELETE FROM employees
WHERE vacation_days > 20



SELECT * FROM employees 

