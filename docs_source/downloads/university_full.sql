drop database if exists university;
create database if not exists university;
use university;

-- Studiengang
drop table if exists program;
create table if not exists program (
	program_id int auto_increment primary key,
	title varchar(50),
    founding_date date
);

drop table if exists gender;
create table if not exists gender (
	gender_id int auto_increment primary key,
	title varchar(20)
);

drop table if exists city;
create table if not exists city (
	city_id int auto_increment primary key,
	longname varchar(50),
    zip varchar(20)
);

-- Student
drop table if exists student;
create table if not exists student (
    student_id int auto_increment primary key,
    firstname varchar(45),
    lastname varchar(50),
    email varchar(80),
    street varchar(100),
    street_number varchar(10),
    birthdate date,
    nationality varchar(2),
    registry_date datetime,
    program_id int,
    foreign key (program_id)
        references program (program_id),
    gender_id int,
    foreign key (gender_id)
        references gender (gender_id),
    city_id int,
    foreign key (city_id)
        references city (city_id)
);

drop table if exists lecturer;
create table if not exists lecturer (
    lecturer_id int auto_increment primary key,
    firstname varchar(45),
    lastname varchar(50),
    email varchar(80),
    street varchar(100),
    street_number varchar(10),
    salary decimal(5,2),
    gender_id int,
    foreign key (gender_id)
        references gender (gender_id),
    city_id int,
    foreign key (city_id)
        references city (city_id)
);

drop table if exists `language`;
create table if not exists `language` (
	language_id int auto_increment primary key,
	shortname varchar(2),
    longname varchar(50)
);

-- Lehrveranstaltung
drop table if exists course;
create table if not exists course (
	course_id int auto_increment primary key,
    title varchar(60),
    sws decimal(4,1),
    ects decimal(4,1),
    lecturer_id int,
    foreign key (lecturer_id)
        references lecturer (lecturer_id),
    language_id int,
    foreign key (language_id)
        references `language` (language_id)
);

drop table if exists semester;
create table if not exists semester (
    semester_id int auto_increment primary key,
    shortname varchar(4),
    longname varchar(50),
    from_date date,
    to_date date
);

-- Lehrveranstaltungseinschreibung
drop table if exists enrollment;
create table if not exists enrollment (
	enrollment_id int auto_increment primary key,
    student_id int,
    foreign key (student_id)
        references student (student_id),
    course_id int,
    foreign key (course_id)
        references course (course_id),
    semester_id int,
    foreign key (semester_id)
        references semester (semester_id)
);

insert into city values
(1, "Kufstein", "6330"),
(2, "Innsbruck", "6020");

insert into gender values
(1, "female"),
(2, "male");

insert into `language` values
(1, "DE", "Deutsch"),
(2, "EN", "Englisch");

insert into program values
(1, "Web Business & Technology", "2013-10-01"),
(2, "Data Sciece & Intelligent Analytics", "2018-10-01");

insert into lecturer values
(1, "Bill", "Brady", "b@br.com", "Hauptstraße", "1a", 10.35, 2, 1),
(2, "John", "Doe", "jd@mail.com", "Poststraße", "2b", 8.35, 2, 2),
(2, "Bill", "Nye", "bn@mail.com", "Hauptstr.", "15", 10.00, 2, 2);

insert into course values
(1, "Data Engineering ILV", 2, 5, 1, 1),
(2, "Data Engineering Lab", 3, 6, 2, 1);

insert into student values
(1, "Sam", "Brown", "sam@brown.com", "Nebenstraße", "24x", "1990-07-14", "AT", current_timestamp(), 1, 2, 2),
(2, "Anne", "Scott", "a@mail.com", "Bichl", "1", "1990-02-23", "AT", current_timestamp(), 2, 1, 2),
(3, "Iris", "Furgeson", "if@freemail.com", "Geyerstr.", "26", "1989-12-10", "AT", current_timestamp(), 1, 1, 1),
(4, "Mike", "Miller", "miller.m@mail.com", "Geyerstraße", "12", "1991-01-11", "AT", current_timestamp(), 2, 2, 1);

insert into semester values 
(1, "20WS", "Wintersemester 2020/2021", "2020-10-01", "2021-01-31"),
(2, "21SS", "Sommersemester 2021", "2021-03-01", "2021-06-30");

insert into enrollment values
(NULL, 1, 1, 1),
(NULL, 2, 1, 1),
(NULL, 3, 1, 1),
(NULL, 4, 1, 2),
(NULL, 2, 2, 2),
(NULL, 4, 2, 2);