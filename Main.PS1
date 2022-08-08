# 
# 
# Bruno Gomes | DOMO Solucoes em T.I.
####
Set-ExecutionPolicy RemoteSigned
Import-Module ActiveDirectory
Import-Module -Name AzureAD, MSOnline, ExchangeOnline

Connect-AzureAD 
Connect-MSOlService
Connect-ExchangeOnline 

## Methods to sava credential password in a text file
$FilePass = "C:\Passwd\name@domain.txt"
$PassCreate = "Password!" | ConvertTo-SecureString -AsPlainText -Force
$PassCreate | ConvertFrom-SecureString | Out-File $FilePass
$Password = Get-Content 'C:\Passwd\name@domain.txt' | ConvertTo-SecureString









#######
#Script complete
Write-Host "Script Execution - OK"
#
