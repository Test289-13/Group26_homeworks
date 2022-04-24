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
 WHERE employee_id IS NULL
   AND monthly_salary < 2000;

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
SELECT employee_name, role_name
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%Automation QA engineer';

-- 12. Вывести имена и зарплаты Junior специалистов
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE 'Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE 'Middle%';
 
-- 14. Вывести имена и зарплаты Senior специалистов
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id

       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id

       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE 'Senior%';

-- 15. Вывести зарплаты Java разработчиков
SELECT role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id

       FULL JOIN roles
       ON roles_employee.role_id = roles.id

       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id

       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%Java developer';

-- 16. Вывести зарплаты Python разработчиков
SELECT role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id

       FULL JOIN roles
       ON roles_employee.role_id = roles.id

       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id

       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%Python developer';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employee_name, monthly_salary
  FROM employees
       LEFT JOIN roles_employee
       ON employees.id = roles_employee.employee_id

       FULL JOIN roles
       ON roles_employee.role_id = roles.id

       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id

       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%Junior Python developer%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employee_name, monthly_salary
  FROM employees
       LEFT JOIN roles_employee
       ON employees.id = roles_employee.employee_id

       INNER JOIN roles
       ON roles_employee.role_id = roles.id

       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%Middle JavaScript developer';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employee_name, monthly_salary
  FROM employees
       INNER JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       FULL JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%Senior Java developer';

-- 20. Вывести зарплаты Junior QA инженеров
SELECT role_name, monthly_salary
  FROM employees
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
       
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%Junior% %QA%';
 
-- 21. Вывести среднюю зарплату всех Junior специалистов
SELECT role_name, AVG(monthly_salary)
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%Junior%'
 GROUP BY role_name;

-- 22. Вывести сумму зарплат JS разработчиков
SELECT role_name, SUM(monthly_salary)
  FROM employees
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.employee_id = salary.id
       
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%JavaScript developer%'
 GROUP BY role_name;
 
-- 23. Вывести минимальную ЗП QA инженеров
SELECT MIN(monthly_salary) AS "min of QAeng salary"
  FROM employees
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
       
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%QA engineer%';

-- 24. Вывести максимальную ЗП QA инженеров
SELECT MAX(monthly_salary) AS "max of QAeng salary"
  FROM employees
       FULL JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       FULL JOIN salary
       ON employee_salary.salary_id = salary.id
       
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%QA engineer%';

-- 25. Вывести количество QA инженеров
SELECT role_name, COUNT(role_name)
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%QA engineer%'
 GROUP BY role_name;

-- 26. Вывести количество Middle специалистов.
SELECT role_name, COUNT(role_name)
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%Middle%'
 GROUP BY role_name;

-- 27. Вывести количество разработчиков
SELECT role_name, COUNT(role_name)
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
 WHERE role_name LIKE '%developer%'
 GROUP BY role_name;

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT SUM(monthly_salary) AS "dev's payroll"
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.role_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE role_name LIKE '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 ORDER BY monthly_salary ASC;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE monthly_salary BETWEEN 1700 AND 2300
 ORDER BY monthly_salary ASC;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE monthly_salary < 2300
 ORDER BY monthly_salary ASC;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT employee_name, role_name, monthly_salary
  FROM employees
       FULL JOIN roles_employee
       ON employees.id = roles_employee.employee_id
       
       INNER JOIN roles
       ON roles_employee.role_id = roles.id
       
       LEFT JOIN employee_salary
       ON employees.id = employee_salary.employee_id
       
       LEFT JOIN salary
       ON employee_salary.salary_id = salary.id
 WHERE monthly_salary IN (1100, 1500, 2000)
 ORDER BY monthly_salary ASC;
