--------------------------------------MEDIUM-----------------------------------------------------------------
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee8 (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee8 (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

select E.salary,e.name,d.dept_name
from 
employee8 as E
inner join
department as d
on
e.department_id=d.id
where salary in
(
select max(e2.salary)
from employee8 as e2
where e2.department_id=e.department_id
)
order by d.dept_name

-----------------------------------------------HARD----------------------------------------

CREATE TABLE emply1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_salary int
)

CREATE TABLE emply3 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_salary int
)

INSERT INTO emply1 (emp_id, emp_name,emp_salary) VALUES
(1, 'AA',1000),
(2, 'BB',300);

INSERT INTO emply3 (emp_id, emp_name,emp_salary) VALUES
(2, 'BB',600),
(3, 'CC',500);


with res_set as 
(	select a.* from emply1 a
	UNION ALL
	select b.* from emply3 b
)
select Emp_ID, Emp_name, min(emp_Salary) as Salary from res_set r
	group by Emp_ID, Ename;
