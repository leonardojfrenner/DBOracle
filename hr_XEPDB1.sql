-- Seleciona o primeiro nome, sobrenome, salário e um aumento de 15% no salário
SELECT  first_name, last_name, salary, salary * 1.15
FROM    employees;

-- Seleciona os mesmos campos, mas renomeia as colunas para um formato mais amigável
-- Adiciona um aumento fixo de 100 ao salário antes de aplicar o aumento de 15%
SELECT  first_name nome, last_name sobrenome, salary salario , (salary + 100) * 1.15 salario_com_aumento
FROM    employees;

-- Seleciona apenas os funcionários que possuem comissão, exibindo percentual de comissão
SELECT  first_name "Nome", last_name "Sobrenome", commission_pct "Percentual de Comissão"
FROM    employees 
WHERE   commission_pct IS NOT NULL;

-- Concatena o nome e sobrenome com a data de admissão em uma única string
SELECT  first_name || ' ' || last_name || ', Data de admissão: ' || hire_date "Funcionário"
FROM    employees;

-- Concatena o nome do departamento com o ID do gerente, usando q'[ ]' para evitar conflitos com apóstrofes
SELECT  department_name || q'[ Department's Manager Id: ]' || manager_id "Departamento e Gerente"
FROM    departments;

-- Seleciona os IDs de departamento únicos dos funcionários (sem repetições)
SELECT DISTINCT department_id 
FROM            employees;

-- Concatena ID do funcionário, sobrenome, cargo e ID do departamento
-- Filtra apenas funcionários cujo cargo seja 'IT_PROG'
SELECT  employee_id || ' '|| last_name || ' ' || job_id || ' '|| department_id "Funcionário"
FROM    employees
WHERE   job_id = 'IT_PROG';

-- Seleciona sobrenome e salário dos funcionários cujo salário seja maior ou igual a 10.000
SELECT  last_name, salary
FROM    employees 
WHERE   salary >= 10000;

-- Filtra funcionários cujo salário esteja entre 10.000 e 150.000
SELECT  last_name, salary
FROM    employees 
WHERE   salary BETWEEN 10000 AND 150000;

-- Seleciona informações de funcionários com determinados cargos específicos
SELECT  employee_id "Matrícula", last_name "Sobrenome", salary "Salário", manager_id "Gerente", job_id "Cargo"
FROM    employees 
WHERE   job_id IN ('IT_PROG','FI_ACCOUNT','SA_REP');

-- Filtra funcionários cujo primeiro nome começa com "Sa"
SELECT  first_name "Nome", last_name "Sobrenome", job_id "Cargo"
FROM    employees 
WHERE   first_name LIKE 'Sa%';

-- Filtra funcionários cujo sobrenome tenha a segunda letra como "a"
SELECT  first_name "Nome", last_name "Sobrenome"
FROM    employees
WHERE   last_name LIKE '_a%';

-- Filtra funcionários cujo sobrenome termina com "a"
SELECT  first_name "Nome", last_name "Sobrenome"
FROM    employees
WHERE   last_name LIKE '%a';

-- Filtra funcionários cujo salário seja maior ou igual a 5.000 e que tenham cargo 'IT_PROG'
SELECT  employee_id, last_name, job_id, salary
FROM    employees
WHERE   salary >= 5000 AND job_id = 'IT_PROG';

-- Seleciona funcionários que não possuem determinados cargos
SELECT  employee_id, last_name, salary, manager_id, job_id
FROM    employees
WHERE   job_id NOT IN ('IT_PROG','FI_ACCOUNT','SA_REP');

-- Filtra funcionários com cargos 'SA_REP' ou 'IT_PROG' e salário superior a 10.000
SELECT  last_name, job_id, salary
FROM    employees 
WHERE   (job_id = 'SA_REP'  OR
         job_id = 'IT_PROG')
AND     salary > 10000;

-- Ordena os funcionários pela data de admissão (crescente)
SELECT  last_name, job_id, department_id, hire_date
FROM    employees
ORDER BY hire_date;

-- Ordena os funcionários pela data de admissão (decrescente)
SELECT  last_name, job_id, department_id, hire_date
FROM    employees
ORDER BY hire_date DESC;

-- Calcula o salário anual e ordena pela coluna calculada
SELECT  employee_id, last_name, salary * 12 salario_anual
FROM    employees
ORDER BY salario_anual;

-- Ordena os funcionários pela quarta coluna (hire_date)
SELECT  last_name, job_id, department_id, hire_date
FROM    employees
ORDER BY 4;

-- Ordena por ID de departamento e salário (decrescente dentro de cada departamento)
SELECT  last_name, department_id, salary
FROM    employees
ORDER BY department_id, salary DESC;

-- Solicita que o usuário informe um ID de funcionário para realizar a consulta
SELECT  employee_id, last_name, salary, department_id
FROM    employees
WHERE employee_id = &employee_id;

-- Similar ao anterior, mas reutiliza a variável sem precisar digitá-la novamente
SELECT  employee_id, last_name, salary, department_id
FROM    employees
WHERE employee_id = &&employee_id;

-- Solicita um cargo como entrada e retorna os funcionários desse cargo com salário anual
SELECT  employee_id, last_name, salary * 12
FROM    employees
WHERE job_id = '&job_id';

-- Define uma variável employee_id com valor 101 e usa na consulta
DEFINE employee_id = 101
SELECT  employee_id, last_name, salary, department_id
FROM    employees
WHERE employee_id = &employee_id;

-- Define uma variável employee_id (sem valor inicial) e depois a remove
DEFINE employee_id
UNDEFINE employee_id;
