# musterdatenspende-diz
 
 
## Upload der Musterdaten in einen FHIR (Test-)Server
Die Musterdaten bundles enthalten typisch keine transaction bundles (sondern z.B. "type": "searchset")
Für den direkten import in einen FHIR Server ist/sind vorab transaction-bundles zu erzeugen.
Dazu sind die gezippten Ressourcen zu entpacken und zu transformieren.
Ein bash und jq basiertes Skript ist dem Repository beigelegt.
 
Anwendungsbeispiel für UKSH:

``` 
unzip UKSH/UKSH-2025-11-11.zip
bash bin/merge-bundles.sh UKSH-2025-11-11/*.json > transaction-bundle.json
```

## Referenzielle Integrität
Die Bundles sind typisch referenziell nicht integer. Eine Liste der nicht aufgelösten Referenzen in einem json Bundle kann z.B. so erzeugt werden:

```
bash bin/unresolved-references.sh transaction-bundle.json
```

Um das bundle dennoch hochzuladen ist die referenzielle Integrität im Server zu deaktivieren.

Beispiel für HAPI / docker-compose environment
`HAPI_FHIR_ENFORCE_REFERENTIAL_INTEGRITY_ON_WRITE=false` 

Alternativ sind die Ressourcen vorab zu ergänzen oder die nicht erfüllten Referenzen zu löschen oder die Ressourcen zu entfernen.

