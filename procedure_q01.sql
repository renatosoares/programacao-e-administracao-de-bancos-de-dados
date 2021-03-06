-- 1.	Crie um procedimento armazenado que exiba o código do livro, o título do livro e o nome do autor, por ordem crescente de titulo do livro e nome de autor.
ALTER PROCEDURE uspListar
AS
SELECT t.title_id, t.title, a.au_lname 
FROM titles AS t
	INNER JOIN titleauthor AS ta
ON  t.title_id = ta.title_id
	INNER JOIN authors AS a
ON a.au_id = ta.au_id
ORDER BY t.title ASC, a.au_lname ASC 
