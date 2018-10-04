/*
4.
Crie uma função de nome SalesTop5 que recebe como parâmetro uma data inicial e
uma data final de um período e apresente como resultado uma lista totalizada
com os 5 produtos mais vendidos (considerando a quantidade de itens vendidos)
para cada mês do período. A lista de apresentar as seguintes informações sobre
os produtos: Identificador, Nome do Produto, Mês, Ano, Posição (1 a 5),
Quantidade Total Vendida, Preço Unitário Médio, Desconto Total Concedido e
Valor Total Vendido. O campo posição representa a ordenação do ranking do
produto dentro de cada mês.
*/
USE AdventureWorks2014;
GO

CREATE FUNCTION SalesTop5 (@beginYear int, @beginMonth int, @beginDay int, @endYear int, @endMonth int, @endDay int)
RETURNS TABLE
AS
RETURN
(
SELECT TOP 10
    order_detail.[SalesOrderDetailID],
    order_detail.[ModifiedDate],
    order_detail.OrderQty,
    order_detail.UnitPrice,
    order_detail.UnitPriceDiscount,
    order_detail.LineTotal
    FROM [AdventureWorks2014].[Sales].[SalesOrderDetail] AS order_detail
    WHERE ModifiedDate BETWEEN DATEFROMPARTS(@beginYear, @beginMonth, @beginDay) AND DATEFROMPARTS(@endYear, @endMonth, @endDay)
    ORDER BY order_detail.OrderQty DESC
);
GO

DECLARE sales_top CURSOR
    LOCAL
    FAST_FORWARD​
    FOR SELECT * FROM SalesTop5(2012, 7, 1, 2012, 7, 29)
DECLARE @count INT
DECLARE @id int
DECLARE @date smallDatetime
DECLARE @order int
DECLARE @unitPrice FLOAT
DECLARE @unitPriceDiscount FLOAT
DECLARE @lineTotal FLOAT
OPEN sales_top
SET @count = 1
WHILE @count <= 5
BEGIN

    FETCH NEXT FROM sales_top INTO @id, @date, @order, @unitPrice, @unitPriceDiscount, @lineTotal

    PRINT @id
    PRINT @date
    PRINT @order
    PRINT @UnitPrice
    PRINT @unitPriceDiscount
    PRINT @lineTotal

    SET @count = @count + 1
END
CLOSE sales_top;
DEALLOCATE sales_top;

SELECT * FROM SalesTop5(2012, 7, 1, 2012, 7, 29)

DROP FUNCTION SalesTop5;
GO
