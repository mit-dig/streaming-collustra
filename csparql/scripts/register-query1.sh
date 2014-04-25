curl -X PUT http://localhost:8175/queries/0i1ml -d 'REGISTER STREAM 0i1ml AS
  PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
  PREFIX sioc: <http://rdfs.org/sioc/ns#>
  PREFIX dbp: <http://dbpedia.org/property/place> 
  CONSTRUCT { ?post a sioc:MicroblogPost; sioc:attachment ?attachment; sioc:description ?desc; sioc:title ?title; dbp:place ?place . :uuid :is "zzz" .
  } 
  FROM STREAM <http://ex.org/fs> [RANGE 1m STEP 10s]
  WHERE { ?post a sioc:MicroblogPost; sioc:attachment ?attachment; sioc:description ?desc; sioc:title ?title; dbp:place ?place.
  }'