/*
2.
Adicione o campo QtyVendor na tabela Production.Product. Crie um
cursor do tipo UPDATE para atualizar o novo campo inserido com a
quantidade de vendedores relacionados ao produto existentes na tabela
Purchasing.ProductVendor.
*/

ALTER TABLE [AdventureWorks2014].[Production].[Product]
ADD QtyVendor INT

ALTER TABLE [AdventureWorks2014].[Production].[Product]
DROP COLUMN QtyVendor;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DECLARE @product_id varchar(10);
DECLARE @qty_business_entity varchar(3);

DECLARE cursor_qty_vendor CURSOR FOR

SELECT pv.ProductID, COUNT(pv.ProductID) as BusinessEntity FROM [AdventureWorks2014].[Purchasing].[ProductVendor] AS pv
GROUP BY pv.ProductID

OPEN cursor_qty_vendor 
FETCH NEXT FROM cursor_qty_vendor
INTO @product_id, @qty_business_entity

WHILE @@FETCH_STATUS = 0
	BEGIN

		UPDATE [AdventureWorks2014].[Production].[Product]
		SET  [QtyVendor] = @qty_business_entity
		WHERE ProductID = @product_id

		FETCH NEXT FROM cursor_qty_vendor
		INTO @product_id, @qty_business_entity
	END 
CLOSE cursor_qty_vendor;
DEALLOCATE cursor_qty_vendor;