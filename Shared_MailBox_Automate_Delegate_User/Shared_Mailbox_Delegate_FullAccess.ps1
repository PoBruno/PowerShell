# Automatizacao de lista de distribuicao dinamica
# Bruno Gomes
####

## Methods to save for the first time the password in a text file
$User = "MyUser"
$FilePass = "C:\Passwd\name@domain.txt"
$PassCreate = "Password!" | ConvertTo-SecureString -AsPlainText -Force
$PassCreate | ConvertFrom-SecureString | Out-File $FilePass

# Creadential
$Password = Get-Content 'C:\Passwd\name@domain.txt' | ConvertTo-SecureString
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $Password
#Connect Exchange Online
Connect-ExchangeOnline -Credential $Cred
#New-Mailbox -Shared -Name "Automate.List" -PrimarySmtpAddress "automate.list@backsys.tech"

#Filter users by custom attribute and apply full access in shared box
$Users = Get-Mailbox -Filter {CustomAttribute1 -Like "Automate.List"}
#Create loop to apply full access user in SharedBox
ForEach ($User in $Users) {
    Add-MailboxPermission -Identity "Automate.List" -User $User.UserPrincipalName -AccessRights FullAccess -InheritanceType All
}

#######
#Script complete
Write-Host "Script Execution - OK"
#
