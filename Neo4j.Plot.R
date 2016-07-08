Neo4j.Plot <- function(neo.graph.obj, node.label, edge.label) {
  library(igraph)

  query  = paste0("MATCH (n1)-[e]->(n2) RETURN n1.", node.label, ",n2.", node.label, ",e.", edge.label)

  gph.df = cypher(neo.graph.obj, query)
  
  #print(gph.df)
  
  igph = graph.data.frame(gph.df)
  
  gph.df$e.stren = sapply(gph.df$e.stren, function(x) names(strength[strength==x]))
  
  E(igph)$label = gph.df$e.stren

  x11();plot(igph)
}
