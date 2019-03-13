#!/bin/bash

cat $FILE | jq -c 'select(.topConceptOf|length > 0)' | wc -l
