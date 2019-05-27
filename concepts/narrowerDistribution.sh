#!/bin/bash
# Liest eine .ndjson-Datei ein. 
# Anzahl der narrower-Längen werden ermittelt (Bsp.:12 1 =12x mit Unterklasse, 88 0 =88x ohne)
# Die Ergebnisse werden zusammengezählt. Die Ergebnisse werden sortiert.

jq -r ".narrower|length" "$1" | sort | uniq -c | sort -n 
