-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employee_name, monthly_salary
  FROM employees
       INNER JOIN employee_salary
       ON employees.id = employee_salary.employee_id

       INNER JOIN salary
       ON employee_salary.salary_id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employee_name, monthly_salary
  FROM employees
       INNER JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       INNER JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT monthly_salary
  FROM salary
       FULL JOIN employee_salary
       ON salary.id = employee_salary.salary_id

       LEFT JOIN employees
       ON employees.id = employee_salary.employee_id
 WHERE employee_id IS NULL;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT monthly_salary
  FROM salary
       FULL JOIN employee_salary
       ON salary.id = employee_salary.salary_id
       
       LEFT JOIN employees
       ON employees.id = employee_salary.employee_id
 WHERE employee_id IS NULL AND monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
SELECT employee_name
  FROM employees
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE monthly_salary IS NULL
 ORDER BY employee_name ASC;

-- 6. Вывести всех работников с названиями их должности.
SELECT employee_name, role_name
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
SELECT employee_name, role_name
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%Java developer%';

-- 8. Вывести имена и должность только Python разработчиков.
SELECT employee_name, role_name
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id

       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%Python developer%';

-- 9. Вывести имена и должность всех QA инженеров.
SELECT employee_name, role_name
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%QA engineer';

-- 10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name, role_name
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%Manual QA engineer';

-- 11. Вывести имена и должность автоматизаторов QA
SELECT employee_name, role_name from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Automation QA engineer';
-- 12. Вывести имена и зарплаты Junior специалистов
SELECT employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Junior%';
-- 13. Вывести имена и зарплаты Middle специалистов
SELECT employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Middle%';
-- 14. Вывести имена и зарплаты Senior специалистов
SELECT employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Senior%';
-- 15. Вывести зарплаты Java разработчиков
SELECT role_name, monthly_salary from employees
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Java developer';
-- 16. Вывести зарплаты Python разработчиков
SELECT role_name, monthly_salary from employees
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Python developer';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employee_name, monthly_salary from employees
left join roles_employee re on employees.id = re.employee_id
full join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
full join salary on es.salary_id = salary.id
where role_name like '%Junior Python developer%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employee_name, monthly_salary from employees
left join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%Middle JavaScript developer';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employee_name, monthly_salary from employees e
inner join roles_employee re on e.id = re.employee_id
full join roles r on re.role_id = r.id
left join employee_salary es on e.id = es.employee_id
left join salary s on es.salary_id = s.id
where role_name like '%Senior Java developer';
-- 20. Вывести зарплаты Junior QA инженеров
SELECT role_name, monthly_salary from employees e
full join employee_salary es on e.id = es.employee_id
full join salary s on es.salary_id = s.id
full join roles_employee re on e.id = re.employee_id
inner join roles r on re.role_id = r.id
where role_name like '%Junior% %QA%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
SELECT role_name, AVG(monthly_salary) from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%Junior%'
group by role_name;
-- 22. Вывести сумму зарплат JS разработчиков
SELECT role_name, sum(monthly_salary) from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.employee_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%JavaScript developer%'
group by role_name;
-- 23. Вывести минимальную ЗП QA инженеров
SELECT min(monthly_salary) as "min of QAeng salary" from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.salary_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%';
-- 24. Вывести максимальную ЗП QA инженеров
SELECT max(monthly_salary) as "max of QAeng salary" from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.salary_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%';
-- 25. Вывести количество QA инженеров
SELECT role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%'
group by role_name;
-- 26. Вывести количество Middle специалистов.
SELECT role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Middle%'
group by role_name;
-- 27. Вывести количество разработчиков
SELECT role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%developer%'
group by role_name;
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT sum(monthly_salary) as "dev's payroll" from employees e
full join roles_employee re on e.id = re.role_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
order by monthly_salary asc;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary asc;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;
