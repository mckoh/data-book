# Checkliste zum Erstellen von Datenstrukturen

Wie besprochen habe ich euch unterhalb noch einmal die wichtigsten Arbeitsschritte bei der Entwicklung eines Datenschemas aufgelistet. Die Schritte folgen unserem Vorgehen im Lab. Nicht alle Schritte müssen auch immer zwingen passieren (so haben wir z.B. Schritt 6 in unserem Mega-Tutorium ausgelassen). Ziel dieses Vorgehens ist es, für ein bestimmtes Szenario ein Datenmodell zu entwickeln und dieses anschließend auf einem DBS zu implementieren.

1. Identifikation aller Objekte über die Daten erfasst werden sollen (Entitätstypen)
2. Benennen aller Entitätstypen (möglichst sprechende Namen verwenden)
3. Anlegen aller Entitätstypen im Datenmodell (ein Kästchen für jeden Entitätstyp)
4. Identifikation aller Beziehungen zwischen diesen Entitätstypen und Einzeichnen im Modell
5. Festlegen der Kardinalitäten für beide Seiten jeder Beziehung

>**Kardinalität**: Beschreibt wieviele Entitäten des einen Entitätstyps höchstens an einer Beziehung beteiligt sind und kann die Werte 1 oder N annehmen. Beim Festlegen der Kardinalitäten kann eine einfache Mengendarstellung helfen, um alle möglichen Ausprägungen durchzuspielen.

> Die Kardinalitäten einer Beziehung geben Aufschluss über den jeweiligen **Bezieungstyp**. Je nachdem, welche Kardinalitäten eine Beziehung umfasst, unterscheiden wir (a) 1:1-Beziehungen, (b) 1:n-Beziehungen und (c) n:m-Beziehungen.

6. Festlegen der Konditionalitäten für beide Seiten jeder Beziehung

>**Konditionalität**: Beschreibt wieviele Entitäten des einen Entitätstyps mindestens an einer Beziehung beteiligt sein müssen und kann die Werte 0 oder 1 annehmen.

7. Festlegen der notwendigen Attribute je Entitätstyp (Primärschlüsselattribute, Fremdschlüsselattribute, sonstige)
1. Überführen aller n:m-Beziehungen in ihre "aufgelöste" Form. Dazu wird für jede n:m-Beziehung eine Auflösungtabelle erstellt (z.B. Bestellposition im Datenmodell oben).
1. Überführen des Datenmodells in die Data Definition Language des ausgewählten Datenbanksystems. 

>Für die Implementierung bietet es sich an, eine klare Nomenklatur für Primär- und Fremdschlüssel zu verwenden und diese konsequent durch zu ziehen.
