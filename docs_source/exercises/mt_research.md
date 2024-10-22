# MegaTutorium: Research Datenbank

Unsere Aufgabe in diesem Megatutorium ist es, (a) ein **Datenmodell** aus dem unterhalb angeführten Szenario zu entwickeln, (b) dieses so weit wie nötig zu **normalisieren**, (c) es anschließend in MariaDB zu **implementieren**, (d) **Beispieldatensätze** einzufügen und (e) die unten genannten **Abfragen** zu entwickeln.

## Szenario

Für die Erfassung von Wissenschaftlichen Proben in einem Forschungslabor solle ine Datenbank erstellt werden. Proben werden an einer bestimmten Stelle und zu einer bestimmten Zeit genommen und im System erfasst. Später können Sie mehrfach analysiert werden. Die Analyse erfolgt von unterschiedlichen Wissenschaftler:innen, die einer Forschungsinstitution und einer Forschungseinheit zugeordnet sind und von denen Name und Emailadresse erfasst werden soll. Die Analyse der Proben erfolgt mit Hilfe unterschiedlicher Analyseverfahren und wird ebenfalls protokolliert. Je nach Analyseverfahren ist die Freigabe durch unterschiedliche Personen des administrativen Personals erforderlich. Auch über für das administrative Personal sind Name und Emailadresse zu erfassen.

## Aufgaben

Unterhalb findet ihr, aufbauend auf das oben beschriebene Szenario, die Aufgaben, die wir im Zuge des Mega Tutorials bearbeiten sollen. Im Mega Tutorial machen wir das zusammen.

### Datenstruktur erzeugen

* Erstellt ein Datenmodell, um das oben beschriebene Szenario relational abzubilden.
* Implementiert das Datenmodell mit Hilfe von SQL (DDL) auf einem relationalen Datenbanksystem (wir werden MariaDB nutzen).

### Daten einfügen

Füllt mit Hilfe von SQL (DML) eure frisch implementierte Datenbank mit Beispieldatensätzen.

### Daten abfragen

Entwickelt mit Hilfe von SQL (DQL) Lösungen, um folgenden Problemstellungen zu bearbeiten. Ihr könnt euch hierzu ein [fertiges Beispiel](../downloads/research_mit_daten.sql) der Datenbank inklusive Daten herunterladen.

* Die Institutsleitung möchte eine Liste aller erfassten Proben.
* Die Institutsleitung möchte alle Daten zur Probe mit der ID 1.
* Ein Fördergeber will eine Liste aller durchgeführten Analyse inklusiver zugeordneter Forscher:innen.
* Ein Fördergeber will eine Liste alle Proben und der Forschungsmethoden, die darauf angewendet wurden.
* Die Institutsleitung möchte eine Liste aller Proben, die nie analysiert worden sind.
* Die Geschäftsführung möchte eine Liste aller Analysen, die im Jahr 2020 durchgeführt worden sind.
* Die Geschäftsführung möchte eine Liste aller Proben, deren Entnahmemenge größer war, als die durchschnittliche Entnahmemenge in 2020.
* Die akademische Leitung möchte eine Liste aller Proben und deren Abhängigkeiten zu anderen Proben. Diese Darstellung sollte auch die hierarchische Beziehung der Proben zueinander abbilden.
* …
