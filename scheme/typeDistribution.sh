#!/bin/bash

jq -r ".type[]?" "$1" | sort | uniq -c | sort -n
