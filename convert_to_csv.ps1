# Importieren des Excel-COM-Objekts
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Erstellen eines neuen Workbooks und Worksheets
$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Worksheets.Item(1)

# Pfad zur Logdatei
$logFilePath = Read-Host "Geben Sie die Quelldatei inkl. vollstaendigen Pfad an"
$logfile_name = Read-Host "Geben Sie den Dateinamen an"

# Lesen der Logdatei und Aufteilen der Einträge
$logContent = Get-Content $logFilePath
$row = 1

foreach ($line in $logContent) {
    $columns = $line -split ','
    for ($col = 1; $col -le $columns.Count; $col++) {
        $worksheet.Cells.Item($row, $col) = $columns[$col - 1].Trim()
    }
    $row++
}

# Automatische Anpassung der Spaltenbreite
$usedRange = $worksheet.UsedRange
$usedRange.EntireColumn.AutoFit() | Out-Null

# Speichern der Excel-Datei
# Vorher: $excelFilePath = ".\logfile_output.xlsx"
$excelFilePath = "C:\Temp\HardeningKitty\Aerolite\$logfile_name.xlsx"
$workbook.SaveAs($excelFilePath)
$workbook.Close()

# Excel-Anwendung beenden
$excel.Quit()

# COM-Objekte bereinigen
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Host "Excel-Datei '$excelFilePath' wurde erfolgreich erstellt."