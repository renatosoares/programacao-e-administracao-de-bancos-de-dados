-- 5.	Crie um procedimento armazenado para apagar as lojas de livros que não realizaram vendas
CREATE PROCEDURE lojaNaoRealizaVenda
AS
DELETE stores FROM stores
LEFT JOIN sales
ON stores.stor_id = sales.stor_id
WHERE sales.stor_id IS null
GO

-- mostra itens que pertence a um único conjunto

--SELECT stores.stor_name, stores.stor_id FROM stores
--LEFT JOIN sales
--ON stores.stor_id = sales.stor_id
--WHERE sales.stor_id IS null
--GO


