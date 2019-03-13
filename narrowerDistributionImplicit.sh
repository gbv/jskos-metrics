#!/bin/bash
# Liest eine .ndjson-Datei ein. 
# Anzahl der broader-Inhalte werden ermittelt und nach URI hin aufgelöst, (json-
# Objekte fallen weg).
# Wie oft kommen wie viele Unterklassen vor 
 
cat $FILE | jq -r .broader[].uri 2> /dev/null | sort | uniq -c | sort -n \
  | awk '{print $1}' | sort | uniq -c | sort -n -k2


