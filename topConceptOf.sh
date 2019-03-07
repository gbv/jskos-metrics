#!/bin/bash

. arguments.sh

cat $FILE | jq -c 'select(.topConceptOf|length > 0)' | wc -l
