CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  -- Deklarujemy zmienną M, ponieważ OFFSET potrzebuje wartości N-1
  -- (np. dla 2. najwyższej pensji musimy pominąć 1 rekord)
  DECLARE M INT;
  SET M = N - 1;

  RETURN (
      SELECT DISTINCT salary
      FROM Employee
      ORDER BY salary DESC
      LIMIT 1 OFFSET M
  );
END