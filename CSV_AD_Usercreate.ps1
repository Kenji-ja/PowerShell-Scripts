#Import AD moddule
Import-Module ActiveDirectory

#Custom CSV header
$Header = "Fname" , "Lname"

#Default password for accounts
$Password = Read-Host -Prompt "Enter the default password for all accounts (will be changed upon login): "

#set path for the ddirectory
$path = Read-Host -Prompt "Enter the distinguished name of the directory: "

#Import CSV with custom header, then format information and apss it to New-AD user
Import-Csv -Path $UsersFilePath -Header $Header | ForEach {
#Create variables
$giveName = ($_.Fname + " " + $_.Lname)
$Fname = $_.Fname
$Lname = $_.Lname

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
