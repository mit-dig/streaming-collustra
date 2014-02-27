curl -X PUT http://localhost:8175/queries/test -d 'REGISTER STREAM test AS
prefix sioc:    <http://rdfs.org/sioc/ns#> 
prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
prefix geo:     <http://www.w3.org/2003/01/geo/wgs84_pos#> 
prefix owl:     <http://www.w3.org/2002/07/owl#> 
prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix skos:    <http://www.w3.org/2004/02/skos/core#> 
PREFIX  xsd:    <http://www.w3.org/2001/XMLSchema#>
prefix :  <http://streamreasoning.org/ontologies/sr4ld2013-onto#> 
 
CONSTRUCT {:uuid :is "zzz". 
 			?post 	a sioc:MicroblogPost; 
 					sioc:attachment ?attachment; 
 					sioc:description ?desc; 
 					sioc:title ?title.
 			?location 	geo:lat ?lat; 
 						geo:long ?long .  } 
FROM STREAM <http://ex.org/gcm> [RANGE 1m STEP 10s]
WHERE { ?post 	a sioc:MicroblogPost; 
				sioc:attachment ?attachment; 
				sioc:description ?desc; 
				sioc:title ?title; 
				<http://hxl.humanitarianresponse.info/ns/#atLocation> ?location. 
		?location a geo:Point;
				geo:lat ?lat;
				geo:long ?long.

		FILTER ((?lat - 42.36206)*(?lat - 42.36206) < 0.01*0.01 ) 
		FILTER ((?long - -71.09033)*(?long - -71.09033) < 0.01*0.01)}'