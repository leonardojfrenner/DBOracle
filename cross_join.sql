-- Gerando um Produto Cartesiano utilizando Cross Join

SELECT last_name, department_name
FROM   employees
  CROSS JOIN departments;