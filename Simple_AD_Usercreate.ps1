#Import AD module
Import-Module ActiveDirectory

#Create AD user
New-ADUser `
   -Name $name `
   -GivenName $givenname `
   -Surname $lname `
   -UserPrincipalName "$name.$lname" `
   -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -Force) `
   -Path "$path" `
   -ChangePasswordAtLogon $true `
   -Enabled $true
