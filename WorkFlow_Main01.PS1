# 
# 
# Bruno Gomes | DOMO Solucoes em T.I.
####
Set-ExecutionPolicy RemoteSigned
Import-Module ActiveDirectory
Import-Module -Name AzureAD, MSOnline, ExchangeOnlineManagement

Connect-AzureAD 
Connect-MSOlService
Connect-ExchangeOnline 


    <# 


        Script Here

   
    #>



##################################
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
#
##################################


#######
#Script complete
Write-Host "Script Execution - OK"
#
