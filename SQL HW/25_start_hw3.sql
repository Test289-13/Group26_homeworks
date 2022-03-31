-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id;
-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < '2000';
-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary from salary
full join employee_salary on salary.id = employee_salary.salary_id
left join employees	on  employees.id = employee_salary.employee_id 
where employee_id is null;
-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary from salary
full join employee_salary on salary.id = employee_salary.salary_id
left join employees	on  employees.id = employee_salary.employee_id
where employee_id is null and monthly_salary < '2000';
-- 5. ����� ���� ���������� ���� �� ��������� ��.
select employee_name from employees
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where monthly_salary is null
order by employee_name asc;
-- 6. ������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id;
-- 7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer%';
-- 8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer%';
-- 9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name from employees
full join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer';
-- 10. ������� ����� � ��������� ������ QA ���������.
select employee_name, role_name from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Manual QA engineer';
-- 11. ������� ����� � ��������� ��������������� QA
select employee_name, role_name from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Automation QA engineer';
-- 12. ������� ����� � �������� Junior ������������
select employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Junior%';
-- 13. ������� ����� � �������� Middle ������������
select employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Middle%';
-- 14. ������� ����� � �������� Senior ������������
select employee_name, role_name, monthly_salary from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on employee_salary.salary_id = salary.id
where role_name like 'Senior%';
-- 15. ������� �������� Java �������������
select role_name, monthly_salary from employees
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Java developer';
-- 16. ������� �������� Python �������������
select role_name, monthly_salary from employees
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id
left join salary on employee_salary.salary_id = salary.id
where role_name like '%Python developer';
-- 17. ������� ����� � �������� Junior Python �������������
select employee_name, monthly_salary from employees
left join roles_employee re on employees.id = re.employee_id
full join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
full join salary on es.salary_id = salary.id
where role_name like '%Junior Python developer%';
-- 18. ������� ����� � �������� Middle JS �������������
select employee_name, monthly_salary from employees
left join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%Middle JavaScript developer';
-- 19. ������� ����� � �������� Senior Java �������������
select employee_name, monthly_salary from employees e
inner join roles_employee re on e.id = re.employee_id
full join roles r on re.role_id = r.id
left join employee_salary es on e.id = es.employee_id
left join salary s on es.salary_id = s.id
where role_name like '%Senior Java developer';
-- 20. ������� �������� Junior QA ���������
select role_name, monthly_salary from employees e
full join employee_salary es on e.id = es.employee_id
full join salary s on es.salary_id = s.id
full join roles_employee re on e.id = re.employee_id
inner join roles r on re.role_id = r.id
where role_name like '%Junior% %QA%';
-- 21. ������� ������� �������� ���� Junior ������������
select role_name, AVG(monthly_salary) from employees
full join roles_employee re on employees.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on employees.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%Junior%'
group by role_name;
-- 22. ������� ����� ������� JS �������������
select role_name, sum(monthly_salary) from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.employee_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%JavaScript developer%'
group by role_name;
-- 23. ������� ����������� �� QA ���������
select min(monthly_salary) as "min of QAeng salary" from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.salary_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%';
-- 24. ������� ������������ �� QA ���������
select max(monthly_salary) as "max of QAeng salary" from employees e
full join employee_salary es on e.id = es.employee_id
full join salary on es.salary_id = salary.id
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%';
-- 25. ������� ���������� QA ���������
select role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%QA engineer%'
group by role_name;
-- 26. ������� ���������� Middle ������������.
select role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%Middle%'
group by role_name;
-- 27. ������� ���������� �������������
select role_name, count(role_name) from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
where role_name like '%developer%'
group by role_name;
-- 28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary) as "dev's payroll" from employees e
full join roles_employee re on e.id = re.role_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where role_name like '%developer%';
-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
order by monthly_salary asc;
-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;
-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary asc;
-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees e
full join roles_employee re on e.id = re.employee_id
inner join roles on re.role_id = roles.id
left join employee_salary es on e.id = es.employee_id
left join salary on es.salary_id = salary.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;