/*
3.
Crie uma função de nome CategorySalesMonth que recebe como parâmetro um numero 
de mês e um numero de ano e apresenta uma lista com os totais vendidos por 
categoria de produto no mês e ano passados como parâmetro. A lista de 
apresentar as seguintes informações sobre as categorias: Identificador da 
Categoria (ProductCategoryID), Nome da Categoria (ProductCategory), Mês, Ano, 
Quantidade de Itens Vendidos, Preço Unitário Médio do Item, Valor Total Vendido. 
*/

CREATE FUNCTION CategorySalesMonth (@year int, @month int)
RETURNS TABLE
AS
RETURN 
(
    SELECT pc.Name, pc.ProductCategoryID, sod.ModifiedDate, AVG(sod.UnitPrice) AS [preço médio], COUNT(sod.ProductID) as total  FROM AdventureWorks2014.Production.ProductCategory AS pc
    JOIN AdventureWorks2014.Production.ProductSubcategory AS psc ON pc.ProductCategoryID = psc.ProductCategoryID
    JOIN AdventureWorks2014.Production.Product AS p ON psc.ProductSubcategoryID = p.ProductSubcategoryID
    JOIN AdventureWorks2014.Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
    GROUP BY pc.name, pc.ProductCategoryID, sod.ModifiedDate
    HAVING sod.ModifiedDate BETWEEN DATEFROMPARTS(@year, @month, 01) AND DATEADD(day, -1, DATEADD(month, 1, DATEFROMPARTS(@year, @month, 01)))
);
GO

SELECT * FROM CategorySalesMonth(2013, 7)
GO

DROP FUNCTION CategorySalesMonth;