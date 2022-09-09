
######This repos is a Powershell library to handle data modeling focusing on cloud providers.
# Automate delegate user in shared mailbox


###Create mailbox

```bash
# Create a shared mailbox

New-Mailbox -Shared -Name "Automate.List" -PrimarySmtpAddress "automate.list@backsys.tech"

```
![](https://raw.githubusercontent.com/BrunoPolezaGomes/PowerShell/main/Shared_MailBox_Automate_Delegate_User/Images/Shared_Mailbox_Created.png?token=GHSAT0AAAAAABYTDC5NJULN3MVY7L3ODITKYY3WMNA)

# 

### Filter users by custom attribute and insert into shared box
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

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
