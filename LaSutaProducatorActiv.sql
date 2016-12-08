--Cat la suta dintre masinile salvate in baza au producator activ

USE Parcare	 
GO
--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.LaSutaProducatorActiv
SELECT CAST (( COUNT(MN.Numar) * 100 / (SELECT COUNT(MN.Numar) FROM Masina MN)) as varchar) + '%' AS 'LaSutaProducatorActiv'
FROM Masina MN
JOIN Model MDL ON MN.ModelId = MDL.Id
JOIN Producator P ON MDL.ProducatorId = P.Id
WHERE P.Activ = 1;
GO

