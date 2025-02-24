-- Exibe o sobrenome e a data de admissão formatada com dia, mês, ano, hora, minuto e segundo
SELECT  last_name Sobrenome, TO_CHAR(hire_date, 'DD/MM/YY HH24:MI:SS') DT_ADMISSÃO
FROM    employees;

-- Exibe a data e hora atual do sistema, formatada no padrão dia/mês/ano e hora:minuto:segundo
SELECT  sysdate, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM    dual;

-- Exibe o sobrenome e a data de admissão formatada com o nome do mês por extenso
SELECT  last_name Sobrenom, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM    employees;

-- Similar ao anterior, mas o formato "FM" remove zeros à esquerda
SELECT  last_name Sobrenom, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM    employees;

-- Exibe o nome, sobrenome e salário formatado com símbolo monetário, separador de milhar e decimal
SELECT  first_name Nome, last_name Sobrenome, TO_CHAR(salary, 'L99G999G999D99') SALARIO
FROM    employees;

-- Converte uma string numérica para o tipo NUMBER
SELECT  TO_NUMBER('12000,50') VALUE
FROM    dual;

-- Converte uma string para o tipo DATE no formato dia/mês/ano
SELECT  TO_DATE('06/02/2025','DD/MM/YYYY') DATA
FROM    dual;

-- Exibe o nome completo e data de admissão dos funcionários contratados em 17/06/2003
SELECT   first_name || ' ' || last_name || ' ' || hire_date FuncionariO
FROM    employees
WHERE   hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Concatena o primeiro nome com a data de admissão formatada
SELECT CONCAT(first_name, TO_CHAR(hire_date, ' DD/MM/YYYY')) Funcionario
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

-- Calcula o tempo de trabalho em meses dos funcionários contratados em 17/06/2003
SELECT  first_name, last_name, ROUND(MONTHS_BETWEEN(sysdate,hire_date),0) MESES
FROM    employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

-- Exibe o salário anual e a remuneração total, incluindo comissão (caso exista)
SELECT  last_name, salary, NVL(commission_pct,0), salary * 12 Salario_anual,
        (salary*12) + (salary * 12 * NVL(commission_pct,0)) Remuneracao_anual
FROM    employees;

-- Exibe o ID, comissão e gerente. Caso não tenha comissão nem gerente, exibe mensagem padrão
SELECT  last_name, employee_id, commission_pct, manager_id,
        COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id),'Sem percentual de comissão e sem gerente')
FROM    employees;

-- Exibe o salário e aplica um percentual de alteração apenas se houver comissão cadastrada
SELECT last_name, salary, commission_pct,
        NVL2(commission_pct,10,0) PERCENTUAL_ALTERADO
FROM    employees;

-- Aplica um aumento de salário baseado no cargo usando CASE WHEN
SELECT  last_name, job_id, salary,
                          CASE job_id
                             WHEN 'IT_PROG'   
                               THEN 1.10*salary
                             WHEN 'ST_CLERK' 
                               THEN 1.15*salary
                             WHEN 'SA_REP' 
                               THEN 1.20*salary
                             ELSE salary 
                           END "NOVO SALARIO"
FROM    employees;

-- Mesma lógica anterior, mas utilizando a função DECODE para simplificar
SELECT  last_name, job_id, salary,
DECODE  (job_id, 'IT_PROG' , 1.10*salary,
                 'ST_CLERK', 1.15*salary,
                 'SA_REP'  , 1.20*salary
                         , salary) "NOVO SALARIO"
FROM    employees;
