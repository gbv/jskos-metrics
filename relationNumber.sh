#!/bin/bash
# Liest eine .ndjson-Datei ein. 
# Anzahl der broader-Inhalte werden ermittelt und nach URI hin aufgelöst, (json-Objekte fallen weg).
# Die Ergebnisse werden zusammengezählt. Die Ergebnisse werden sortiert. 

. arguments.sh

cat $FILE | jq -r .broader[].uri | sort | uniq -c | sort -n 


