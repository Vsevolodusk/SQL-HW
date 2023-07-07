CREATE TABLE workers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(60) , 
  birthday DATE , 
  SALARY NUMERIC(8 , 2)
);

DROP TABLE workers;


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

SELECT * FROM employees
WHERE (DATE_PART('year', AGE(CURRENT_DATE, birthday)) > 25) AND (DATE_PART('year', AGE(CURRENT_DATE, birthday)) <= 28)


SELECT * FROM employees 

-- Зміна структури таблиці
-- ALTER TABLE 
-- Додавання нового стовпчика(-ів)
ALTER TABLE users 
ADD COLUMN eye_color VARCHAR(100) NOT NULL DEFAULT 'brown' CHECK(eye_color != ''),
ADD COLUMN hair_color VARCHAR(100) CHECK(hair_color != '');
-- Видалення стовпчиків
ALTER TABLE users
DROP COLUMN hair_color;
-- Додавання обмежень
ALTER TABLE users
ADD UNIQUE(email);
-- Додавання NOT NULL
ALTER TABLE users
ALTER COLUMN is_male SET NOT NULL;
-- Видалення обмежень
ALTER TABLE users
DROP CONSTRAINT "User must have correct name";
-- Видалення NOT NULL
ALTER TABLE users
ALTER COLUMN is_male DROP NOT NULL;
-- Зміна значень за замовчанням
ALTER TABLE users
ALTER COLUMN height
SET DEFAULT 1.5;
-- "Видалення" значень за замовчанням (воно по факту стає NULL)
ALTER TABLE users
ALTER COLUMN height
DROP DEFAULT;
-- Зміна типу даних
ALTER TABLE users
ALTER COLUMN email
TYPE VARCHAR(128);
-- Перейменування:
--  Стовпчика
ALTER TABLE users RENAME COLUMN last_name TO surname;
-- таблиці
ALTER TABLE users RENAME TO people;


SELECT * FROM users 
WHERE is_male = TRUE AND height < 1 ;

SELECT * FROM users 
WHERE first_name IN ('User1' , 'User2')