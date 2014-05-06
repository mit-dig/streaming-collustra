curl -X PUT http://localhost:8175/queries/q12 -d 'REGISTER QUERY q12 AS 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
 
SELECT ?X ?Y
FROM STREAM <http://ex.org/gcm> [RANGE 10s STEP 2s]
WHERE
{?X rdf:type ub:Chair .
  ?Y rdf:type ub:Department .
  ?X ub:worksFor ?Y .
  ?Y ub:subOrganizationOf <http://www.University0.edu>}'
