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
. $DIR/conceptNumber.sh 
echo ","

#echo "<< Anzahl der Beziehungen >>"
#. relationNumber.sh

echo "\"broaderDistribution\": {"
. $DIR/broaderDistribution.sh | historows
echo "},"

echo "\"narrowerDistribution\": {"
. $DIR/narrowerDistribution.sh | historows
echo "},"

echo "\"narrowerDistributionImplicit\": {"
. $DIR/narrowerDistributionImplicit.sh | historows
echo "},"

echo -n "\"topConceptNumber\": "
. $DIR/topConceptOf.sh
echo ","

echo -n "\"levelDistribution\": "
$DIR/levelDistribution.pl <(jq -c '{uri,broader}' "$FILE")
echo ","

echo "\"typesDistribution\": {"
. $DIR/typeDistribution.sh | historows
echo "}"

echo "}"
