--Cat la suta dintre masinile care au parcat in perioada Y au culoarea X 

USE Parcare	 
GO

--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.XOreLaRand
DECLARE
@ore int = 4
--AS
SELECT DISTINCT M.Numar, M.Culoare, MD.Nume , P.Nume  FROM Vizita V
JOIN Masina M ON M.Id = V.MasinaId
JOIN Model MD ON MD.Id = M.ModelId
JOIN Producator P ON P.Id = MD.ProducatorId
WHERE DATEDIFF(HOUR,V.DataSosire,V.DataPlecare) >= @ore

--GO