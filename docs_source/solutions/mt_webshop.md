# MegaTutorium: Webshop Datenbank

Es soll eine Datenbank erstellt werden, in der Verkaufsvorgänge eines Handelsunternehmens abgebildet werden. In dieser Datenbasis sollen Verkaufsmitarbeiter:innen, Kund:innen und Bestellvorgänge erfasst werden. Jedem Bestellvorgang können Artikel (unterschiedlicher Kategorien und Stückzahlen) mit Verkaufspreisen sowie ein(e) zuständige Mitarbeiter:in zugeordnet werden. Mitarbeiter:innen des Unternehmens sind in einer Mitarbeiter:innen-Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Mitarbeiter an welcher Stelle der Unternehmenshierarchie stehen. Einmal im Jahr erhalten die Verkaufsmitarbeiter:innen eine Erfolgsprämie. Die Höher dieser Prämie wird beim Einstellungsgespräch verhandelt und festgelegt und ändert sich dann nicht mehr.

>**Note:** Im vorliegenden Modell wurden die Fremdschlüsselattribute in die Darstellung mitaufgenommen. Dies ist in der Crow's-Foot-Notation eigentlich nicht erforderlich. Die Darstellung wurde aber dennoch so gewählt, um Betrachtern das Nachvollziehen der Beziehungen - insbesondere der 1:1-Beziehungen - im Modell zu erleichtern.

```mermaid
erDiagram

    person {
        person_id int PK
        firstname varchar(50)
        lastname varchar(50)
        email varchar(50)
    }

    employee {
        person_id int PK, FK "from person"
        bonus int
        boss_id int FK "from employee"
    }

    customer {
        person_id int PK, FK "from person"
        customer_since date
    }

    order {
        order_id int PK
        order_date date
    }

    order_detail {
        order_id int PK, FK "from order"
        product_id int PK, FK "from product"
        quantity int
        sales_price decimal "will be copied from product.price on order date"
    }

    product {
        product_id int PK
        name varchar(50)
        price decimal "current price"
        width decimal "for packaging"
        heigth decimal "for packaging"
        debth decimal "for packaging"
        category_id int FK "from category"
    }

    category {
        category_id int PK
        name varchar(50)
    }

    person ||--o| customer: ""
    person ||--o| employee: ""
    employee }o--o| employee: ""
    order }o--|| employee: ""
    order }o--|| customer: ""
    order ||--o{ order_detail: ""
    product ||--o{ order_detail: ""
    product }o--|| category: ""

```
