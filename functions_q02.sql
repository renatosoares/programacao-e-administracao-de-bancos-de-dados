/*
2.
Crie uma função de nome SalesMonthIncrease que recebe como parâmetro
um numero de mês e um numero de ano e apresenta uma lista com os
produtos que obtiveram aumento de vendas (considere aqui o aumento em
relação ao valor total vendido) do mês solicitado em relação ao mês
anterior. A lista de apresentar as seguintes informações sobre os
produtos: Identificador, Mês (atual), Ano (atual), Quantidade Total
Vendida (mês anterior), Valor Total Vendido (mês anterior), Quantidade
Total Vendida (mês informado), Valor Total Vendido (mês informado),
percentual de aumento de vendas (em relação ao valor total vendido).
*/

CREATE FUNCTION SalesMonthIncrease (@y int, @m int)
RETURNS TABLE

AS 
	RETURN 
	(
		SELECT s_detail.ProductID,  MAX(ModifiedDate) as current_month, SUM(s_detail.orderQty) AS orderQtySum, SUM(s_detail.lineTotal) AS lineTotalSum FROM [AdventureWorks2014].[Sales].[SalesOrderDetail] AS s_detail
		WHERE s_detail.ModifiedDate BETWEEN CONVERT(smalldatetime, CONCAT(CAST(@y AS varchar), RIGHT('0' + CAST((@m - 1)AS VARCHAR(2)), 2), '01')) AND CONVERT(datetime, CONCAT(CAST(@y AS varchar), RIGHT('0' + CAST(@m AS VARCHAR(2)), 2), '01'))
		GROUP BY s_detail.ProductID
	);
GO
 
SELECT * FROM SalesMonthIncrease(2011, 06)
GO

DROP FUNCTION SalesMonthIncrease;
