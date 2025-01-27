# Pfade für Quell- und Zieldatei definieren
$quellDatei = "C:\temp\SteffiTest\HardeningKitty\HardeningKitty0.9.3\hardeningkitty_log_14n020_finding_list_0x6d69636b_machine-20250127-143541.log"
$zielDatei = "C:\temp\SteffiTest\HardeningKitty\HardeningKitty0.9.3\mediumundlowalers.txt"

# Inhalt der Quelldatei lesen und filtern
$gefilterteZeilen = Get-Content $quellDatei | Where-Object { $_ -match "(High|Medium|Low)$" }

# Gefilterte Zeilen in die Zieldatei schreiben
$gefilterteZeilen | Set-Content $zielDatei

# Bestätigung ausgeben
Write-Host "Gefilterte Zeilen wurden in $zielDatei kopiert."