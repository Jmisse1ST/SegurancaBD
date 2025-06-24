SELECT 
    p.Nome,
    p.Sobrenome
FROM Pessoa p
WHERE EXISTS (
    SELECT 1 
    FROM RegistroCriminal rc
    INNER JOIN TipoCrime tc ON rc.ID_TipoCrime = tc.ID_TipoCrime
    WHERE rc.ID_Pessoa = p.ID_Pessoa 
    AND tc.Descricao = 'Terrorismo'
)
AND NOT EXISTS (
    SELECT 1 
    FROM Biometria b
    INNER JOIN TipoBiometria tb ON b.ID_TipoBiometria = tb.ID_TipoBiometria
    WHERE b.ID_Pessoa = p.ID_Pessoa 
    AND tb.Descricao = 'Reconhecimento Facial'
);