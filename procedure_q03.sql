-- 3.	Crie um procedimento armazenado que liste as editoras com mais de 5 livros editados.
CREATE PROCEDURE uspEditoraPublica
AS
SELECT publishers.pub_name,  COUNT(titles.pub_id) AS numerosDeTitulos FROM titles
LEFT JOIN publishers
ON titles.pub_id=publishers.pub_id
GROUP BY pub_name
HAVING COUNT(pub_name)>5