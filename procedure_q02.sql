-- 2.	Crie um procedimento armazenado que exiba o código do livro, o título do livro e a quantidade de autores do livro, ordenando por título do livro.
CREATE PROCEDURE spuQtdAutorLivro
AS
SELECT t.title_id, t.title, ta.au_ord
FROM titles AS t
	INNER JOIN titleauthor AS ta
ON t.title_id = ta.title_id
ORDER BY t.title ASC