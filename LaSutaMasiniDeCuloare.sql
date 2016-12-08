--Cat la suta dintre masinile care au parcat in perioada Y au culoarea X 

USE Parcare	 
GO

--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.LaSutaMasiniDeCuloare
DECLARE
@culoare nvarchar(50) = 'galben',
@perioadaInceput datetime = '2016-01-01 10:00:00',
@perioadaSfarsit datetime = '2016-12-01 10:00:00'


SELECT CAST (( COUNT(M.Numar) * 100 / (SELECT COUNT(M.Numar) FROM Masina M 
JOIN Vizita V  ON V.MasinaId = M.Id
WHERE (V.DataPlecare > @perioadaInceput AND V.DataPlecare < @perioadaSfarsit) OR
 (V.DataSosire > @perioadaInceput AND V.DataSosire < @perioadaSfarsit))) as varchar) + '%' AS 'LaSutaProducatorActiv' FROM Masina M 
JOIN Vizita V  ON V.MasinaId = M.Id
WHERE ((V.DataPlecare > @perioadaInceput AND V.DataPlecare < @perioadaSfarsit) OR
 (V.DataSosire > @perioadaInceput AND V.DataSosire < @perioadaSfarsit)) AND M.Culoare = @culoare




--SELECT CAST (( COUNT(MN.Numar) * 100 / (SELECT COUNT(M.Numar) FROM Masina M 
--JOIN Vizita V  ON V.MasinaId = M.Id
--WHERE V.DataPlecare = NULL)) as varchar) + '%' AS 'LaSutaProducatorActiv'
--FROM Masina MN


--SELECT COUNT(M.Numar) FROM Masina M 
--JOIN Vizita V  ON V.MasinaId = M.Id
--WHERE V.DataPlecare = NULL
--GO

