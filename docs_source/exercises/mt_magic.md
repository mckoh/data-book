# MegaTutorium: Hogwarts Datenbank

Unsere Aufgabe in diesem Megatutorium ist es, (a) ein **Datenmodell** aus dem unterhalb angeführten Szenario zu entwickeln, (b) dieses so weit wie nötig zu **normalisieren**, (c) es anschließend in MariaDB zu **implementieren**, (d) **Beispieldatensätze** einzufügen und (e) die unten genannten **Abfragen** zu entwickeln.

## Szenario

Für Dokumentationszwecke soll für die Zaubereischule von Hogwarts eine Datenbank erstellt werden, in der alle Aspekte der magischen Welt erfasst werden können. In dieser Datenbasis sollen Schüler (inkl. ihrer Häuser), Lehrer, Unterrichtsfächer, Unerrichtszeiten, Räume und Zaubersprüche erfasst werden. Jedes Fach findet in Hogwarts immer im selben Raum statt. Außerdem ist der Stundenplan für jedes Semester fixiert - Fächer finden also während eines Semesters immer zur selben Zeit am selben Tag statt. Jedem Schüler können Fächer mit zuständigen Lehrern zugeordnet werden. Lehrer von Hogwarts sind in einer Hierarchie eingebettet – für die Analyse ist es wichtig zu wissen, welche Lehrer an welcher Stelle der Schulhierarchie stehen. Jeder Lehrer unterrichtet mehrere Fächer. Jedes Fach ist aber genau einem Lehrer zugeordnet. Diese Zuordnung kann sich aber über die Zeit hin ändern.

## Aufgaben

Unterhalb findet ihr, aufbauend auf das oben beschriebene Szenario, die Aufgaben, die wir im Zuge des Mega Tutorials bearbeiten sollen. Im Mega Tutorial machen wir das zusammen.

### Datenstruktur erzeugen

* Erstellt ein Datenmodell, um das oben beschriebene Szenario relational abzubilden.
* Implementiert das Datenmodell mit Hilfe von SQL (DDL) auf einem relationalen Datenbanksystem (wir werden MariaDB nutzen).

### Daten einfügen

Füllt mit Hilfe von SQL (DML) eure frisch implementierte Datenbank mit Beispieldatensätzen.
