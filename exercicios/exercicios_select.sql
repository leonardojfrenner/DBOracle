/*Aqui estão algumas atividades para você praticar SQL com o schema do usuário HR:

🎯 Consulta de Dados (SELECT)
Listar funcionários e seus cargos:

Exiba first_name, last_name e job_title de todos os funcionários.

Salários acima da média:

Liste os funcionários cujo salary seja maior que a média dos salários da empresa.

--Funcionários por departamento:

Mostre o nome dos departamentos e a quantidade de funcionários em cada um deles.

Detalhes do funcionário com maior salário:

Exiba todas as informações do funcionário com o maior salário.

Localização dos departamentos:

Liste os departamentos, a cidade e o país em que estão localizados.
*/


SELECT  first_name "Nome", last_name "Sobrenome", job_id "Cargo" 
FROM    employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT department_name, COUNT(employee_id)  
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;

SELECT *
FROM    employees
WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT department_name, city, country_name
FROM departments d JOIN locations l ON(d.location_id = l.location_id)
                    JOIN countries c ON (l.country_id = c.country_id)
ORDER BY d.department_id;
