--Cat la suta dintre masinile salvate in baza au modelul activ

USE Parcare	 
GO
--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.LaSutaModelActiv
SELECT CAST (( COUNT(MN.Numar) * 100 / (SELECT COUNT(MN.Numar) FROM Masina MN)) as varchar) + '%' AS 'LaSutaModelActiv'
FROM Masina MN
JOIN Model MDL ON MN.ModelId = MDL.Id
WHERE MDL.Activ = 1;
GO

