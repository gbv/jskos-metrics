#!/bin/bash
# Main-Skript
# Zu untersuchende Dateien in den Ordner "Skripte" mitreinpacken !!!

. arguments.sh

echo "<< Anzahl der Konzepte >>"
. conceptNumber.sh

#echo "<< Anzahl der Beziehungen >>"
#. relationNumber.sh

echo "<< Broader-Verteilung >>"
. broaderDistribution.sh

echo "<< Narrower-Verteilung >>"
. narrowerDistribution.sh

echo "<< Narrower-Verteilung-Implizit >>"
. narrowerDistributionImplicit.sh

echo "<< Top-Konzepte >>"
. topConceptOf.sh

echo "<< Typ-Verteilung >>"
. typeDistribution.sh
