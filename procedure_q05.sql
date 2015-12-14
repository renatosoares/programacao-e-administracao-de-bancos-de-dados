-- 5.	Crie um procedimento armazenado para apagar as lojas de livros que n�o realizaram vendas
CREATE PROCEDURE lojaNaoRealizaVenda
AS
DELETE stores FROM stores
LEFT JOIN sales
ON stores.stor_id = sales.stor_id
WHERE sales.stor_id IS null
GO

-- mostra itens que pertence a um �nico conjunto

--SELECT stores.stor_name, stores.stor_id FROM stores
--LEFT JOIN sales
--ON stores.stor_id = sales.stor_id
--WHERE sales.stor_id IS null
--GO


