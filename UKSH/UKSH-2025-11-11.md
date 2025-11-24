# Musterdatenspende des UKSH

| Standort | UKSH, Universitätsklinikum Schleswig-Holstein |
| -- | -- |
| Urheber (gem. CC BY-SA 4.0) | UKSH |
| Zeit  zu der dieser Datensatz gültig ware | 2025-11-11 |
| Zeit  der Übermittlung | 2025-11-11 |
| Quelle der Musterdaten | Export von bekannten Testpatienten die im produktiven KIS existieren |
| FHIR Aufbereitung | Roh (wie im DIZ abgelegt) |
| Inhaltliche Veränderungen | keine |
| Bekannte Defekte im FHIR | Nur die ambulanten Fälle aus dem Altdatenexport sind geschlossen, alle anderen werden behalten den Status offen.  |
| KDS-Module | <ul><li>KDS_Person</li><li>KDS_Fall</li><li>KDS_Prozedur</li><li>KDS_Diagnose</li><li>KDS_Labor</li><li>KDS_Consent</li><li>KDS_Intensivmedizin (Körpertemperatur, Pulsoxy, Arterieller Blutdruck, Herzfrequenz, Körpergröße, Körpergewicht)</li></ul> |
| Format  | Zip mit 272 Bundles, type "searchset", eines pro Patient, im JSON Format <br> *Einige Referenzen sind nicht aufgelöst*|



## Ressourcen 

| Ressourcen | Anzahl
| -- | -- |
| Condition	| 437 | 
| Consent	| 5 | 
| DiagnosticReport	| 1283 | 
| Encounter	| 1389 | 
| Location	| 63 | 
| Observation	| 3535 | 
| Patient	| 271 | 
| Procedure	| 180 | 
| ServiceRequest | 1283 | 

