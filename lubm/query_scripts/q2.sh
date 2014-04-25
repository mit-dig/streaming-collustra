curl -X PUT http://localhost:8175/queries/q2 -d 'REGISTER QUERY q2 AS 
  PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
  PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
   
  SELECT ?X ?Y ?Z
  FROM STREAM <http://ex.org/gcm> [RANGE 10s STEP 2s]
  
WHERE
{?X rdf:type ub:GraduateStudent .
  ?Y rdf:type ub:University .
  ?Z rdf:type ub:Department .
  ?X ub:memberOf ?Z .
  ?Z ub:subOrganizationOf ?Y .
  ?X ub:undergraduateDegreeFrom ?Y}'
