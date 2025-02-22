-- Seleciona o ID, sobrenome e ID do departamento do funcionário cujo sobrenome é 'KING'
SELECT  employee_id, last_name, department_id
FROM    employees
WHERE   last_name = 'KING';

-- Faz a busca ignorando diferenças entre maiúsculas e minúsculas
SELECT  employee_id, last_name, department_id
FROM    employees
WHERE  UPPER(last_name) = 'KING';

-- Exemplos de funções de manipulação de strings
SELECT CONCAT('Curso ','Introdução ORACLE 19c'),  -- Concatena duas strings
        SUBSTR('Introdução Oracle 19c',1,11),    -- Retorna uma substring (11 primeiros caracteres)
        LENGTH('Introdução ORACLE 19c'),         -- Retorna o número de caracteres da string
        INSTR('Introdução ORACLE 19c','ORACLE')  -- Retorna a posição inicial da substring 'ORACLE'
FROM    dual;

-- Alinhamento de texto utilizando LPAD e RPAD
SELECT  first_name "Nome",
        LPAD(first_name,20, ' ') "Nome alinhado a direita",  -- Preenche com espaços à esquerda até 20 caracteres
        RPAD(first_name,20, ' ') "Nome alinhado a esquerda"  -- Preenche com espaços à direita até 20 caracteres
FROM    employees;

-- Substitui 'President' por 'Presidente' no título do cargo
SELECT  job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM    jobs
WHERE   job_title = 'President';

-- Arredondamento de valores numéricos
SELECT ROUND(45.923,2),  -- Arredonda para duas casas decimais
       ROUND(45.923,0)   -- Arredonda para o inteiro mais próximo
FROM   dual;

-- Trunca valores numéricos sem arredondamento
SELECT TRUNC(45.923,2),  -- Mantém apenas duas casas decimais
       TRUNC(45.923,0)   -- Remove todas as casas decimais sem arredondamento
FROM   dual;

-- Retorna o resto da divisão de 1300 por 600
SELECT MOD(1300,600) RESTO
FROM    dual;

-- Retorna o valor absoluto e a raiz quadrada
SELECT ABS(-9),   -- Retorna o valor absoluto de -9
       SQRT(9)    -- Retorna a raiz quadrada de 9
FROM    dual;

-- Retorna a data e hora atuais do sistema
SELECT sysdate
FROM    dual;

-- Manipulação de datas com adição e subtração de dias
SELECT sysdate,        -- Data atual
       sysdate +30,    -- Data daqui a 30 dias
       sysdate+ 60,    -- Data daqui a 60 dias
       sysdate - 30    -- Data de 30 dias atrás
FROM    dual;

-- Calcula o tempo de trabalho em semanas a partir da data de admissão
SELECT  last_name, ROUND((SYSDATE - hire_date)/7,2) "SEMANAS DE TRABALHO"
FROM    employees;

-- Calcula o tempo de trabalho em meses a partir da data de admissão
SELECT  first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),2) "MESES DE TRABALHO"
FROM    employees;

-- Funções de data avançadas
SELECT  sysdate,                       
        ADD_MONTHS(sysdate,3),         
        NEXT_DAY(sysdate, 'Sexta-Feira'), 
        LAST_DAY(sysdate)                
FROM    dual;

SELECT  sysdate, TO_CHAR(TRUNC(sysdate),'DD/MM/YYYY HH24:MI:SS')
FROM    dual;
