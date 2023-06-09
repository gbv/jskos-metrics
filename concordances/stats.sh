#!/usr/bin/bash

curl -s https://coli-conc.gbv.de/api/concordances | jq -c '.[]' > concordances.ndjson

echo "source,target,mappings" > concordances.csv
jq -r '[.fromScheme.uri,.toScheme.uri,.extent]|@csv' concordances.ndjson | sed 's/"//g' >> concordances.csv

csvsql --query 'SELECT source,target,SUM(mappings) AS mappings FROM concordances GROUP BY source, target ORDER BY mappings' \
    concordances.csv | sed 's/.0$//;1d' > sums.csv

jq -r '.fromScheme.uri,.toScheme.uri' concordances.ndjson | sort | uniq > schemes.csv

./matrix.pl > matrix.csv
