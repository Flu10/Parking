CREATE  FUNCTION CodJudet
(@judet VARCHAR(50))
RETURNS VARCHAR(2)
AS
BEGIN
DECLARE @codJudet VARCHAR(2);
IF @judet = 'Bucuresti'
 SET @codJudet = 'B';
 ELSE IF @judet = 'Ilfov'
 SET @codJudet = 'IF';
  ELSE IF @judet = 'Ialomita'
 SET @codJudet = 'IL';
  ELSE IF @judet = 'Braila'
 SET @codJudet = 'BR';
  ELSE IF @judet = 'Calarasi'
 SET @codJudet = 'CL';
  ELSE IF @judet = 'Constanta'
 SET @codJudet = 'CT';
  ELSE IF @judet = 'Tulcea'
 SET @codJudet = 'TL';
  ELSE IF @judet = 'Buzau'
 SET @codJudet = 'BZ';
  ELSE IF @judet = 'Galati'
 SET @codJudet = 'GL';
  ELSE IF @judet = 'Iasi'
 SET @codJudet = 'IS';
  ELSE IF @judet = 'Bistrita-Nasaud'
 SET @codJudet = 'BN';
  ELSE IF @judet = 'Neamt'
 SET @codJudet = 'NT';
  ELSE IF @judet = 'Vaslui'
 SET @codJudet = 'VS';
  ELSE IF @judet = 'Vrancea'
 SET @codJudet = 'VN';
  ELSE IF @judet = 'Covasna'
 SET @codJudet = 'CV';
  ELSE IF @judet = 'Prahova'
 SET @codJudet = 'PH';
  ELSE IF @judet = 'Giurgiu'
 SET @codJudet = 'GR';
  ELSE IF @judet = 'Teleorman'
 SET @codJudet = 'TR';
  ELSE IF @judet = 'Olt'
 SET @codJudet = 'OT';
  ELSE IF @judet = 'Dolj'
 SET @codJudet = 'DT';
  ELSE IF @judet = 'Mehedinti'
 SET @codJudet = 'MH';
  ELSE IF @judet = 'Caras-Severin'
 SET @codJudet = 'CS';
  ELSE IF @judet = 'Gorj'
 SET @codJudet = 'GJ';
  ELSE IF @judet = 'Timisoara'
 SET @codJudet = 'TM';
  ELSE IF @judet = 'Arad'
 SET @codJudet = 'AR';
  ELSE IF @judet = 'Bihor'
 SET @codJudet = 'BH';
  ELSE IF @judet = 'Satu Mare'
 SET @codJudet = 'SM';
  ELSE IF @judet = 'Maramures'
 SET @codJudet = 'MM';
  ELSE IF @judet = 'Suceava'
 SET @codJudet = 'SV';
  ELSE IF @judet = 'Botosani'
 SET @codJudet = 'BT';
  ELSE IF @judet = 'Bacau'
 SET @codJudet = 'BC';
  ELSE IF @judet = 'Harghita'
 SET @codJudet = 'HR';
  ELSE IF @judet = 'Brasov'
 SET @codJudet = 'BV';
  ELSE IF @judet = 'Sibiu'
 SET @codJudet = 'SB';
  ELSE IF @judet = 'Valcea'
 SET @codJudet = 'VL';
  ELSE IF @judet = 'Arges'
 SET @codJudet = 'AG';
  ELSE IF @judet = 'Dambovita'
 SET @codJudet = 'DB';
  ELSE IF @judet = 'Hunedoara'
 SET @codJudet = 'HD';
  ELSE IF @judet = 'Alba'
 SET @codJudet = 'AB';
  ELSE IF @judet = 'Cluj'
 SET @codJudet = 'CJ';
  ELSE IF @judet = 'Salaj'
 SET @codJudet = 'SJ';
   ELSE IF @judet = 'Mures'
 SET @codJudet = 'MS';
 
 RETURN @codJudet ;
 END;