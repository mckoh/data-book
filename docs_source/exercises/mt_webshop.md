# MegaTutorium: Webshop Datenbank

Unsere Aufgabe in diesem Megatutorium ist es, (a) ein **Datenmodell** aus dem unterhalb angeführten Szenario zu entwickeln, (b) dieses so weit wie nötig zu **normalisieren**, (c) es anschließend in MariaDB zu **implementieren**, (d) **Beispieldatensätze** einzufügen und (e) die unten genannten **Abfragen** zu entwickeln.

## Szenario

Es soll eine Datenbank erstellt werden, in der Verkaufsvorgänge eines Handelsunternehmens abgebildet werden. In dieser Datenbasis sollen Verkaufsmitarbeiter:innen, Kund:innen und Bestellvorgänge erfasst werden. Jedem Bestellvorgang können Artikel (unterschiedlicher Kategorien und Stückzahlen) mit Verkaufspreisen sowie ein(e) zuständige Mitarbeiter:in zugeordnet werden. Mitarbeiter:innen des Unternehmens sind in einer Mitarbeiter:innen-Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Mitarbeiter an welcher Stelle der Unternehmenshierarchie stehen. Einmal im Jahr erhalten die Verkaufsmitarbeiter:innen eine Erfolgsprämie. Die Höher dieser Prämie wird beim Einstellungsgespräch verhandelt und festgelegt und ändert sich dann nicht mehr.

## Aufgaben

Unterhalb findet ihr, aufbauend auf das oben beschriebene Szenario, die Aufgaben, die wir im Zuge des Mega Tutorials bearbeiten sollen. Im Mega Tutorial machen wir das zusammen.

### Datenstruktur erzeugen

* Erstellt ein Datenmodell, um das oben beschriebene Szenario relational abzubilden.
* Implementiert das Datenmodell mit Hilfe von SQL (DDL) auf einem relationalen Datenbanksystem (wir werden MariaDB nutzen).

### Daten einfügen

Füllt mit Hilfe von SQL (DML) eure frisch implementierte Datenbank mit Beispieldatensätzen.

### Daten abfragen

Entwickelt mit Hilfe von SQL (DQL) Lösungen, um folgenden Problemstellungen zu bearbeiten. Ihr könnt euch hierzu ein [fertiges Beispiel](../downloads/webshop_mit_daten.sql) der Datenbank inklusive Daten herunterladen.

* Die Verkaufsabteilung möchte eine Liste aller Kund:innen, ist aber nur an den natürlichen Attributen (z.B. Vorname, Nachname usw.) der Kund:innen interessiert.
* Die Serviceabteilung möchte alle Daten der Kundin mit der Kundennummer 1.
* Die Verkaufsabteilung möchte eine Liste aller Bestellungen inklusiver zuständiger Verkaufsmitarbeiter:in und bestellender Kund:in.
* Marketingabteilung möchte eine Liste aller Warenkörbe inklusive der enthaltenen Artikel.
* Die Verkaufsabteilung möchte eine Liste aller Artikel, die nie verkauft wurden bzw. die die niedrigste Verkaufszahl haben.
* Die Geschäftsführung möchte eine Liste aller Verkäufe des heurigen Jahres und deren Bestellsumme.
* Die Geschäftsführung möchte eine Liste aller Kunden, die Bestellungen getätigt haben, deren Bestellsumme über der Durchschnittlichen Bestellsumme in 2018 lagen.
* Die Personalabteilung möchte wissen, welche Mitarbeiter:innen in welchem Vorgesetzten/Untergeordneten-Verhältnis zueinanderstehen.
* …
