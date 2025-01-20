// Szenario: Bonnie arbeitet seit 15.01.2017 für die Verkaufsabteilung und bekommt eine jährliche Bonuszahlung von 2500. Sie interagiert regelmäßig mit Jack, der sowohl für die Marketing-, als auch für die Service-Abteilung arbeitet. Jack ist am 21.12.1979 geboren und erhält einen jährlichen Bonus von 3200.

CREATE (j:Person {name:"Jack", bonus:3200, gebdatum:"1979-12-21"})
CREATE (b:Person {name:"Bonnie", bonus:2500})
CREATE (m:Abteilung {name:"Marketing"})
CREATE (v:Abteilung {name:"Verkauf"})
CREATE (s:Abteilung {name:"Service"})
CREATE (u:Unternehmen {name:"ABCom"})

CREATE (j)-[r1:WorksFor]->(m)
CREATE (j)-[r2:WorksFor]->(s)
CREATE (b)-[r3:WorksFor {since:"2017-01-15"}]->(v)

CREATE (m)-[:IsPartOf]->(u)
CREATE (v)-[:IsPartOf]->(u)<-[:IsPartOf]-(s)

CREATE (j)-[:Interacts]->(b)-[:Interacts]->(j)
