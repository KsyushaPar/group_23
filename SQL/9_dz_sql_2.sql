--	Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees
(id serial primary key,
employee_name VARCHAR (50) not null);

select * from employees;

--	Наполнить таблицу employee 70 строками.
 insert into employees (id,employee_name)
 values (default, 'Viktoriya G');
 
select * from employees;

--	Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null

create table salary (
id serial primary key,
monthly_salary int not null
);

--	Наполнить таблицу salary 
insert into salary (id,monthly_salary)
values (default,2500);

select * from salary;

--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique

create table roles (
id serial primary key,
role_name int not null unique
);

--Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type VARCHAR (30);

--Наполнить таблицу roles 20 строками:
insert into roles (id, role_name)
values (default, 'Senior Automation QA engineer');

select * from roles;

--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
create table employee_salary (
id serial primary key,
salary_id int not null
);
select * from employee_salary;
alter table employee_salary add column employee_id int not null unique;

-- Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (id, salary_id, employee_id)
values (default, 14, 90);

--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
id serial primary key,
employee_id int not null unique references employees (id),
role_id int not null references roles (id)
)
--Наполнить таблицу roles_employee 40 строками

insert into roles_employee (id, employee_id, role_id)
values (default,60,4);

select * from employees;
select * from roles;
select * from roles_employee;
