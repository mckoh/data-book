-- Single Entity
-- Beispiel

drop database if exists university;
create database if not exists university;
use university;

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
    program varchar(50)
);

insert into student values
(NULL, "Sam", "Brown", "m", "sam@brown.com", "1990-07-14", "uk", current_timestamp(), "Web Business & Technology"),
(NULL, "Anne", "Scott", "f", "a@mail.com", "1990-02-23", "us", current_timestamp(), "Data Science & Intelligent Analytics"),
(NULL, "Iris", "Furgeson", "f", "if@freemail.com", "1989-12-10", "uk", current_timestamp(), "Web Business & Technology"),
(NULL, "Mike", "Miller", "m", "miller.m@mail.com", "1991-01-11", "uk", current_timestamp(), "Data Science & Intelligent Analytics");
