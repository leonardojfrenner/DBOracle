-- Calcula a média e a soma dos salários de todos os funcionários
SELECT  AVG(salary), SUM(salary)
FROM    employees;

-- Obtém a data de contratação mais antiga (primeiro funcionário contratado) e a mais recente
SELECT  MIN(hire_date), MAX(hire_date)
FROM    employees;

-- Obtém o menor e o maior salário registrado na tabela employees
SELECT  MIN(salary), MAX(salary)
FROM    employees;

-- Conta o número total de funcionários na tabela
SELECT  COUNT(*)
FROM    employees;

-- Conta quantos funcionários possuem um percentual de comissão (exclui valores nulos)
SELECT  COUNT(commission_pct)
FROM    employees;

-- Conta quantos departamentos distintos existem na tabela employees
SELECT  COUNT(DISTINCT department_id)
FROM employees;

-- Conta o número total de registros que possuem um department_id (não exclui valores duplicados)
SELECT  COUNT(department_id)
FROM    employees;

-- Calcula a média do percentual de comissão (desconsiderando valores nulos)
SELECT  AVG(commission_pct)
FROM    employees;

-- Calcula a média do percentual de comissão, substituindo valores nulos por 0
SELECT  AVG(NVL(commission_pct,0))
FROM    employees;

-- Calcula a média salarial por departamento e ordena pelo ID do departamento
SELECT  department_id, AVG(salary)
FROM    employees
GROUP BY department_id
ORDER BY department_id;

-- Calcula o total dos salários agrupados por ID do departamento e cargo, ordenando pelos mesmos critérios
SELECT  department_id, job_id, SUM(salary)
FROM    employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Obtém o maior salário por departamento, mas apenas para aqueles com salários superiores a 10.000
SELECT  department_id, MAX(salary)
FROM    employees
GROUP BY department_id
HAVING MAX(salary) > 10000
ORDER BY department_id;

-- Soma os salários por cargo, excluindo a função 'SA_REP', e exibe apenas os cargos com total acima de 10.000
SELECT  job_id, SUM(salary) TOTAL
FROM    employees
WHERE   job_id <> 'SA_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary);

-- Obtém a maior média salarial entre os departamentos
SELECT  MAX(AVG(salary))
FROM    employees
GROUP  BY department_id;
