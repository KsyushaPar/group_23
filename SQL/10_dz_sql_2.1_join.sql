--HW2 join

--1.Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id inner join salary
on salary.id = employee_salary.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id inner join salary
on salary.id = employee_salary.salary_id where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employees.employee_name, salary.monthly_salary
from employees full join employee_salary on employees.id = employee_salary.employee_id inner join salary
on salary.id = employee_salary.salary_id where employees.employee_name is null ;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employees.employee_name, salary.monthly_salary
from employees full join employee_salary on employees.id = employee_salary.employee_id full join 
salary on salary.id = employee_salary.salary_id where employees.employee_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.

select employees.employee_name, salary.monthly_salary
from employees full join employee_salary on employees.id = employee_salary.employee_id
full join salary on salary.id  = employee_salary.salary_id where monthly_salary is null;

--6. Вывести всех работников с названиями их должности.

select employees.employee_name, roles.role_name
from employees left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles_employee.employee_id = roles.id;

--7. Вывести имена и должность только Java разработчиков.

select employees.employee_name, roles.role_name
from employees full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id where role_name ilike '%Java developer%';

-- 8. Вывести имена и должность только Python разработчиков

select employees.employee_name, roles.role_name
from employees full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id where role_name ilike '%Python developer%';

--9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name
from employees inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id where role_name ilike '%qa%';

--10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name
from employees inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id where role_name ilike '%manual%qa%';

--11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name
from employees inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id where role_name ilike '%autom%qa%';

--12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, salary.monthly_salary 
from employees full join employee_salary on employees.id = employee_salary.employee_id
full join salary on salary.id = employee_salary.salary_id 
full join roles_employee on employees.id = roles_employee.employee_id 
full join roles on roles.id =roles_employee.role_id 
where role_name ilike '%junior%' and employees.employee_name notnull ;

--13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, salary.monthly_salary 
from employees full join employee_salary on employees.id = employee_salary.employee_id
full join salary on salary.id = employee_salary.salary_id
full join roles_employee on employees.id = roles_employee.employee_id 
full join roles on roles.id =roles_employee.role_id 
where role_name ilike '%middle%' and employees.employee_name notnull;
 
--14. Вывести имена и зарплаты Senior специалистов

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%senior%';

--15. Вывести зарплаты Java разработчиков
select salary.monthly_salary
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%java devel%';

--16. Вывести зарплаты Python разработчиков

select salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%python devel%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%jun%python devel%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%mid%javascr%devel%' or role_name ilike'%mid%js%devel%' ;

--19. Вывести имена и зарплаты Senior Java разработчиков

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%senior%java devel%';

--20. Вывести зарплаты Junior QA инженеров

select salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%jun%qa%eng%';

--21. Вывести среднюю зарплату всех Junior специалистов
select AVG(salary.monthly_salary) 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary) 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%js%devel%' or role_name ilike '%javascr%devel%';

--23. Вывести минимальную ЗП QA инженеров

select min(salary.monthly_salary) 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%qa%eng%';

--24. Вывести максимальную ЗП QA инженеров

select max(salary.monthly_salary) 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where role_name ilike '%qa%eng%';

--25. Вывести количество QA инженеров

select count(employees.employee_name) 
from employees full join employee_salary on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id 
full join roles_employee on employees.id =roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id 
where role_name ilike '%qa%eng%';

--26. Вывести количество Middle специалистов.

select count(employees.employee_name) 
from employees full join employee_salary on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id 
full join roles_employee on employees.id =roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id 
where role_name ilike '%middle%';

-- 27. Вывести количество разработчиков
select count(employees.employee_name) 
from employees full join employee_salary on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id 
full join roles_employee on employees.id =roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id 
where role_name ilike '%develop%';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(salary.monthly_salary) 
from employees full join employee_salary on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id 
full join roles_employee on employees.id =roles_employee.employee_id 
full join roles on roles.id = roles_employee.role_id 
where role_name ilike '%devel%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
order by salary.monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where salary.monthly_salary < 2300
order by salary.monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on salary.id = employee_salary.salary_id 
inner join roles_employee on employees.id =roles_employee.employee_id 
inner join roles on roles.id = roles_employee.role_id 
where salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary;