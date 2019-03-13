#!/bin/bash
# Main-Skript

DIR=$(dirname "$(readlink -f "$0")")

. $DIR/arguments.sh

echo "<< Anzahl der Konzepte >>"
. $DIR/conceptNumber.sh

#echo "<< Anzahl der Beziehungen >>"
#. relationNumber.sh

echo "<< Broader-Verteilung >>"
. $DIR/broaderDistribution.sh

echo "<< Narrower-Verteilung >>"
. $DIR/narrowerDistribution.sh

echo "<< Narrower-Verteilung-Implizit >>"
. $DIR/narrowerDistributionImplicit.sh

echo "<< Top-Konzepte >>"
. $DIR/topConceptOf.sh

echo "<< Typ-Verteilung >>"
. $DIR/typeDistribution.sh
