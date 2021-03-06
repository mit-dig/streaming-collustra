curl -X PUT http://localhost:8175/queries/test -d 'REGISTER STREAM test AS
  PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
  PREFIX sioc: <http://rdfs.org/sioc/ns#>
  prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
  prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
  PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
 
  CONSTRUCT {:uuid :is "zzz". ?post a sioc:MicroblogPost; sioc:attachment ?attachment; sioc:description ?desc; sioc:title ?title; geo:lat ?lat; geo:long ?long.  } 
  FROM STREAM <http://ex.org/gcm> [RANGE 1m STEP 10s]
  WHERE { ?post a sioc:MicroblogPost; sioc:attachment ?attachment; sioc:description ?desc; sioc:title ?title; geo:lat ?lat; geo:long ?long.  FILTER( ( ((?lat-42.36208)*(?lat-42.36208)) < 0.01*0.01) ) FILTER( ( ((?long--71.09071)*(?long--71.09071)) < 0.01*0.01) )}'

