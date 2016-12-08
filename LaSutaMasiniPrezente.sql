--Cat la suta din masinile prezente in parcare  sunt din  judetului X

USE Parcare	 
GO
DECLARE
@judet nvarchar(50) = 'Bucuresti'
--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.LaSutaMasiniPrezente
DECLARE
  @codJ varchar(2) = null	
SET @codJ = (SELECT dbo.CodJudet(@judet))


SELECT CAST (( COUNT(M.Numar) * 100 / (SELECT COUNT(M.Numar) FROM Masina M 
JOIN Vizita V  ON V.MasinaId = M.Id
WHERE V.DataPlecare IS NULL)) as varchar) + '%' AS 'LaSutaProducatorActiv' FROM Masina M 
JOIN Vizita V  ON V.MasinaId = M.Id
WHERE V.DataPlecare IS NULL AND 
((@codJ='B' AND LEFT(Numar,2) like @codJ+'[0-9]') OR (@codJ !='B' AND LEFT(Numar,2) = @codJ))






--SELECT CAST (( COUNT(MN.Numar) * 100 / (SELECT COUNT(M.Numar) FROM Masina M 
--JOIN Vizita V  ON V.MasinaId = M.Id
--WHERE V.DataPlecare = NULL)) as varchar) + '%' AS 'LaSutaProducatorActiv'
--FROM Masina MN


--SELECT COUNT(M.Numar) FROM Masina M 
--JOIN Vizita V  ON V.MasinaId = M.Id
--WHERE V.DataPlecare = NULL
--GO

