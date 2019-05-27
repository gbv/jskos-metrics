#!/bin/bash

jq -c 'select(.topConceptOf|length > 0)' "$1" | wc -l
