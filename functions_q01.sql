/*
1.
Crie uma função de nome SalesMonth que recebe como parâmetro um numero
de mês e um numero de ano e apresenta uma lista totalizada com os
produtos vendidos no mês e ano passados como parâmetro. A lista deve
apresentar as seguintes informações sobre os produtos: Identificador,
Mês, Ano, Quantidade Total Vendida, Preço Unitário Médio, Desconto
Total Concedido e Valor Total Vendido.
*/

CREATE FUNCTION SalesMonth (@date smallDatetime)
RETURNS TABLE
AS
RETURN 
(
SELECT SalesOrderID, ModifiedDate, OrderQty, UnitPrice, UnitPriceDiscount, LineTotal FROM [AdventureWorks2014].[Sales].[SalesOrderDetail]
WHERE ModifiedDate = @date
);
GO

SELECT * FROM SalesMonth('2012-07-01')
GO

DROP FUNCTION SalesMonth;