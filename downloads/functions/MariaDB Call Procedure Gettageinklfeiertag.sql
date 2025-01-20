USE machines;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM TageinklFeiertag;

CALL `machines`.`Gettageinklfeiertage`('2010');
CALL `machines`.`Gettageinklfeiertage`('2011');
CALL `machines`.`Gettageinklfeiertage`('2012');
CALL `machines`.`Gettageinklfeiertage`('2013');
CALL `machines`.`Gettageinklfeiertage`('2014');
CALL `machines`.`Gettageinklfeiertage`('2015');
CALL `machines`.`Gettageinklfeiertage`('2016');
CALL `machines`.`Gettageinklfeiertage`('2017');
CALL `machines`.`Gettageinklfeiertage`('2018');
CALL `machines`.`Gettageinklfeiertage`('2019');
CALL `machines`.`Gettageinklfeiertage`('2020');
CALL `machines`.`Gettageinklfeiertage`('2021');
CALL `machines`.`Gettageinklfeiertage`('2022');
