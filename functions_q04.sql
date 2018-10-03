/* 
4. 
Crie uma função de nome CategoryTopIncrease que recebe como parâmetro um numero
de mês e um numero de ano e apresenta dados de vendas da categoria de produtos 
que teve maior aumento de venda na comparação do mesm informado com o mesmo mês
do ano anterior. A função deve apresentar as seguintes informações sobre a 
categoria: Identificador da Categoria (ProductCategoryID), Nome da Categoria 
(ProductCategory), Mês, Ano, Quantidade Total Vendida (ano anterior), Valor 
Total Vendido (ano anterior), Quantidade Total Vendida (mês informado), Valor 
Total Vendido (mês informado), percentual de aumento de vendas (em relação ao
valor total vendido).  
*/

CREATE FUNCTION CategoryTopIncrease (@year int, @month int)
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        current_category.ProductCategoryID,
        current_category.Name,
        current_category.ModifiedDate,
        previous_category.[total (ano aterior)],
        previous_category.[preço médio (ano aterior)],
        current_category.[total (atual)],
        current_category.[preço médio (atual)],
        CONCAT(100 * current_category.[total (atual)] / previous_category.[total (ano aterior)], ' ', '%') AS [percentual de aumento de vendas]
    FROM
    (
        SELECT pc.ProductCategoryID, pc.Name, sod.ModifiedDate, COUNT(sod.ProductID) as [total (ano aterior)], AVG(sod.UnitPrice) AS [preço médio (ano aterior)]
        FROM AdventureWorks2014.Production.ProductCategory AS pc
        JOIN AdventureWorks2014.Production.ProductSubcategory AS psc ON pc.ProductCategoryID = psc.ProductCategoryID
        JOIN AdventureWorks2014.Production.Product AS p ON psc.ProductSubcategoryID = p.ProductSubcategoryID
        JOIN AdventureWorks2014.Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
        WHERE (sod.ModifiedDate BETWEEN DATEADD(YEAR, -1, DATEFROMPARTS(@year, @month, 01))  AND DATEADD(YEAR, -1, DATEADD(day, -1, DATEADD(month, 1, DATEFROMPARTS(@year, @month, 01)))))
        GROUP BY pc.name, pc.ProductCategoryID, sod.ModifiedDate
    ) AS previous_category
    FULL OUTER JOIN 
    (
        SELECT pc.ProductCategoryID, pc.Name, sod.ModifiedDate, COUNT(sod.ProductID) as [total (atual)], AVG(sod.UnitPrice) AS [preço médio (atual)]
        FROM AdventureWorks2014.Production.ProductCategory AS pc
        JOIN AdventureWorks2014.Production.ProductSubcategory AS psc ON pc.ProductCategoryID = psc.ProductCategoryID
        JOIN AdventureWorks2014.Production.Product AS p ON psc.ProductSubcategoryID = p.ProductSubcategoryID
        JOIN AdventureWorks2014.Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
        WHERE (sod.ModifiedDate BETWEEN DATEFROMPARTS(@year, @month, 01) AND DATEADD(day, -1, DATEADD(month, 1, DATEFROMPARTS(@year, @month, 01)))) 
        GROUP BY pc.name, pc.ProductCategoryID, sod.ModifiedDate
    ) AS current_category
    ON previous_category.ProductCategoryID = current_category.ProductCategoryID
);
GO

SELECT * FROM CategoryTopIncrease(2013, 7)
GO

DROP FUNCTION CategoryTopIncrease;