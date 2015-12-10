-- 2.	Crie um procedimento armazenado que exiba o c�digo do livro, o t�tulo do livro e a quantidade de autores do livro, ordenando por t�tulo do livro.
CREATE PROCEDURE spuQtdAutorLivro
AS
SELECT t.title_id, t.title, ta.au_ord
FROM titles AS t
	INNER JOIN titleauthor AS ta
ON t.title_id = ta.title_id
ORDER BY t.title ASC