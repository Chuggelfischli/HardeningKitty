# Pfade für Quell- und Zieldatei definieren
$currentPath = Get-Location
## Quelldatei einlesen - Log File welches die Auszuwertenden Alerts enthält
$source = Read-Host "Geben Sie die Quelldatei inkl. vollstaendigen Pfad an, ohne Anfuehrungszeichen"

$destination = "$currentPath\High_Medium_Low_Severity_Alerts.log"

# Inhalt der Quelldatei lesen und filtern
$getFilteredRows = Get-Content $source | Where-Object { $_ -match "(High|Medium|Low)$" }

# Gefilterte Zeilen in die Zieldatei schreiben
$getFilteredRows | Set-Content $destination

# Bestätigung ausgeben
Write-Host "Die gefilterte Zeilen wurden in $destination kopiert. Have a great Day ;D"
