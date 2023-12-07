#Import AD moddule
Import-Module ActiveDirectory

#Custom CSV header
$Header = "Fname" , "Lname"

#Default password for accounts
$Password = "P@ssword"

#set path for the ddirectory
$path = "changeme"

#Import CSV with custom header, then format information and apss it to New-AD user
Import-Csv -Path $UsersFilePath -Header $Header | ForEach {
#Create variables
$giveName = ($_.Fname + " " + $_.Lname)
$Fname = $_.Fname
$Lname = $_.Lname

#Create AD user
New-ADUser `
   -Name $Fame `
   -GivenName $givenName `
   -Surname $Lname `
   -UserPrincipalName "$Fname $Lname" `
   -AccountPassword (ConvertTo-SecureString "$Password" -AsPlainText -Force) `
   -Path "$path" `
   -ChangePasswordAtLogon $true `
   -Enabled $true
}