#!/bin/bash

cat $FILE | jq -r .type[] | sort | uniq -c | sort -n
