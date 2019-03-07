#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Bitte nur ein Argument angeben"
  exit  
fi

FILE=$1

if [ ! -f "$FILE" ]; then
  echo "Datei '$FILE' existiert nicht"
  exit
fi
