curl -X PUT http://localhost:8175/queries/categorycount -d 'REGISTER STREAM categorycount 
  PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
  PREFIX sioc: <http://rdfs.org/sioc/ns#>
  prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
  prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
 
CONSTRUCT {:uuid :is "zzz". ?place :hasCount (COUNT(?title))} 
  
FROM STREAM <http://ex.org/gcm> [RANGE 1m STEP 10s]
  WHERE { ?post a sioc:MicroblogPost; sioc:attachment ?attachment; sioc:description 
  ?desc; sioc:title ?title; :place ?place. FILTER (str(?place) = "Cambridge")}'