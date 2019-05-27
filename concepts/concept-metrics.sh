#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")

if [ "$#" -ne 1 ]; then
  echo "Please provide exactely one argument"
  exit  
fi

FILE=$1

if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit
fi

function historows() {
  perl -lanE 'say "$l," if $l; $l="\"$F[1]\": $F[0]"; END {say $l}'
}

echo "{"

echo -n "\"conceptNumber\": "
$DIR/conceptNumber.sh "$FILE" 
echo ","

#echo "<< Anzahl der Beziehungen >>"
#. relationNumber.sh

echo "\"broaderDistribution\": {"
$DIR/broaderDistribution.sh "$FILE" | historows
echo "},"

echo "\"narrowerDistribution\": {"
$DIR/narrowerDistribution.sh "$FILE" | historows
echo "},"

echo "\"narrowerDistributionImplicit\": {"
$DIR/narrowerDistributionImplicit.sh "$FILE" | historows
echo "},"

echo -n "\"topConceptNumber\": "
$DIR/topConceptOf.sh "$FILE"
echo ","

echo -n "\"levelDistribution\": "
$DIR/levelDistribution.pl "$FILE" <(jq -c '{uri,broader}' "$FILE")
echo ","

echo "\"typesDistribution\": {"
$DIR/typeDistribution.sh "$FILE" | historows
echo "}"

echo "}"
