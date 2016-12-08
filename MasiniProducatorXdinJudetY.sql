
--Tabela cu informatii despre masinile cu Producator X din judetul Y .
USE Parcare	
GO
--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.MasiniProducatorXdinJudetY
DECLARE
  @producator varchar(50) = 'Opel' ,
  @judet varchar(50) = 'Bucuresti',
  @codJ varchar(2) = null	
-- AS
SET @codJ = (SELECT dbo.CodJudet(@judet))

SELECT MN.Numar,MN.Culoare,MDL.Nume,PR.Nume 
FROM Masina MN
JOIN Model MDL ON MN.ModelId = MDL.Id
JOIN Producator PR ON PR.Id = MDL.ProducatorId
WHERE PR.Nume = @producator AND 
((@codJ='B' AND LEFT(Numar,2) like @codJ+'[0-9]') OR (@codJ !='B' AND LEFT(Numar,2) = @codJ))
GO
