USE machines;

CREATE TABLE `tageinklfeiertag` (
  `Datum` date DEFAULT NULL,
  `istftag` int(11) DEFAULT NULL,
  `Feiertagname` varchar(250) DEFAULT NULL,
  `Datename` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
