curl -X PUT http://localhost:8175/queries/q5 -d 'REGISTER QUERY q5 AS 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
 
SELECT ?X  
FROM STREAM <http://ex.org/gcm> [RANGE 10s STEP 2s]
WHERE
{?X rdf:type ub:Person .
  ?X ub:memberOf <http://www.Department0.University0.edu>}'


