SELECT 
    c.Nome as Cidade,
    c.Latitude,
    c.Longitude,
    (SELECT COUNT(DISTINCT l2.ID_Pessoa)
     FROM Localizacao l2
     WHERE l2.ID_Cidade = c.ID_Cidade
     AND l2.Data_hora >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)) as Total_Pessoas,
    (SELECT COUNT(*)
     FROM Localizacao l3
     INNER JOIN Pessoa p3 ON l3.ID_Pessoa = p3.ID_Pessoa
     INNER JOIN RegistroCriminal rc3 ON p3.ID_Pessoa = rc3.ID_Pessoa
     INNER JOIN TipoCrime tc3 ON rc3.ID_TipoCrime = tc3.ID_TipoCrime
     WHERE l3.ID_Cidade = c.ID_Cidade
     AND l3.Data_hora >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
     AND tc3.Gravidade IN ('Grave', 'Muito Grave')) as Total_Crimes_Graves
FROM Cidade c
WHERE EXISTS (
    SELECT 1
    FROM Localizacao l
    INNER JOIN Pessoa p ON l.ID_Pessoa = p.ID_Pessoa
    INNER JOIN RegistroCriminal rc ON p.ID_Pessoa = rc.ID_Pessoa
    INNER JOIN TipoCrime tc ON rc.ID_TipoCrime = tc.ID_TipoCrime
    WHERE l.ID_Cidade = c.ID_Cidade
    AND l.Data_hora >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND tc.Gravidade IN ('Grave', 'Muito Grave')
)
ORDER BY Total_Crimes_Graves DESC;