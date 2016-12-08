--Cat la suta dintre masinile care au parcat in perioada Y au culoarea X 

USE Parcare	 
GO

--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.LaSutaModelAnX
DECLARE
@an int = 2005


SELECT CAST (( COUNT(M.Numar) * 100 / ( SELECT COUNT(Ma.Numar) FROM Masina Ma )) as varchar) + '%' AS 'LaSutaProducatorActiv'
 FROM Masina M 
JOIN Model MD  ON M.ModelId = MD.Id
WHERE MD.An = @an
SELECT * FROM MODEL


