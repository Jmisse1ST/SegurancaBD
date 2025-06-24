CREATE VIEW PessoasVozMultiplosDoc AS
SELECT 
    p.Nome,
    p.Sobrenome,
    GROUP_CONCAT(DISTINCT CONCAT(td.Descricao, ': ', di.Numero_Documento)) as Documentos
FROM Pessoa p
INNER JOIN Biometria b ON p.ID_Pessoa = b.ID_Pessoa
INNER JOIN TipoBiometria tb ON b.ID_TipoBiometria = tb.ID_TipoBiometria
INNER JOIN DocumentoIdentidade di ON p.ID_Pessoa = di.ID_Pessoa
INNER JOIN TipoDocumento td ON di.ID_TipoDocumento = td.ID_TipoDocumento
WHERE tb.Descricao = 'Reconhecimento de Voz'
GROUP BY p.ID_Pessoa, p.Nome, p.Sobrenome
HAVING COUNT(DISTINCT di.ID_Documento) > 1;

SELECT * FROM PessoasVozMultiplosDoc;