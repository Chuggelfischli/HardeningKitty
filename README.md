## Wechsle ins Temp Verzeichnis
cd C:\Temp\
## Erstelle Ordner
mkdir HardeningKitty
cd HardeningKitty
## Lade Hardening Kitty Customer Setup von git herunter 
iwr -uri https://github.com/Chuggelfischli/HardeningKitty/archive/refs/heads/main.zip -Outfile hardeningkitty.zip
## Extract
Expand-Archive .\hardeningkitty.zip .
cd .\Hardening_Kitty\
## Starte Hardenning Kitty
Invoke-HardeningKitty -Mode Audit -Log -Report
## Erstelle High_Medium_Low.log File
.\.\Scriptilette.ps1
