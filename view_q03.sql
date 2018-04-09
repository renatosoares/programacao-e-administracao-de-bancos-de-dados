/*
3.
	Crie uma view denominada singleauthors com os autores que têm
	apenas um livro	publicado listando o código do autor, o nome do
	autor, o código do livro, o título do livro e a quantidade de
	livros. Inclua as opções with schemabinding	e with check options
	nesta view. 
*/

USE Pubs;   
GO  
CREATE VIEW singleauthors
AS
SELECT ta.au_id, a.au_fname, t.title_id, t.title, a.qty
FROM titleauthor AS ta
JOIN authors AS a 
ON ta.au_id = a.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
WHERE ta.au_ord = 1
WITH CHECK OPTION
;    
GO  

SELECT * FROM singleauthors;
GO