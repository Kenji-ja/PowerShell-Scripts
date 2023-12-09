#Import AD module
Import-Module ActiveDirectory

#Default password for accounts
$Password = $Password = Read-Host -Prompt "Enter the default password for all accounts (will be changed upon login): "

#set path for the directory
$path = Read-Host -Prompt "Enter the distinguished name of the directory: "

#Loop through each user and create user
Import-Csv -Path $CsvFilePath | ForEach {
#Create variables
$GivenName = $_.GivenName
$Name = $_.Name
$Surname = $_.Surname
$SamAccountName = $_.SamAccountName
$UserPrincipalName = $_.UserPrincipalName

#Create AD user
New-ADUser `
   -Name $Name `
   -GivenName $GivenName `
   -Surname $Surname `
   -UserPrincipalName $UserPrincipalName `
   -AccountPassword (ConvertTo-SecureString "$Password" -AsPlainText -Force) `
   -Path "$path" `
   -ChangePasswordAtLogon $true `
   -Enabled $true

#FeedBack
Write-Host "created" $GivenName
}