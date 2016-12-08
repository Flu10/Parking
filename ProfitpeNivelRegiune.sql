
--Cat profit a scos Regiunea X Din Nivelul T  in perioada Y cu tarfiul Z pe ora. 
USE Parcare	
GO
--EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.ProfitpeNivelRegiune
--SELECT * FROM NIVEL SELECT * FROM Vizita
DECLARE
  @regiune char(1) = 'L' ,
  @nivel varchar(50) = '1',
  @perioadaInceput datetime = '2015-01-01 10:10:10',
  @perioadaSfarsit datetime = '2017-01-01 10:10:10'	,
  @tarif decimal = 2.00
-- AS

SELECT N.Nume,N.Regiune, SUM(DATEDIFF(HOUR,V.DataSosire,V.DataPlecare))*@tarif  AS 'Castig' , SUM(DATEDIFF(HOUR,V.DataSosire,V.DataPlecare))*@tarif - N.CostIntretinere AS 'Profit' FROM Vizita V 
INNER JOIN 
(SELECT  V.Id
FROM Vizita V
WHERE V.DataSosire > @perioadaInceput AND V.DataPlecare < @perioadaSfarsit) AS Viz
ON Viz.Id = V.Id
INNER JOIN Nivel N ON N.Id = V.NivelId AND N.Nume = @nivel AND N.Regiune = @regiune
GROUP BY N.Nume , N.Regiune , N.CostIntretinere


GO
