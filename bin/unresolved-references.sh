#!/bin/bash

jq '[
  # 1. Alle vorhandenen Ressourcen-IDs im Bundle sammeln
  .entry[] | (.resource.resourceType + "/" + .resource.id)
] as $ids
|
[
  # 2. Alle Referenzen aus allen Ressourcen einsammeln
  .entry[]
  | .resource
  | .. | objects | .reference? 
  | select(. != null)
] as $refs
|
# 3. Nur die Referenzen behalten, die nicht im Bundle sind
($refs | unique) - $ids
' $1
