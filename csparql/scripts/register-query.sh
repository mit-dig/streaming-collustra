curl -X PUT http://localhost:8175/queries/IsInFs -d 'REGISTER STREAM IsInFs AS
  PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
  CONSTRUCT { ?person :isIn ?room } 
  FROM STREAM <http://ex.org/fs> [RANGE 1m STEP 10s]
  WHERE { ?person :posts [ :who ?person ; :where ?room ] .
  }'