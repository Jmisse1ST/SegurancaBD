SELECT 
    p.Nome,
    p.Sobrenome,
    (SELECT d.Numero_Documento 
     FROM DocumentoIdentidade d 
     INNER JOIN TipoDocumento td ON d.ID_TipoDocumento = td.ID_TipoDocumento 
     WHERE d.ID_Pessoa = p.ID_Pessoa AND td.Descricao = 'Passaporte'
     LIMIT 1) as Passaporte
FROM Pessoa p
WHERE EXISTS (
    SELECT 1 
    FROM DocumentoIdentidade d
    INNER JOIN TipoDocumento td ON d.ID_TipoDocumento = td.ID_TipoDocumento
    WHERE d.ID_Pessoa = p.ID_Pessoa AND td.Descricao = 'Passaporte'
)
AND EXISTS (
    SELECT 1 
    FROM RegistroCriminal rc
    INNER JOIN TipoCrime tc ON rc.ID_TipoCrime = tc.ID_TipoCrime
    WHERE rc.ID_Pessoa = p.ID_Pessoa AND tc.Descricao = 'Tráfico de Drogas'
);