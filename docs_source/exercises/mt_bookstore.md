# MegaTutorium: Relationales Datenmodell

Unsere Aufgabe in diesem Megatutorium ist es, (a) ein **Datenmodell** aus dem unterhalb angeführten Szenario zu entwickeln, (b) dieses so weit wie nötig zu **normalisieren**, (c) es anschließend in MariaDB zu **implementieren**, (d) **Beispieldatensätze** einzufügen und (e) die unten genannten **Abfragen** zu entwickeln.

## Szenario

Eine Online-Buchhandlung möchte ein Datenmodell entwickeln, um ihre Bestände und Kundenbestellungen zu verwalten. Die wichtigsten Datenobjekte sind Bücher, Autoren, Kunden, Bestellungen und Lieferanten. Jedes Buch hat Attribute wie ISBN, Titel, Preis und Verfügbarkeit. Autoren haben Namen und Biografien. Kundeninformationen umfassen Name, Adresse und Kontaktinformationen. Bestellungen enthalten Bestellnummer, Bestelldatum und bestellte Bücher. Lieferanten haben Namen und Kontaktinformationen.) mit Verkaufspreisen sowie ein(e) zuständige Mitarbeiter:in zugeordnet werden. Mitarbeiter:innen des Unternehmens sind in einer Mitarbeiter:innen-Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Mitarbeiter an welcher Stelle der Unternehmenshierarchie stehen.

## Aufgaben

Unterhalb findet ihr, aufbauend auf das oben beschriebene Szenario, die Aufgaben, die wir im Zuge des Mega Tutorials bearbeiten sollen. Im Mega Tutorial machen wir das zusammen.

### Datenstruktur erzeugen

1. Identifiziert alle Entitätstypen, die ihr für dieses Szenario benötigt.
1. Identifiziert alle Beziehungen zwischen den gefundenen Entitätstypen.
1. Bestimmt die Kardinalitäten der oben identifizierten Beziehungen.
1. Bestimmt die Konditionalitäten der identifizierten Beziehungen.
1. Erstellt ein Datenmodell, um das oben beschriebene Szenario relational abzubilden.
1. Implementiert das Datenmodell mit Hilfe von SQL (DDL) auf einem relationalen Datenbanksystem (wir werden MariaDB nutzen).

### Daten einfügen

Füllt mit Hilfe von SQL (DML) eure frisch implementierte Datenbank mit Beispieldatensätzen.

### Daten abfragen

Entwickelt mit Hilfe von SQL (DQL) Lösungen, um folgenden Problemstellungen zu bearbeiten. Ihr könnt euch hierzu ein [fertiges Beispiel](../downloads/ba_exercise_01.sql) der Datenbank inklusive Daten herunterladen.

* Die Geschäftsführung möchte eine Liste aller Bücher
* Die Geschäftsführung möchte eine Liste aller Bücher im Bestand, die aktuell verfügbar sind.
* Die Geschäftsführung möchte eine Liste aller Bücher, beschränkt auf deren Titel uns ISBN.
* Die Verkaufsleitung möchte eine Liste aller Bücher vom Autor mit der Autorennummer 2.
* Die Verkaufsleitung möchte einer Liste aller jemals verkauften Bücher.
* Die Verkaufsleitung möchte eine Liste aller Bücher, die im letzten Jahr verkauft wurden.
* Die Verkaufsleitung möchte eine Liste aller unverkauften Bücher.
