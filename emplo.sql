create database lab;
use lab;
create table employee(ID INT(10),name varchar(20),
occupation varchar(10));
INSERT INTO employee (ID, name, occupation) VALUES
('1', 'John Doe', 'Engineer'),
('2', 'Jane Smith', 'Designer'),
('3', 'Michael Johnson', 'Manager'),
('4', 'Emily Williams', 'Developer'),
('5', 'David Brown', 'Analyst'),
('6', 'Sarah Lee', 'Assistant');
select * from employee;
drop database lab;
create database lab;
use lab;
create table employee(ID varchar(10),name varchar(20),
occupation varchar(10));
INSERT INTO employee (ID, name, occupation) VALUES
('1', 'John Doe', 'Engineer'),
('2', 'Jane Smith', 'Designer'),
('3', 'Michael Johnson', 'Manager'),
('4', 'Emily Williams', 'Developer'),
('5', 'David Brown', 'Analyst'),
('6', 'Sarah Lee', 'Assistant');
select * from employee;

SELECT * FROM employee WHERE name LIKE 'John%';
SELECT * FROM employee WHERE name LIKE '__ee';
SELECT * FROM employee WHERE name LIKE '[JE]%';
SELECT * FROM employee WHERE name LIKE '[^J]%';
SELECT * FROM employee WHERE name LIKE '%[0-9]%';
SELECT * FROM employee WHERE name LIKE '____';
SELECT * FROM employee WHERE name LIKE 'J%e';
SELECT * FROM employee WHERE name LIKE '%\%%';
SELECT * FROM employee WHERE name LIKE 'JOhn %';
SELECT * FROM employee WHERE name LIKE 'D(a|r)%';


drop table worker;
CREATE TABLE worker (
       id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO worker (first_name, last_name, salary) VALUES
('Aoishi', 'Mojumder', 3000),
('Puja', 'Smith', 6000),
('Michael', 'Rayn', 7000),
('Emily', 'Williams', 5000),
('David', 'Brown', 2000);

SELECT * FROM worker
WHERE salary > ANY (
    SELECT AVG(salary) FROM worker
);
CREATE TABLE worker1 (
       id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO worker1 (first_name, last_name, salary) VALUES
('Aoishi', 'Mojumdeu', 3000),
('Iuja', 'Smithe', 6000),
('Oichael', 'Rayni', 7000),
('Emily', 'Williao', 5000),
('David', 'Browna', 2000);
SELECT * 
FROM worker1 
WHERE LOWER(first_name) REGEXP '^[aeiou]' AND LOWER(last_name) REGEXP '[aeiou]$';
SELECT MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary FROM worker1;

SELECT *
FROM worker1
WHERE salary BETWEEN (
    SELECT MIN(salary) FROM worker1
) AND (
    SELECT MAX(salary) FROM worker1
);


CREATE TABLE salary_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salary DECIMAL(10, 2),
    worker_id INT,
    paid_unpaid_status ENUM('paid', 'unpaid'),
    payment_date DATE,
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);
INSERT INTO salary_history (salary, worker_id, paid_unpaid_status, payment_date) VALUES
(4000.00, 1, 'paid', '2024-03-01'),
(7500.00, 1, 'paid', '2024-03-15'),
(2200.00, 2, 'paid', '2024-03-06'),
(2300.00, 2, 'paid', '2024-03-19'),
(3500.00, 3, 'paid', '2024-03-13'),
(5400.00, 3, 'unpaid', '2024-03-23');
SELECT w2.first_name, w2.last_name, SUM(sh1.salary) AS total_paid_amount
FROM salary_history sh1
JOIN worker w2 ON sh.worker_id = w2.id
WHERE sh1.paid_unpaid_status = 'paid' AND sh1.payment_date <= CURDATE()
GROUP BY sh1.worker_id;
select * from salary_history ;
drop table menu;

CREATE TABLE menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    parent_id INT
  
);

INSERT INTO menu (name, parent_id) VALUES
('Main Page',1),
('Profile', NULL),
('Products',5),
('Team Members', 2),
('Goals', 2),
('Future Plans', 2),
('Desserts', 3), 
('Cake', 10),   
('Ice Cream', 10),
('Cookies', 10); 
select * from menu;
SELECT m1.name AS menu_item, COALESCE(m2.name, 'Root') AS parent_menu
FROM menu m1
LEFT JOIN menu m2 ON m1.parent_id = m2.id;






