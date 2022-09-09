
This repos is a Powershell library to handle data modeling focusing on cloud providers.
# Automate delegate full access in shared mailbox


##Create mailbox

```bash
# Create a shared mailbox
New-Mailbox -Shared -Name "Automate.List" -PrimarySmtpAddress "automate.list@backsys.tech"
```
![](https://github.com/BrunoPolezaGomes/PowerShell/blob/main/Shared_MailBox_Automate_Delegate_User/Images/Shared_Mailbox_Created.png?raw=true)
# 

### Filter users by custom attribute and apply full access in shared box
```bash
$Users = Get-Mailbox -Filter { CustomAttribute1 -Like "Automate.List" }
$Users  | Select-Object DisplayName, UserPrincipalName, CustomAttribute1
```
```xml
DisplayName   UserPrincipalName  CustomAttribute1
-----------   -----------------  ----------------
Maria Paula   maria@backsys.tech Automate.List
Julia Sherman julia@backsys.tech Automate.List
João Wilke    joao@backsys.tech  Automate.List
Bruno Gomes   bruno@monga.tech   Automate.List

```
# 

### Create loop to apply full access user in SharedBox
```bash
ForEach ($User in $Users) {
    Add-MailboxPermission -Identity "Automate.List" -User $User.UserPrincipalName -AccessRights FullAccess -InheritanceType All
}
```
![](https://github.com/BrunoPolezaGomes/PowerShell/blob/main/Shared_MailBox_Automate_Delegate_User/Images/Shared_Mailbox_Users.png?raw=true)
# 

### Connection Exchange method
first we will create a file with the encrypted password to use in the script to connect to Exchange Online, to suppress the password in the script

```bash
#Insert admin account
$User = "MyUser"
$FilePass = "C:\Passwd\name@domain.txt"
#Encrypted password to a file
$PassCreate = "Password!" | ConvertTo-SecureString -AsPlainText -Force
$PassCreate | ConvertFrom-SecureString | Out-File $FilePass
```

With the password encrypted in a file, we will use the file to insert it into a variable and make the connection

```bash
#Get encrypted password file
$Password = Get-Content 'C:\Passwd\name@domain.txt' | ConvertTo-SecureString
#Get credentials for variable
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $Password

#Connect Exchange Online
Connect-ExchangeOnline -Credential $Cred
```
# 

### Complete workflow
```bash
#Credentials
$User = "MyUser"
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
```
