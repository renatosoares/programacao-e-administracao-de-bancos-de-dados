-- 6.	Crie um procedimento armazenado para listar os livros da editora com maior quantidade de títulos editados. 
-- Apresentar a listagem incluindo a editora, o título do livro e o nome dos autores.

SELECT publishers.pub_name, titles.title, authors.au_lname FROM titleauthor
INNER JOIN titles
ON titles.title_id = titleauthor.title_id 
INNER JOIN authors
ON authors.au_id = titleauthor.au_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
-- outro select com a quantidade de pub_id repedidos em titles
WHERE publishers.pub_id = (SELECT tab1.pub_id from (SELECT TOP 1 titles.pub_id, COUNT(titles.pub_id) AS NU FROM titles
GROUP BY pub_id
ORDER BY NU DESC) as tab1)
GO


