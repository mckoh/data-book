-- 1:n-Beziehungstyp
-- Beispiel

drop database if exists university;
create database if not exists university;
use university;

drop table if exists program;
create table if not exists program (
	program_id int auto_increment primary key,
	title varchar(50),
    founding_date date
);

drop table if exists student;
create table if not exists student (
    student_id int auto_increment primary key,
    firstname varchar(45),
    lastname varchar(50),
    gender varchar(1),
    email varchar(80),
    birthdate date,
    nationality varchar(2),
    registry_date datetime,
    program_id int,
    foreign key (program_id)
		references program (program_id)
);

insert into program values
(1, "Web Business & Technology", "2013-10-01"),
(2, "Data Sciece & Intelligent Analytics", "2018-10-01");

insert into student values
(NULL, "Sam", "Brown", "m", "sam@brown.com", "1990-07-14", "uk", current_timestamp(), 1),
(NULL, "Anne", "Scott", "f", "a@mail.com", "1990-02-23", "us", current_timestamp(), 2),
(NULL, "Iris", "Furgeson", "f", "if@freemail.com", "1989-12-10", "uk", current_timestamp(), 1),
(NULL, "Mike", "Miller", "m", "miller.m@mail.com", "1991-01-11", "uk", current_timestamp(), 2);
