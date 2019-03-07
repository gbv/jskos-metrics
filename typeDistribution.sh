#!/bin/bash

. arguments.sh

cat $FILE | jq -r .type[] | sort | uniq -c | sort -n
