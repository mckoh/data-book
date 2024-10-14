# MegaTutorium: Graphenartige Datenstrukturen mit Neo4J/Cypher

Unsere Aufgabe in diesem Megatutorium ist es, (a) ein **Datenmodell** aus dem unterhalb angeführten Szenario zu entwickeln, (b) dieses so weit wie nötig zu **normalisieren**, (c) es anschließend in MariaDB zu **implementieren**, (d) **Beispieldatensätze** einzufügen und (e) die unten genannten **Abfragen** zu entwickeln.

## Szenario

Bonnie arbeitet seit 15.01.2017 für die Verkaufsabteilung und bekommt eine jährliche Bonuszahlung von 2500. Sie interagiert regelmäßig mit Jack, der sowohl für die Marketing-, als auch für die Service-Abteilung arbeitet. Jack ist am 21.12.1979 geboren und erhält einen jährlichen Bonus von 3200.

## Aufgaben

Unterhalb findet ihr, aufbauend auf das oben beschriebene Szenario, die Aufgaben, die wir im Zuge des Mega Tutorials bearbeiten sollen. Im Mega Tutorial machen wir das zusammen.

### Graphen erzeugen

* Erstellt ein Graphen-Modell, um das oben beschriebene Szenario abzubilden.
* Implementiert diesen Graphen mit Hilfe von Cypher in Neo4J.
* Optional: Versucht das beschriebene Szenario als relationale Struktur abzubilden.

### Daten abfragen

Entwickelt mit Hilfe von SQL (DQL) Lösungen, um folgenden Problemstellungen zu bearbeiten. Ihr könnt euch hierzu ein [fertiges Beispiel](../downloads/persons.cql) der Datenbank inklusive Daten herunterladen.

* Die HR-Abteilung benötigt eine Liste aller Mitarbeiter:innen.
* Die HR-Abteilung benötigt eine Liste der Namen aller Mitarbeiter:innen, für die ein Ge-burtsdatum erfasst wurde.
* Die HR-Abteilung benötigt eine Liste aller Personen, deren jährlicher Bonus zwischen EUR 2000,- und EUR 3000,- liegt.
* Die HR-Abteilung benötigt eine Liste aller Personen, für deren Beschäftigung eine Startdatum hinterlegt wurde.
* Die HR-Abteilung benötigt eine Liste aller Personen, die Personen Interagieren, welche für die Marketing-Abteilung arbeiten.
* Die HR-Abteilung benötigt eine Liste aller Personen, die nicht für Marketing arbeiten und mit einer Person aus Marketing interagieren.
* Die HR Abteilung benötigt eine Liste Aller Personen, die mit jemandem Interagieren, der/die mit jemandem aus der Marketingabteilung interagiert.
* Die HR-Abteilung möchte die Anzahl der Personen, die von der vorherigen Abfrage betroffen sind.
* Die Sales Abteilung möchte die Summe der jährlichen Bonus-Zahlungen aller ihrer Mitarbeiter:innen.
* Die HR Abteilung will eine Liste aller Departments je Person haben.
* Die Verkaufsabteilung will eine Liste aller Entitäten, die mit Personen namens "Jack" in irgendeiner Beziehung stehen, die ihrerseits mit der Service-Abteilung in irgendeiner Beziehung stehen.
