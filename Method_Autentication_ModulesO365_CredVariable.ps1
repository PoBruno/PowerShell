# 
# 
# Bruno Gomes | DOMO Solucoes em T.I.
####
Set-ExecutionPolicy RemoteSigned
Import-Module ActiveDirectory
Import-Module -Name AzureAD, MSOnline, ExchangeOnline

## Methods to save credential password in a text file
$User = "MyUser"
$FilePass = "C:\Passwd\name@domain.txt"
$PassCreate = "Password!" | ConvertTo-SecureString -AsPlainText -Force
$PassCreate | ConvertFrom-SecureString | Out-File $FilePass
$Password = Get-Content 'C:\Passwd\name@domain.txt' | ConvertTo-SecureString
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $Password

Connect-AzureAD -Credential $Cred
Connect-MsolService -Credential $Cred
Connect-ExchangeOnline -Credential $Cred



#######
#Script complete
Write-Host "Script Execution - OK"
#
