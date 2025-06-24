CREATE VIEW TerroristasCidadeX AS
SELECT DISTINCT 
    p.Nome, 
    p.Sobrenome,
    GROUP_CONCAT(DISTINCT d.Numero_Documento) as Documentos
FROM Pessoa p
INNER JOIN RegistroCriminal rc ON p.ID_Pessoa = rc.ID_Pessoa
INNER JOIN TipoCrime tc ON rc.ID_TipoCrime = tc.ID_TipoCrime
INNER JOIN Localizacao l ON p.ID_Pessoa = l.ID_Pessoa
LEFT JOIN DocumentoIdentidade d ON p.ID_Pessoa = d.ID_Pessoa
WHERE tc.Descricao = 'Terrorismo'
AND l.ID_Cidade = 1 
AND l.Data_hora >= '2024-10-01' 
AND l.Data_hora <= '2024-12-31' 
GROUP BY p.ID_Pessoa, p.Nome, p.Sobrenome;

SELECT * FROM TerroristasCidadeX;