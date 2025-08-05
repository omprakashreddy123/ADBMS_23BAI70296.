create table employee_TABLE(
emp_id int primary key,
emp_name varchar(max),
emp_dept varchar(max),
manager_id int,
foreign key (manager_id) references employee_TABLE(emp_id)

);

insert into employee_TABLE VALUES
(1,'OM PRAKASH','HR',2),

(2,'PREAM','FINANCE',1),
(3,'SIDDARTHA','IT',1),
(4,'PRADEEP','FINANCE',1),
(5,'RAJASEKAR','IT',1),
(6,'PUSHPENDRA','FINANCE',1);

select A.emp_name as EmployeeName, A.emp_dept as EmployeeDept, E.emp_name as 'Manager Name', E.emp_dept as ManagerDept
		from employee_TABLE as A 
  LEFT JOIN 
  employee_TABLE as E 
  on
  E.emp_id = A.manager_id;    
