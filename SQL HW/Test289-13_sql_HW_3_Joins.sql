-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary from salary
full join employee_salary on salary.id = employee_salary.salary_id
left join employees	on  employees.id = employee_salary.employee_id 
where employee_id is null;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary from salary
full join employee_salary on salary.id = employee_salary.salary_id
left join employees	on  employees.id = employee_salary.employee_id
where employee_id is null and monthly_salary < 2000;
-- 5. Найти всех работников кому не начислена ЗП.
select employee_name from employees
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where monthly_salary is null
order by employee_name asc;
-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id;
-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer%';
-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer%';
-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer';
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Manual QA engineer';
-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Automation QA engineer';
-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Junior%';
-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Middle%';
-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Senior%';
-- 15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary from employees
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Java developer';
-- 16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary from employees
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Python developer';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary from employees
left join roles_employee re on employees.id = re.employee_id
full join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
full join salary on es.salary_id = salary.id
where role_name like '%Junior Python developer%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary from employees
left join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%Middle JavaScript developer';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary from employees e
inner join roles_employee re on e.id = re.employee_id
full join roles r on re.role_id = r.id
left join employee_salary es on e.id = es.employee_id
left join salary s on es.salary_id = s.id
where role_name like '%Senior Java developer';
-- 20. Вывести зарплаты Junior QA инженеров
select role_name, monthly_salary from employees e
full join employee_salary es on e.id = es.employee_id
full join salary s on es.salary_id = s.id
full join roles_employee re on e.id = re.employee_id
inner join roles r on re.role_id = r.id
where role_name like '%Junior% %QA%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select role_name, AVG(monthly_salary) from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%Junior%'
group by role_name;
-- 22. Вывести сумму зарплат JS разработчиков
select role_name, sum(monthly_salary) from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.employee_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%JavaScript developer%'
group by role_name;
-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) as "min of QAeng salary" from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.salary_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) as "max of QAeng salary" from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.salary_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%';
-- 25. Вывести количество QA инженеров
select role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%'
group by role_name;
-- 26. Вывести количество Middle специалистов.
select role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Middle%'
group by role_name;
-- 27. Вывести количество разработчиков
select role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%developer%'
group by role_name;
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as "dev's payroll" from employees e
full join roles_employee re on e.id = re.role_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
order by monthly_salary asc;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary asc;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;