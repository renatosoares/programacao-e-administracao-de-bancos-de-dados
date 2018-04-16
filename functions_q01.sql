/*
1.
Crie uma fun��o de nome SalesMonth que recebe como par�metro um numero
de m�s e um numero de ano e apresenta uma lista totalizada com os
produtos vendidos no m�s e ano passados como par�metro. A lista deve
apresentar as seguintes informa��es sobre os produtos: Identificador,
M�s, Ano, Quantidade Total Vendida, Pre�o Unit�rio M�dio, Desconto
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