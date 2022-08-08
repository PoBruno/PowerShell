# Personal workflow PowerShell DevOps scripts

This repos is a Powershell library to handle data modeling focusing on cloud providers.

## Initial Tools - Filter methods
Model initial tools WorkFlow - [WorkFlow_Main01.PS1](https://github.com/lorthe/PowerShell/blob/61b1070bddde2238075b0d550ecde1a382b2fcd3/WorkFlow_Main01.PS1)

```bash
# FILTER METHODS MODULES Office365

Get-AzureADUser -Filter "DisplayName eq 'User Name'"

### -All $true -ResultSize Unlimited
### | select -ExpandProperty EmailAddresses,
Get-AzureADUser | Where-Object {$_.DisplayName -like "*UserName*"}
Get-AzureADUser | Where-Object {$_.AssignedPlans.Service -like "*"}

Get-Mailbox -Filter {DisplayName -Like "*Bruno*"}

# ServicesPlan Doc
$userName="Bruno Gomes"
Write-Host (Get-AzureADUser | where {$_.DisplayName -eq $userName}).AssignedPlans
Get-AzureADSubscribedSku | Select -Property Sku*,ConsumedUnits -ExpandProperty PrepaidUnits
```
## Authentication in Office365 modules with Variables

Current method of Authentication in Office365 modules using text file password encryption for use in variables for password and user - [Method_Autentication_ModulesO365_CredVariable.ps1](https://github.com/lorthe/PowerShell/blob/61b1070bddde2238075b0d550ecde1a382b2fcd3/Method_Autentication_ModulesO365_CredVariable.ps1)


```bash
Set-ExecutionPolicy RemoteSigned
Import-Module ActiveDirectory
Import-Module -Name AzureAD, MSOnline, ExchangeOnlineManagement

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
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
