
*************
Collustra Setup
*************

TBD



*************

CSPARQL Setup
*************


------------ Foursquare IsIn example ------------

Example that checks who is in each room using “Foursquare” check-in actions

1 - Stream registration:

PUT http://localhost:8175/streams/http%3A%2F%2Fex.org%2Ffs

2 - Query registration

PUT http://localhost:8175/queries/IsInFs

HTTP PUT body parameter:

  REGISTER STREAM IsInFs AS
  PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
  CONSTRUCT { ?person :isIn ?room } 
  FROM STREAM <http://ex.org/fs> [RANGE 1m STEP 10s]
  WHERE { ?person :posts [ :who ?person ; :where ?room ] .
  }

3 - Observer Registration for previous query

POST http://localhost:8175/queries/IsInFs

HTTP POST body parameter:

  http://localhost:8177/http2sysout

4 - Feed the previous stream  

POST http://localhost:8175/streams/http%3A%2F%2Fex.org%2Ffs

HTTP POST body parameter:

  @prefix : <http://streamreasoning.org/ontologies/sr4ld2013-onto#> .
  :Bob :posts [ :who :Bob ; :where :BlueRoom ] .

  


------------ Facebook IsWith exercise ------------

Example that checks who is together using “Facebook” post

1 - Stream registration:

PUT http://localhost:8175/streams/http%3A%2F%2Fex.org%2Ffb

2 - Query registration

PUT http://localhost:8175/queries/isWithFb

HTTP PUT body parameter:

REGISTER STREAM isWithFb AS
PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
CONSTRUCT { ?person1 :isWith ?person } 
FROM STREAM <http://ex.org/fb> [RANGE 1m STEP 10s]
WHERE { ?person1 :posts [ :who ?person1, ?person ] .
FILTER (?person1!=?person)
}

3 - Observer Registration for previous query

POST http://localhost:8175/queries/isWithFb

HTTP POST body parameter:

  http://localhost:8176/http2sysout

4 - Feed the previuos stream  

POST http://localhost:8175/streams/http%3A%2F%2Fex.org%2Ffb

HTTP POST body parameter:

  @prefix : <http://streamreasoning.org/ontologies/sr4ld2013-onto#> .
  :Carl :posts [ :who :Carl , :Bob ] .




------------ IsInWith example ------------

Example that checks who are in each room together using the stream produced by previous queries

1 - Query registration

PUT http://localhost:8175/queries/isInWithQuery

HTTP PUT body parameter:

REGISTER STREAM isInWithQuery AS
PREFIX : <http://streamreasoning.org/ontologies/sr4ld2013-onto#>
CONSTRUCT { ?person :isIn ?room } 
FROM STREAM <http://localhost:8175/streams/IsInFs> [RANGE 1m STEP 10s]
FROM STREAM <http://localhost:8175/streams/isWithFb> [RANGE 1m STEP 10s]
WHERE { { ?person :isWith ?person1 .
?person1 :isIn ?room . 
FILTER (?person1!=?person)  }
}

2 - Observer Rregistration for previous query

POST http://localhost:8175/queries/isWithFb

HTTP POST body parameter:

  http://localhost:8177/http2sysout

3 - Feed the previuos streams  

POST http://localhost:8175/streams/http%3A%2F%2Fex.org%2Ffs

HTTP POST body parameter:

  @prefix : <http://streamreasoning.org/ontologies/sr4ld2013-onto#> .
  :Bob :posts [ :who :Bob ; :where :BlueRoom ] .

POST http://localhost:8175/streams/http%3A%2F%2Fex.org%2Ffb

HTTP POST body parameter:

  @prefix : <http://streamreasoning.org/ontologies/sr4ld2013-onto#> .
  :Carl :posts [ :who :Carl , :Bob ] .
