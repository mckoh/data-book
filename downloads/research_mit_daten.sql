DROP SCHEMA IF EXISTS research;
CREATE SCHEMA research
DEFAULT CHARACTER SET utf8;
USE research;

CREATE TABLE IF NOT EXISTS research.sample (
	sample_id INT,
	amount DECIMAL(10,2),
	longitude DECIMAL(15,7),
	latitude DECIMAL(15,7),
	sampling_datetime DATETIME,
    parent_sample_id INT,
	PRIMARY KEY (sample_id),
	FOREIGN KEY (parent_sample_id)
		REFERENCES research.sample (sample_id)
);

insert into research.sample (sample_id, amount, longitude, latitude, sampling_datetime, parent_sample_id) values
(1, 21.05, 113.7603078, -8.1306189, '2019-10-06', null),
(2, 15.43, 113.733047, 27.640075, '2021-10-10', 1),
(3, 18.11, 106.9240554, -7.0054878, '2020-09-24', 1),
(4, 26.17, 123.4699481, 41.805137, '2019-01-03', 2),
(5, 17.69, 15.7899671, 60.0114861, '2019-02-14', 2),
(6, 33.72, 114.418181, 33.404544, '2019-12-21', 3),
(7, 28.26, -43.0280584, -15.741151, '2020-05-17', 4),
(8, 31.58, 7.310776, 43.701416, '2019-10-06', 4),
(9, 19.32, 23.9667402, 37.8269697, '2020-05-30', 5),
(10, 15.68, 114.9671388, -8.2104974, '2018-11-06', 5),
(11, 25.73, -47.0625812, -22.9098833, '2020-11-23', 5),
(12, 33.97, 48.33333, -20.6, '2019-10-12', 4),
(13, 26.25, 35.1901151, -0.582624, '2021-03-23', 6),
(14, 16.9, 5.0963141, 8.1402266, '2019-02-08', 6),
(15, 35.48, 13.2057597, 12.4860074, '2020-09-21', 7),
(16, 35.19, 121.499673, 31.239878, '2021-06-23', 7),
(17, 32.86, 100.630898, -1.445213, '2020-02-21', 12),
(18, 33.98, -68.8493333, -32.9677252, '2020-12-28', 11),
(19, 16.6, -87.0361917, 13.1267875, '2020-06-17', 9),
(20, 34.03, 116.0561632, -8.351844, '2021-06-28', 9),
(21, 20.49, 120.4083, -9.9755, '2021-04-01', null),
(22, 25.77, -57.1882847, -15.0705872, '2019-03-17', 2),
(23, 17.85, 126.3020575, 8.7833709, '2019-12-17', 3),
(24, 22.28, 123.9881642, 12.6679167, '2021-06-11', 4),
(25, 33.46, -88.0876336, 14.7121689, '2021-02-26', 5),
(26, 19.76, 138.9363063, 35.0725969, '2021-08-03', 9),
(27, 24.66, 113.9060624, -6.9253999, '2019-05-20', null),
(28, 24.66, 33.1604555, -11.2166885, '2018-11-05', null),
(29, 32.85, 17.5871593, 54.0541924, '2021-03-27', null),
(30, 24.02, 144.55, 8.6, '2021-07-02', null);

CREATE TABLE IF NOT EXISTS research.person (
	person_id INT,
	firstname VARCHAR(120),
	lastname VARCHAR(120),
	email VARCHAR(220),
	PRIMARY KEY (person_id)
);

insert into research.person (person_id, firstname, lastname, email) values
(1, 'Nertie', 'Joll', 'njoll0@addthis.com'),
(2, 'Thatcher', 'Samson', 'tsamson1@hao123.com'),
(3, 'Dewitt', 'Dimitresco', 'ddimitresco2@yellowpages.com'),
(4, 'Nickie', 'Wheatcroft', 'nwheatcroft3@diigo.com'),
(5, 'Cody', 'Smithson', 'csmithson4@hubpages.com'),
(6, 'Dorothea', 'Odell', 'dodell5@tripod.com'),
(7, 'Diane', 'Sugars', 'dsugars6@gizmodo.com'),
(8, 'Jemmie', 'Learmonth', 'jlearmonth7@creativecommons.org'),
(9, 'Dolorita', 'Beddard', 'dbeddard8@ask.com'),
(10, 'Sacha', 'Dutt', 'sdutt9@washingtonpost.com');


CREATE TABLE IF NOT EXISTS research.institution (
	institution_id INT,
	longname VARCHAR(120),
	shortname VARCHAR(5),
	PRIMARY KEY (institution_id))
;

insert into research.institution (institution_id, longname, shortname) values
(1, "University of Innsbruck", "UIBK"),
(2, "University of Vienna", "UVIE"),
(3, "Massachusetts Institute of Technology", "MIT");

CREATE TABLE IF NOT EXISTS research.department (
	department_id INT,
	longname VARCHAR(120),
	shortname VARCHAR(5),
	institution_id INT,
	PRIMARY KEY (department_id),
	FOREIGN KEY (institution_id)
		REFERENCES research.institution (institution_id)
);
insert into research.department (department_id, longname, shortname, institution_id) values
(1, "Institute for Geology", "IfG", 1),
(2, "Information Systems Unit", "ISU", 1),
(3, "Physics Department", "PD", 2),
(4, "School of Medicine", "SoM", 2),
(5, "Engineering Research Unit", "ERU", 3);

CREATE TABLE IF NOT EXISTS research.researcher (
	person_id INT,
	department_id INT,
	PRIMARY KEY (person_id),
	FOREIGN KEY (person_id)
		REFERENCES research.person (person_id),
    FOREIGN KEY (department_id)
		REFERENCES research.department (department_id)
);

insert into research.researcher (person_id, department_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

CREATE TABLE IF NOT EXISTS research.administrator (
	person_id INT,
	office_number VARCHAR(20),
	PRIMARY KEY (person_id),
	FOREIGN KEY (person_id)
		REFERENCES research.person (person_id)
);

insert into research.administrator (person_id, office_number) values
(6, "A-12"),
(7, "B-25"),
(8, "Lab 25"),
(9, "Raum 12"),
(10, "R1-12");

CREATE TABLE IF NOT EXISTS research.procedure (
	procedure_id INT,
	person_id INT,
    description varchar(120),
	PRIMARY KEY (procedure_id),
	FOREIGN KEY (person_id)
		REFERENCES research.administrator (person_id)
);

insert into research.procedure (procedure_id, person_id, description) values 
(1, 8, 'Allium serra McNeal & Ownbey'),
(2, 7, 'Lupinus nanus Douglas ex Benth. ssp. latifolius (Benth. ex Torr.) D. Dunn'),
(3, 10, 'Tillandsia tenuifolia L.'),
(4, 6, 'Cryptantha tumulosa (Payson) Payson'),
(5, 8, 'Lesquerella ludoviciana (Nutt.) S. Watson'),
(6, 10, 'Phacelia coerulea Greene'),
(7, 9, 'Cuscuta salina Engelm. var. salina'),
(8, 9, 'Andreaea alpestris (Thed.) Schimp.'),
(9, 7, 'Astragalus argophyllus Nutt.'),
(10, 9, 'Saponaria pumilio (L.) Fenzl ex A. Braun');

CREATE TABLE IF NOT EXISTS research.analysis (
	analysis_id INT PRIMARY KEY,
	analysis_datetime VARCHAR(45),
    sample_id INT,
	procedure_id INT,
	person_id INT,
	FOREIGN KEY (sample_id)
		REFERENCES research.sample (sample_id),
	FOREIGN KEY (procedure_id)
		REFERENCES research.procedure (procedure_id),
	FOREIGN KEY (person_id)
		REFERENCES research.researcher (person_id)
);

insert into research.analysis (analysis_id, analysis_datetime, sample_id, procedure_id, person_id) values 
(1, '2021-09-01', 3, 10, 3),
(2, '2021-02-09', 24, 8, 5),
(3, '2021-01-11', 13, 10, 1),
(4, '2021-08-20', 6, 3, 2),
(5, '2021-05-16', 23, 10, 3),
(6, '2021-04-17', 30, 10, 3),
(7, '2020-10-28', 19, 3, 4),
(8, '2021-08-02', 21, 10, 3),
(9, '2021-06-06', 10, 1, 3),
(10, '2021-04-09', 29, 3, 2),
(11, '2020-11-21', 22, 1, 4),
(12, '2021-05-20', 30, 6, 5),
(13, '2021-04-04', 10, 4, 4),
(14, '2021-07-19', 6, 8, 1),
(15, '2021-03-12', 2, 10, 5),
(16, '2021-08-23', 26, 6, 5),
(17, '2021-04-18', 18, 6, 2),
(18, '2021-05-19', 21, 6, 4),
(19, '2021-01-26', 11, 2, 3),
(20, '2021-04-19', 3, 6, 5),
(21, '2021-05-18', 9, 7, 3),
(22, '2021-09-17', 11, 10, 1),
(23, '2021-07-19', 2, 2, 2),
(24, '2021-08-15', 14, 2, 1),
(25, '2021-05-12', 7, 2, 3),
(26, '2021-07-29', 28, 1, 2),
(27, '2020-11-24', 29, 6, 3),
(28, '2021-01-19', 1, 2, 2),
(29, '2021-06-07', 7, 10, 5),
(30, '2021-01-25', 5, 6, 3),
(31, '2021-05-14', 22, 2, 2),
(32, '2021-10-09', 24, 10, 5),
(33, '2021-07-27', 8, 2, 5),
(34, '2021-01-24', 27, 6, 3),
(35, '2021-07-15', 25, 10, 4),
(36, '2021-09-19', 29, 7, 5),
(37, '2021-07-12', 20, 5, 3),
(38, '2021-08-17', 17, 1, 5),
(39, '2020-11-09', 4, 7, 1),
(40, '2021-01-08', 11, 8, 2),
(41, '2021-10-26', 6, 9, 3),
(42, '2021-04-21', 4, 3, 4),
(43, '2021-04-05', 21, 8, 3),
(44, '2020-11-11', 19, 3, 5),
(45, '2021-06-10', 16, 4, 5),
(46, '2021-02-28', 1, 3, 5),
(47, '2021-10-05', 3, 3, 2),
(48, '2021-01-02', 13, 4, 4),
(49, '2021-01-26', 16, 3, 4),
(50, '2021-03-20', 30, 8, 3),
(51, '2021-10-13', 22, 6, 2),
(52, '2021-03-14', 5, 7, 4),
(53, '2021-09-24', 12, 7, 3),
(54, '2021-09-12', 21, 1, 2),
(55, '2020-11-24', 20, 4, 5),
(56, '2021-08-05', 25, 6, 4),
(57, '2021-09-23', 24, 8, 1),
(58, '2021-04-10', 4, 1, 1),
(59, '2021-07-06', 8, 8, 3),
(60, '2020-12-22', 24, 7, 1);
