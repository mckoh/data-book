-- Common Table Expression
-- Beispiel

create database human_resource;
use human_resource;

create table employee (
    employee_id int auto_increment primary key,
    firstname varchar(50),
    lastname varchar(50),
    boss_id int,
    foreign key(boss_id)
    references employee(employee_id)
);

insert into employee values
(1, "Sam", "Sam", NULL),
(2, "Bill", "Bill", 1),
(3, "Mike", "Mike", 1),
(4, "Paul", "Paul", 1),
(5, "Frank", "Frank", 3),
(6, "Kira", "Kira", 3),
(7, "Elon", "Elon", 2),
(8, "Aretha", "Aretha", 2);

select boss.lastname, emp.lastname
from employee as boss
join employee as emp
    on emp.boss_id = boss.employee_id;
    
select top_level.lastname, mid_level.lastname, bottom_level.lastname
from employee as top_level
join employee as mid_level
    on mid_level.boss_id = top_level.employee_id
join employee as bottom_level
    on bottom_level.boss_id = mid_level.employee_id;
    
with recursive recursive_view as (

    select employee_id, lastname as employee, 0 as `level`
    from employee
    where boss_id is null

    union select child.employee_id, child.lastname, `level` + 1 as `level`
    from recursive_view as parent
    join employee as child
    on parent.employee_id = child.boss_id

)

select *
from recursive_view;