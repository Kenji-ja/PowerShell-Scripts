#Import AD moddule
Import-Module ActiveDirectory

#Default password for accounts
$Password = Read-Host -Prompt "Enter the default password for all accounts (will be changed upon login): "

#set path for the ddirectory
$path = Read-Host -Prompt "Enter the distinguished name of the directory: "

#Import CSV with custom header, then format information and apss it to New-AD user
Import-Csv -Path $UsersFilePath -Header $Header | ForEach {
#Create variables
$Fname = Read-Host -Prompt "Enter the first name"
$Lname = Read-Host -Prompt "Enter the Last name"
$giveName = ($_.Fname + " " + $_.Lname)

#Create AD user
New-ADUser `
   -Name $Fname `
   -GivenName $givenName `
   -Surname $Lname `
   -UserPrincipalName "$Fname $Lname" `
   -AccountPassword (ConvertTo-SecureString "$Password" -AsPlainText -Force) `
   -Path "$path" `
   -ChangePasswordAtLogon $true `
   -Enabled $true

#FeedBack
Write-Host "created" $givenName
}
