USE machines;

DROP TABLE TageinklFeiertag;
CREATE TABLE TageinklFeiertag(
	Datum DATE, istftag INT, Feiertagname VARCHAR(150), Wochentag VARCHAR(150)
);

DROP PROCEDURE `Gettageinklfeiertage`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Gettageinklfeiertage`(Jahr VARCHAR(4))
BEGIN

					DECLARE Datum   DATE;
					DECLARE hdatum  DATE;
					DECLARE istftag INT;
					DECLARE Ostern  DATE;
					DECLARE Feiertagname  VARCHAR(250);

					SELECT Ostern = machines.FuncOstersonntag (Jahr);
					SET Datum = CAST(Jahr * 10000 + 100 + 1 AS CHAR(10)) ;
					SET hdatum = CAST((CAST(Jahr AS UNSIGNED INTEGER) + 1 ) * 10000 + 100 + 1 AS CHAR (10));

					WHILE Datum < hdatum DO
								
						SET Feiertagname = '';
						SET istftag = 0;
						
                        SET Feiertagname = IF(DAY(Datum) = 1 AND MONTH(Datum) = 1, 'Neujahr',Feiertagname);
						SET istftag =      IF(DAY(Datum) = 1 AND MONTH(Datum) = 1, 1,istftag);
						
                        SET Feiertagname = IF(DAY(Datum) = 1 AND Month (Datum) = 5, 'Tag der Arbeit',Feiertagname);
						SET istftag =      IF(DAY(Datum) = 1 AND MONTH(Datum) = 5, 1,istftag);
						
                        SET Feiertagname = IF(DAY(Datum) = 3 AND MONTH(Datum) = 10, 'Tag der Deutschen Einheit',Feiertagname);
						SET istftag =      IF(DAY(Datum) = 3 AND MONTH(Datum) = 10, 1,istftag);
						
                        SET Feiertagname = IF(DAY(Datum) = 1 AND MONTH(Datum) = 11, 'Allerheiligen',Feiertagname);
						SET istftag =      IF(DAY(Datum) = 1 AND MONTH(Datum) = 11, 1,istftag);
						
                        SET Feiertagname = IF(DAY(Datum) = 25 AND MONTH(Datum) = 12, '1.Weihnachstag',Feiertagname);
						SET istftag =      IF(DAY(Datum) = 25 AND MONTH(Datum) = 12, 1,istftag);
						
                        SET Feiertagname = IF(DAY(Datum) = 26 AND MONTH(Datum) = 12, '2.Weihnachstag',Feiertagname);
						SET istftag =      IF(DAY(Datum) = 26 AND MONTH(Datum) = 12, 1,istftag);
						
                        SET Feiertagname = IF(Datum = DATE_ADD(Ostern, INTERVAL -2 DAY), 'Karfreitag', Feiertagname);
						SET istftag =      IF(Datum = DATE_ADD(Ostern, INTERVAL -2 DAY), 1,istftag);
						
                        SET Feiertagname = IF(Datum = Ostern, 'Ostersonntag', Feiertagname);
						SET istftag =      IF(Datum = Ostern, 1, istftag);
                        
						SET Feiertagname = IF(Datum = DATE_ADD(Ostern, INTERVAL 1 DAY), 'Ostermontag',Feiertagname);
						SET istftag =      IF(Datum = DATE_ADD(Ostern, INTERVAL 1 DAY), 1,istftag);
                        
						SET Feiertagname = IF(Datum = DATE_ADD(Ostern, INTERVAL 39 DAY), 'Christi Himmelfahrt' ,Feiertagname);
						SET istftag =      IF(Datum = DATE_ADD(Ostern, INTERVAL 39 DAY), 1, istftag);
                        
						SET Feiertagname = IF(Datum = DATE_ADD(Ostern, INTERVAL 50 DAY), 'Pfingstmontag' ,Feiertagname);
						SET istftag =      IF(Datum = DATE_ADD(Ostern, INTERVAL 50 DAY), 1, istftag);
                        
						SET Feiertagname = IF(Datum = DATE_ADD(Ostern, INTERVAL 60 DAY), 'Fronleichnahm' ,Feiertagname);
						SET istftag = IF(Datum = DATE_ADD(Ostern, INTERVAL 60 DAY), 1, istftag);

						INSERT INTO TageinklFeiertag VALUES
						(Datum, istftag, Feiertagname, DAYNAME(Datum));
						SET Datum = DATE_ADD(Datum, INTERVAL 1 DAY);

					END WHILE;

END$$
DELIMITER ;
