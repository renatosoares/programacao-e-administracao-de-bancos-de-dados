/*
4.
	Escreva um comando que altere o campo qty da view singleauthors
	somando 2 no seu valor para o autor de código '172-32-1176'.
	Execute o comando e	comente o resultado da execução. 
*/
USE Pubs;   
GO   

UPDATE Singleauthors SET
	qty = qty + 2
WHERE au_id = '172-32-1176';
GO

-- (1 row affected)