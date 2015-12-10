-- 4.	Crie um procedimento armazenado para inserir uma nova loja de livros.
CREATE PROCEDURE uspInserirLoja
		@ID VARCHAR(MAX),
		@name VARCHAR(MAX),
		@address VARCHAR(MAX),
		@city VARCHAR(MAX),
		@stateStore VARCHAR(MAX),
		@zip VARCHAR(MAX)
AS
INSERT INTO stores (stor_id, stor_name, stor_address, city, state, zip)
VALUES (@id, @name, @address, @city, @stateStore, @zip);