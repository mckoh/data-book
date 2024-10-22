# MegaTutorium: Research Datenbank

Für die Erfassung von Wissenschaftlichen Proben in einem Forschungslabor solle ine Datenbank erstellt werden. Proben werden an einer bestimmten Stelle und zu einer bestimmten Zeit genommen und im System erfasst. Später können Sie mehrfach analysiert werden. Die Analyse erfolgt von unterschiedlichen Wissenschaftler:innen, die einer Forschungsinstitution und einer Forschungseinheit zugeordnet sind und von denen Name und Emailadresse erfasst werden soll. Die Analyse der Proben erfolgt mit Hilfe unterschiedlicher Analyseverfahren und wird ebenfalls protokolliert. Je nach Analyseverfahren ist die Freigabe durch unterschiedliche Personen des administrativen Personals erforderlich. Auch über für das administrative Personal sind Name und Emailadresse zu erfassen.

```mermaid
erDiagram

    person {
        person_id int pk
        firstname varchar(50)
        lastname varchar(50)
        email varchar(50)
    }
    admin {
        admin_id int pk
        approval_level int
    }
    researcher {
        researcher_id int pk
        research_topic varchar(40)
    }
    sample {
        sample_id int pk
        sampling_date date
        longitude decimal
        latitude decimal
        description varchar(max)
    }
    analysis {
        analysis_id int pk
        analysis_date date
    }
    analysis_type {
        analysis_type_id int pk
        title varchar(50)
    }
    institute {
        institute_id int pk
        institute_name varchar(50)
        city varchar(50)
        zip varchar(15)
    }
    research_group {
        research_group_id int pk
        group_name varchar(50)
    }
    storage {
        storage_id int pk
        name varchar(50)
    }

    researcher }o--o| research_group : belongs_to
    research_group }o--o| institute : belongs_to
    analysis_type ||--o{ analysis : is_instance_of
    researcher }|--o{ analysis : is_responsible
    analysis }o--|{ sample : is_analysed
    sample }o--|| storage : stored_at
    person ||--o|  admin: is_a
    person ||--o| researcher: is_a
```
