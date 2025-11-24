# musterdatenspende-diz
 
 
## Upload der Musterdaten in einen FHIR (Test-)Server
Die Submission Verzeichnisse enthalten typisch keine transaction bundles.
Für den direkten import in einen FHIR Server ist/sind vorab transaction-bundles zu erzeugen.
Dazu sind die gezippten Ressourcen zu entpacken und zu transformieren.
Ein notwendiges Tool liegt in (bash und  jq basiert).
 
Beispiel für UKSH:

``` 
unzip UKSH/UKSH-2025-11-11.zip
bash bin/merge-bundles.sh UKSH-2025-11-11/*.json > transaction-bundle.json
```

## Referenzielle Integrität
Die Bundles sind typisch referenziell nicht integer - die referenzielle Integrität im Server ist zu deaktivieren.

Beispiel für HAPI / docker-compose environment
`HAPI_FHIR_ENFORCE_REFERENTIAL_INTEGRITY_ON_WRITE=false` 

Alternativ sind die Ressourcen vorab zu ergänzen oder die nicht erfüllten Referenzen zu löschen oder die Ressourcen zu entfernen.

