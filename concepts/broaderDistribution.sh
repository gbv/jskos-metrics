#!/bin/bash
# Liest eine .ndjson-Datei ein. 
# Anzahl der broader-Längen werden ermittelt (Bsp.:7 0 =7x leer 93 1 =93 mal mit Inhalt)
# Die Ergebnisse werden zusammengezählt. Die Ergebnisse werden sortiert.

jq -r ".broader|length" "$1" | sort | uniq -c | sort -n 

