# MegaTutorium: Relationales Datenmodell

Für Analysezwecke soll eine Datenbasis erstellt werden, in der Verkaufsvorgänge eines Handelsunternehmens abgebildet werden. In dieser Datenbasis sollen Verkaufsmitarbeiter:innen (inkl. Erfolgsprämien), Kund:innen und Bestellvorgänge erfasst werden. Jedem Bestellvorgang können Artikel (unterschiedlicher Kategorien und StückzahlenEine Online-Buchhandlung möchte ein Datenmodell entwickeln, um ihre Bestände und Kundenbestellungen zu verwalten. Die wichtigsten Datenobjekte sind Bücher, Autoren, Kunden, Bestellungen und Lieferanten. Jedes Buch hat Attribute wie ISBN, Titel, Preis und Verfügbarkeit. Autoren haben Namen und Biografien. Kundeninformationen umfassen Name, Adresse und Kontaktinformationen. Bestellungen enthalten Bestellnummer, Bestelldatum und bestellte Bücher. Lieferanten haben Namen und Kontaktinformationen.) mit Verkaufspreisen sowie ein(e) zuständige Mitarbeiter:in zugeordnet werden. Mitarbeiter:innen des Unternehmens sind in einer Mitarbeiter:innen-Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Mitarbeiter an welcher Stelle der Unternehmenshierarchie stehen.

## Simple Lösung

Hier eine schnelle Lösung, die alle Vorgaben des Szenarios berücksichtigt. In dieser Lösung gibt es noch etliche Probleme mit Redundanzen (z.B. würden wir eine Person zweimal anlegen, wenn sie bei uns als `employee`arbeitet und als `customer` einkauft). Abgesehen davon ist die Lösung schon ganz gut.

Der Bestand an Büchern ergibt sich dynamisch aus den Einkäufen (`delivery`) und den Verkäufen (`order`). Um zu ermitteln, wie viele Bücher eines bestimmten Buchs (z.B. des Buchs mit der ID 1) auf Lager liegen, kann folgende Abfrage verwendet werden.

```sql
select book_id, sum(a.quantity) as Verkauf, sum(c.quantity) as Einkauf
from order as a
join book as b on a.book_id = b.book_id
join delivery as c on c.book_id = b.book_id
where a.book_id = 1
group by book_id;
```

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
        quantity int
        actual_price decimal
    }

    delivery {
        delivery_id int PK
        delivery_date date
    }

    delivery_item {
        book_id int PK
        quantity int
        actual_price decimal
    }

    customer {
        customer_id int PK
        entry_date date
        firstname varchar(45)
        lastname varchar(45)
        email varchar(45)
        city varchar(45)
        zip varchar(10)
        street varchar(45)
        street_number varchar(10)
    }

    employee {
        employee_id int PK
        insurance_number varchar(15)
        firstname varchar(45)
        lastname varchar(45)
        email varchar(45)
        city varchar(45)
        zip varchar(10)
        street varchar(45)
        street_number varchar(10)
    }

    supplier {
        supplier_id int PK
        vat_number varchar(20)
        firstname varchar(45)
        lastname varchar(45)
        email varchar(45)
        city varchar(45)
        zip varchar(10)
        street varchar(45)
        street_number varchar(10)
    }

    book ||--o{ order_item : part_of
    order ||--o{ order_item : contains
    book ||--o{ delivery_item : part_of
    delivery ||--o{ delivery_item : contains
    author |o--o{ book : authors

    order }o--|| customer : places
    order }o--|| employee : takes_care
    delivery }o--|| employee : orders
    delivery }o--o| supplier : sends

```

## Erweiterte Lösung

In dieser Lösung wurde das Redundanzproblem bei der Erfassung von Personen gelöst. Dazu haben wir einen neuen Entitätstyp `person` eingeführt. Es gibt zwar immer noch einen Entitätstyp `customer` und einen Entitätstyp `employee`, aber diese Tabellen enthalten nur mehr die spezifischen Attribute. Alle personenbezogenen Attribute finden sich in der `person`.

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
        quantity int
        actual_price decimal
    }

    delivery {
        delivery_id int PK
        delivery_date date
    }

    delivery_item {
        book_id int PK
        quantity int
        actual_price decimal
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

## Optimierte Lösung

In dieser Lösung führen wir Bestandsänderungen in der Tabelle `inventory_change` und bilden so Zugänge (positive ``quantity`` Betrag) und Abgänge (negativer ``quantity`` Betrag) ab. Um den Bestand eines Buches zu ermitteln, müssen wir nur die Summe über alle Bestandsveränderungen für ein bestimmtes Buch bilden. Unterhalb findet ihr eine einfache SQL-Abfrage, um den Bestand von Buch 1 abzufragen. Außerdem wurde die Beziehung zwischen `book` und `author` in eine n:m-Beziehung überführt, weil es Bücher gibt, die von mehreren Autor:innen veröffentlicht werden.

Des Weiteren schaffen wir zwei Kind-Entitätstypen, die mit `inventory_change` zusammenhängen und dazu verwendet werden, einer `order` einen Kunden bzw. einem `delivery` einen Lieferanten zuzuordnen. Wir könnten `customer` und `supplier` natürlich auch direkt mit dem  `inventory_change` in Verbindung setzten, hätten dann aber das Problem, das eines der beiden Felder immer `NULL` wäre.

```sql
select book_id, sum(quantity) as Bestand
from inventory_change_item as a
where a.book_id = 1
group by book_id;
```

``` mermaid
erDiagram

    author {
        author_id int PK
    }

    publication {
        publishing_date date
    }

    book {
        book_id int PK
        isbn_number varchar(45)
        title varchar(45)
        price decimal
        author_id int FK
    }

    inventory_change {
        int inventory_change_id PK
        date date
    }

    inventory_change_item {
        book_id int  PK
        inventory_change_id int PK
        quantity int
        actual_price decimal
    }

    order {
        order_id int PK
    }

    delivery {
        delivery_id int PK
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
        birth_date date
    }

    supplier {
        supplier_id int PK
        vat_number varchar(20)
    }

    inventory_change ||--o| order : is_a
    inventory_change ||--o| delivery : is_a

    book ||--o{ inventory_change_item : part_of
    inventory_change ||--o{ inventory_change_item : contains
    author |o--o{ publication : contributes_to
    book |o--o{ publication : subject

    person ||--o| customer : is_a
    person ||--o| supplier : is_a
    person ||--o| employee : is_a
    person ||--o| author : is_a

    order }o--|| customer : places
    inventory_change }o--|| employee : takes_care
    delivery }o--o| supplier : sends

```
