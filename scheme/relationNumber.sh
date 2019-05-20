#!/bin/bash
# Liest eine .ndjson-Datei ein. 
# Anzahl der broader-Inhalte werden ermittelt und nach URI hin aufgelöst, (json-Objekte fallen weg).
# Die Ergebnisse werden zusammengezählt. Die Ergebnisse werden sortiert. 

jq -r .broader[].uri "$1" | sort | uniq -c | sort -n 
