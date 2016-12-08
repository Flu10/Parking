
--Cat profit a scos Parcarea in perioada Y cu tarfiul Z pe ora. 
USE Parcare	
GO
 --EXEC listaElemente '2014-11-08'
--CREATE PROCEDURE dbo.ProfitParcare
--SELECT * FROM NIVEL SELECT * FROM Vizita
DECLARE

  @perioadaInceput datetime = '2015-01-01 10:10:10',
  @perioadaSfarsit datetime = '2017-01-01 10:10:10'	,
  @tarif decimal = 2.00
-- AS

SELECT  SUM(DATEDIFF(HOUR,V.DataSosire,V.DataPlecare))*@tarif AS 'Castig',SUM(DATEDIFF(HOUR,V.DataSosire,V.DataPlecare))*@tarif - (SELECT SUM(N.CostIntretinere) FROM Nivel N) AS 'Profit' FROM Vizita V 
INNER JOIN 
(SELECT  V.Id
FROM Vizita V
WHERE V.DataSosire > @perioadaInceput AND V.DataPlecare < @perioadaSfarsit) AS Viz
ON Viz.Id = V.Id



GO
