#!/bin/bash

NUMBER=`cat "$1" | wc -l`
UNIQ=`jq .uri "$1" | sort | uniq | wc -l`

if [ "$NUMBER" -ne "$UNIQ" ]; then
  echo "Found $NUMBER concepts but $UNIQ distinct URIs!" >&2
fi

echo $NUMBER
