curl -X PUT http://localhost:8175/queries/q4 -d 'REGISTER QUERY q4 AS 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>

SELECT ?X ?Y1 ?Y2 ?Y3
FROM STREAM <http://ex.org/gcm> [RANGE 10s STEP 2s]
WHERE
{?X rdf:type ub:Professor .
  ?X ub:worksFor <http://www.Department0.University0.edu> .
  ?X ub:name ?Y1 .
  ?X ub:emailAddress ?Y2 .
  ?X ub:telephone ?Y3}'

