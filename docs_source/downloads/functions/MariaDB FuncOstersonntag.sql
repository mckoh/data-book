USE machines;

DROP FUNCTION `FuncOstersonntag`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `FuncOstersonntag`(Jahr BIGINT) RETURNS date
    DETERMINISTIC
BEGIN

        DECLARE a BIGINT;
        DECLARE b BIGINT;
        DECLARE c BIGINT;
        DECLARE d BIGINT;
        DECLARE e BIGINT;
        DECLARE f BIGINT;
        DECLARE datum CHAR(8);


        SET a = Jahr % 19;
		SET b = Jahr / 100;
        SET c = ( 8 * b + 13 ) / 25 - 2;
        SET d = b - ( Jahr / 400 ) - 2;
        SET e = ( 19 * ( Jahr % 19 ) + ( ( 15 - c + d ) % 30 ) ) % 30;
        SET e = IF(e=28 AND a>10, 27, e);
		SET e = IF(e=29, 28, e);
        SET f = ( d + 6 * e + 2 * ( Jahr % 4 ) + 4 * ( Jahr % 7 ) + 6 ) % 7;

        SET datum = DATE_FORMAT(Jahr * 10000 + 101,'%Y-%m-%d');
        SET datum = DATE_FORMAT(DATE_ADD(datum, INTERVAL 2 MONTH), '%Y-%m-%d');
        SET datum = DATE_FORMAT(DATE_ADD(datum, INTERVAL e + f + 21 DAY ), '%Y-%m-%d');

    RETURN datum;

END$$
DELIMITER ;
