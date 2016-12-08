--Se afiseaza vizitele lui masina cu numarul X , 
--Culoare Y , Model Z , Producator W, a fost in Perioada T.

USE Parcare	 
GO

--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.InformatiiCuloareModelProducator
DECLARE
@numar varchar(8) ='B999TST',
@culoare nvarchar(50) = 'Rosu',
@model nvarchar(50) = 'Corsa',
@producator nvarchar(50) = 'Opel',
@perioadaInceput datetime = '2016-01-01 10:00:00',
@perioadaSfarsit datetime = '2016-12-10 00:00:01'

SELECT  M.Numar, M.Culoare, MD.Nume , MD.An , P.Nume , V.DataSosire ,V.DataSosire 
FROM Masina M
INNER JOIN Vizita V ON M.Id = V.MasinaId
INNER JOIN Model MD ON MD.Id = M.ModelId
INNER JOIN Producator P ON P.Id = MD.ProducatorId
WHERE M.Numar = @numar AND M.Culoare = @culoare AND
 MD.Nume = @model AND P.Nume = @producator AND 
 ((V.DataPlecare < @perioadaSfarsit AND V.DataPlecare > @perioadaInceput )
 OR (V.DataSosire < @perioadaSfarsit AND V.DataSosire > @perioadaInceput ))
--GO

