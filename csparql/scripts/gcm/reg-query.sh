curl -X PUT http://localhost:8175/queries/test -d 'REGISTER QUERY test AS 
  PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
  PREFIX sioc: <http://rdfs.org/sioc/ns#>
  prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
  prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
 
  SELECT (COUNT(?topic) AS ?uuid)
  FROM STREAM <http://ex.org/gcm> [RANGE 10s STEP 2s]
  WHERE { ?post a sioc:MicroblogPost; sioc:attachment ?attachment; sioc:description ?desc; 
  sioc:topic ?topic; :place ?place. 
  FILTER (str(?place) = "Cambridge" && str(?topic) = "fire")}
  GROUP BY ?place 
  HAVING (COUNT(?topic) >= 3)'
