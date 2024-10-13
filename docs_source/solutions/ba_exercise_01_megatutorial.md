# MegaTutorium: Relationales Datenmodell

Für Analysezwecke soll eine Datenbasis erstellt werden, in der Verkaufsvorgänge eines Handelsunternehmens abgebildet werden. In dieser Datenbasis sollen Verkaufsmitarbeiter:innen (inkl. Erfolgsprämien), Kund:innen und Bestellvorgänge erfasst werden. Jedem Bestellvorgang können Artikel (unterschiedlicher Kategorien und StückzahlenEine Online-Buchhandlung möchte ein Datenmodell entwickeln, um ihre Bestände und Kundenbestellungen zu verwalten. Die wichtigsten Datenobjekte sind Bücher, Autoren, Kunden, Bestellungen und Lieferanten. Jedes Buch hat Attribute wie ISBN, Titel, Preis und Verfügbarkeit. Autoren haben Namen und Biografien. Kundeninformationen umfassen Name, Adresse und Kontaktinformationen. Bestellungen enthalten Bestellnummer, Bestelldatum und bestellte Bücher. Lieferanten haben Namen und Kontaktinformationen.) mit Verkaufspreisen sowie ein(e) zuständige Mitarbeiter:in zugeordnet werden. Mitarbeiter:innen des Unternehmens sind in einer Mitarbeiter:innen-Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Mitarbeiter an welcher Stelle der Unternehmenshierarchie stehen.


``` mermaid
erDiagram

    author {
        author_id int PK
        firstname varchar(50)
        lastname varchar(45)
    }

    book {
        book_id int PK
        isbn_number varchar(45)
        title varchar(45)
        price decimal
        author_id int FK
    }

    order {
        int order_id PK
        date order_date
    }

    order_item {
        book_id int  PK
        order_id int PK
        int quantity
        decimal actual_price
    }

    delivery {
        delivery_id int PK
        delivery_date date
    }

    delivery_item {
        book_id int PK
        int quantity
    }

    person {
        person_id int PK
        firstname varchar(45)
        lastname varchar(45)
        email varchar(45)
        city varchar(45)
        zip varchar(10)
        street varchar(45)
        street_number varchar(10)
    }

    customer {
        customer_id int PK
        entry_date date
    }

    employee {
        employee_id int PK
        insurance_number varchar(15)
    }

    supplier {
        supplier_id int PK
        vat_number varchar(20)
    }

    book ||--o{ order_item : part_of
    order ||--o{ order_item : contains
    book ||--o{ delivery_item : part_of
    delivery ||--o{ delivery_item : contains
    author |o--o{ book : authors

    person ||--o| customer : is_a
    person ||--o| supplier : is_a
    person ||--o| employee : is_a

    order }o--|| customer : places
    order }o--|| employee : takes_care
    delivery }o--|| employee : orders
    delivery }o--o| supplier : sends

```
