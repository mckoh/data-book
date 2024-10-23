# MegaTutorium: Research Datenbank

Für die Erfassung von Wissenschaftlichen Proben in einem Forschungslabor solle ine Datenbank erstellt werden. Proben werden an einer bestimmten Stelle und zu einer bestimmten Zeit genommen und im System erfasst. Später können Sie mehrfach analysiert werden. Die Analyse erfolgt von unterschiedlichen Wissenschaftler:innen, die einer Forschungsinstitution und einer Forschungseinheit zugeordnet sind und von denen Name und Emailadresse erfasst werden soll. Die Analyse der Proben erfolgt mit Hilfe unterschiedlicher Analyseverfahren und wird ebenfalls protokolliert. Je nach Analyseverfahren ist die Freigabe durch unterschiedliche Personen des administrativen Personals erforderlich. Auch über für das administrative Personal sind Name und Emailadresse zu erfassen.

>**Note:** Im vorliegenden Modell wurden die Fremdschlüsselattribute in die Darstellung mitaufgenommen. Dies ist in der Crow's-Foot-Notation eigentlich nicht erforderlich. Die Darstellung wurde aber dennoch so gewählt, um Betrachtern das Nachvollziehen der Beziehungen - insbesondere der 1:1-Beziehungen - im Modell zu erleichtern.

```mermaid
erDiagram

    person {
        person_id int PK
        firstname varchar(50)
        lastname varchar(50)
        email varchar(50)
    }
    admin {
        person_id int PK, FK "from person"
        approval_level int
    }
    researcher {
        person_id int PK, FK "from person"
        research_topic varchar(40)
        research_group_id int FK "from research_group"
    }
    sample {
        sample_id int PK
        sampling_date date
        longitude decimal
        latitude decimal
        description varchar(max)
        storage_id int FK "from storage"
    }
    analysis {
        analysis_id int PK
        analysis_date date
        analysis_type_id int FK "from analysis_type"
        person_id int FK "from admin"
    }

    analysis_type {
        analysis_type_id int PK
        title varchar(50)
    }
    institute {
        institute_id int PK
        institute_name varchar(50)
        city varchar(50)
        zip varchar(15)
    }

    usage {
        sample_id int PK, FK "from sample"
        analysis_id int PK, FK "from analysis"
        amount decimal
    }

    participation {
        person_id int PK, FK "from researcher"
        analysis_id int PK, FK "from analysis"
    }

    research_group {
        research_group_id int PK
        group_name varchar(50)
        institute_id int FK "from institute"
    }

    storage {
        storage_id int PK
        name varchar(50)
    }

    researcher }o--o| research_group : ""
    research_group }o--o| institute : ""
    analysis_type ||--o{ analysis : ""

    researcher ||--o{ participation : ""
    participation }o--|| analysis : ""

    analysis ||--o{ usage : ""
    usage }o--|| sample : ""

    sample }o--|| storage : "comes from"
    person ||--o|  admin: ""
    person ||--o| researcher: ""
    analysis }o--|| admin: "approves"
```
