#!/bin/bash

jq -r '.entry[].resource.resourceType' $* \
  | sort \
  | uniq -c \
  | awk 'BEGIN {print "## Ressourcen\n\n| Ressourcen | Anzahl |\n| -- |--------|"} {printf "| %s | %d |\n", $2, $1}'

