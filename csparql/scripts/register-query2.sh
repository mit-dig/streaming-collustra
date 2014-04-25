curl -X PUT http://localhost:8175/queries/isWithFb -d 'REGISTER STREAM isWithFb AS
PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
CONSTRUCT { {?person1 :isWith ?person.} :uuid "zzz"} 
FROM STREAM <http://ex.org/fb> [RANGE 1m STEP 10s]
WHERE { ?person1 :posts [ :who ?person1, ?person ] .
FILTER (?person1!=?person)
}'