# MegaTutorium: Hogwarts Datenbank

Für Dokumentationszwecke soll für die Zaubereischule von Hogwarts eine Datenbank erstellt werden, in der alle Aspekte der magischen Welt erfasst werden können. In dieser Datenbasis sollen Schüler (inkl. ihrer Häuser), Lehrer, Unterrichtsfächer, Unerrichtszeiten, Räume und Zaubersprüche erfasst werden. Jedes Fach findet in Hogwarts immer im selben Raum statt. Außerdem ist der Stundenplan für jedes Semester fixiert - Fächer finden also während eines Semesters immer zur selben Zeit am selben Tag statt. Jedem Schüler können Fächer mit zuständigen Lehrern zugeordnet werden. Lehrer von Hogwarts sind in einer Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Lehrer an welcher Stelle der Schulhierarchie stehen. Jeder Lehrer unterrichtet mehrere Fächer. Jedes Fach ist aber genau einem Lehrer zugeordnet. Diese Zuordnung kann sich aber über die Zeit hin ändern.

>**Note:** Im vorliegenden Modell wurden die Fremdschlüsselattribute in die Darstellung mitaufgenommen. Dies ist in der Crow's-Foot-Notation eigentlich nicht erforderlich. Die Darstellung wurde aber dennoch so gewählt, um Betrachtern das Nachvollziehen der Beziehungen - insbesondere der 1:1-Beziehungen - im Modell zu erleichtern.

```mermaid
erDiagram
    teacher{
        person_id int PK, FK "from person"
        entry_date date
        key_number int
        room_id int FK "from room"
        boss_id int FK "from teacher"
    }

    student{
        person_id int PK, FK "from person"
        immatriculation_year int
    }

    person {
        person_id int PK
        firstname varchar(50)
        lastname varchar(50)
        birthdate date
        street varchar(50)
        number varchar(10)
        zip varchar(20)
        city varchar(50)
        country varchar(50)
    }

    subject {
        subject_id int PK
        title varchar(50)
    }

    course{
        course_id int PK
        title varchar(50)
        subject_id int FK "from subject"
        person_id int FK "from teacher"
        room_id int FK "from room"
    }

    semester {
        semester_id int PK
        year int
    }

    course_date{
        course_date_id int PK
        day date
        from time
        to time
        semester_id int FK "from semester"
        course_id int FK "from course"
    }

    room {
        room_id int PK
        floor int
        building varchar(50)
    }

    studies {
        person_id int PK, FK "from student"
        course_id int PK, FK "from course"
        semester_id int PK, FK "from semester"
    }

    teaches {
        person_id int PK, FK "from teacher"
        subject_id int PK, FK "from subject"
    }

    course ||--o{ course_date: ""
    course }o--|| teacher: ""
    teacher }o--|| room: ""
    course }o--|| room: ""
    subject ||--o{ course: ""
    teacher |o--|| person: ""
    teacher |o--o{ teacher: ""
    student |o--|| person: ""
    semester ||--o{ course_date: ""
    student ||--o{ studies: ""
    course ||--o{ studies: ""
    semester ||--o{ studies: ""
    teacher ||--|{ teaches: ""
    subject ||--|{ teaches: ""
```
