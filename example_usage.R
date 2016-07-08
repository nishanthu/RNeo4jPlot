library(RNeo4j)

graph = startGraph("http://localhost:7474/db/data/")
graph$version

clear(graph)

## Toy example...
difficulty <- c('easy'=-1,'med'=0,'hard'=1)
strength <- c('weak'=-1,'med'=0,'strong'=1)
s1 = createNode(graph, "TLO", id="s1", diff=unname(difficulty['easy']))
s2 = createNode(graph, "TLO", id="s2", diff=unname(difficulty['easy']))
s3 = createNode(graph, "TLO", id="s3", diff=unname(difficulty['med']))
s4 = createNode(graph, "TLO", id="s4", diff=unname(difficulty['med']))
s5 = createNode(graph, "TLO", id="s5", diff=unname(difficulty['hard']))

createRel(s1, "PREREQ_OF", s2, stren=unname(strength['strong']))
createRel(s1, "PREREQ_OF", s3, stren=unname(strength['weak']))
createRel(s2, "PREREQ_OF", s4, stren=unname(strength['med']))
createRel(s2, "PREREQ_OF", s5, stren=unname(strength['strong']))
createRel(s3, "PREREQ_OF", s5, stren=unname(strength['weak']))

Neo4j.Plot(graph, "id", "stren")

