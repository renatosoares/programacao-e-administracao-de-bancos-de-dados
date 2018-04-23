/*
1.
Crie um cursor que apresente na tela de mensagens uma lista com o nome
dos departamentos da loja (tabela HumanResources.Department) seguido
da quantidade de funcionários que estão locados no departamento
(obtido a partir da tabela HumanResources. EmployeeDepartmentHistory).
Apenas os departamentos que tenham funcionários devem ser
apresentados.
*/
--SET NOCOUNT ON;

DECLARE @name_dep varchar(50);
DECLARE @qty_emp varchar(5);

DECLARE cursor_dep CURSOR FOR
SELECT dep.Name, COUNT(emp.DepartmentID) AS qtyEmp FROM [AdventureWorks2014].[HumanResources].[EmployeeDepartmentHistory] AS emp 
INNER JOIN [AdventureWorks2014].[HumanResources].[Department] AS dep ON emp.DepartmentID = dep.DepartmentID
WHERE emp.EndDate IS NULL
GROUP BY dep.Name;

OPEN cursor_dep 
FETCH NEXT FROM cursor_dep
INTO @name_dep, @qty_emp

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @name_dep + ' => ' + @qty_emp

		FETCH NEXT FROM cursor_dep
		INTO @name_dep, @qty_emp
	END 
CLOSE cursor_dep;
DEALLOCATE cursor_dep;