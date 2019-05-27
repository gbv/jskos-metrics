#!/bin/bash
#Anwenden mit ~/Dokumente/kenom-mappings/stats/mappings.ndjson

FILE=$1

if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit
fi

function historows() {
  perl -lanE 'say "$l," if $l; $n=shift @F; $l="\"@F\": $n"; END {say $l}'
}

echo "{"

echo ""
echo "\"keys\": {"
jq -r 'keys[]' "$FILE" | sort | uniq -c | historows
echo "},"

echo ""
echo "\"fromSchemeDistribution\": {"
jq -r '.fromScheme.uri' $FILE | sort | uniq -c | historows
echo "},"

echo ""
echo "\"toSchemeDistribution\": {"
jq -r '.toScheme.uri' $FILE | sort | uniq -c | historows
echo "},"

echo ""
echo "\"typeDistribution\": {"
jq -r ".type[]?" $FILE | sort | uniq -c | historows
COUNT=$(jq -c 'select(.type|length<1)' $FILE | wc -l)
# echo "$COUNT null"
echo "},"

echo ""
echo "\"creatorNames\": {"
jq -r '.creator[]?.prefLabel|to_entries[].value' $FILE | sort | uniq -c | historows
echo "},"

echo ""
echo "\"creatorNumber\": {"
jq -r '.creator|length' $FILE | sort | uniq -c | historows
echo "},"

echo "" 
echo "\"createdPerDay\": {"
jq -r '.created[0:10]' $FILE | sort | uniq -c | historows
echo "},"

echo ""
echo "\"modifiedPerDay\": {"
jq -r '.modified[0:10]' $FILE | sort | uniq -c | historows
echo "},"

echo ""
echo "\"fromNumber\": {"
jq -r '.from.memberSet|length' $FILE | sort | uniq -c | historows
echo "},"

echo ""
echo "\"toNumber\": {"
jq -r '.to.memberSet|length' $FILE | sort | uniq -c | historows
echo "},"


echo ""
echo "\"fromConceptsCount\": "
jq '.from.memberSet[].uri' $FILE | sort | uniq -c | wc -l
echo ","

echo ""
echo "\"topConceptsCount\":"
jq -r '.to.memberSet[].uri' $FILE | sort | uniq -c | wc -l
echo ","

echo ""
echo "\"mappingURICount\":"
jq -r '.uri' $FILE | wc -l
echo ""

echo "}"
