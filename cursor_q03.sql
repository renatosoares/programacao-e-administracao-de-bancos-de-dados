/*
3.
Crie uma função de nome SalesMonthTop5 que recebe como parâmetro um numero de
mês e ano e apresente como resultado uma lista totalizada com os 5 produtos
mais vendidos (considerando a quantidade de itens vendidos) para o mês
informado. A lista de apresentar as seguintes informações sobre os produtos:
Identificador, Nome do Produto, Mês, Ano, Quantidade Total Vendida, Preço
Unitário Médio, Desconto Total Concedido e Valor Total Vendido.
*/
USE AdventureWorks2014;
GO

CREATE FUNCTION SalesMonthTop5 (@year int, @month int)
RETURNS TABLE
AS
RETURN
(
SELECT
    order_detail.[SalesOrderDetailID],
    order_detail.[ModifiedDate],
    order_detail.OrderQty,
    order_detail.UnitPrice,
    order_detail.UnitPriceDiscount,
    order_detail.LineTotal
    FROM [AdventureWorks2014].[Sales].[SalesOrderDetail] AS order_detail
    WHERE ModifiedDate BETWEEN DATEFROMPARTS(@year, @month, 01) AND DATEADD(day, -1, DATEADD(month, 1, DATEFROMPARTS(@year, @month, 01)))
);
GO

DECLARE sales_top_five CURSOR
    LOCAL
    FAST_FORWARD​
    FOR SELECT * FROM SalesMonthTop5(2012, 7) as slm
    ORDER by slm.OrderQty DESC
DECLARE @count INT
DECLARE @id int
DECLARE @date smallDatetime
DECLARE @order int
DECLARE @unitPrice FLOAT
DECLARE @unitPriceDiscount FLOAT
DECLARE @lineTotal FLOAT
OPEN sales_top_five
SET @count = 1
WHILE @count <= 5
BEGIN

    FETCH NEXT FROM sales_top_five INTO @id, @date, @order, @unitPrice, @unitPriceDiscount, @lineTotal

    PRINT @id
    PRINT @date
    PRINT @order
    PRINT @UnitPrice
    PRINT @unitPriceDiscount
    PRINT @lineTotal

    SET @count = @count + 1
END
CLOSE sales_top_five;
DEALLOCATE sales_top_five;

SELECT * FROM SalesMonthTop5(2012, 7)

DROP FUNCTION SalesMonthTop5;
GO
