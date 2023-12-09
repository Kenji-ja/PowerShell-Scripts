#Import AD library
Import ActiveDirectory

#Path for the OU
$OUpath = Read-Host -Prompt "Enter the the distinguished name of the OU: "
#Path that the CSV file will be saved
$ExportPath = Read-Host -Prompt "Enter the the path for where the file will be saved (Ex: C:\Users.csv): "
#Empty array for users
$ADUsers = @()
#get AD users from OU, filter object properties, then export to CSV
$ADUsers += Get-ADUser -Filter * -SearchBase $OUpath -Properties 

$ADUsers | Sort-Object Name | Select-Object `
@{Label = "GivenName"; Expression = {$_.GivenName}},
@{Label = "Surname"; Expression = {$_.Surname}},
@{Label = "SamAccountName"; Expression = {$_.SamAccountName}},
@{Label = "UserPrincipalName"; Expression = {$_.UserPrincipalName}},
@{Label = "Name"; Expression = {$_.Name}} | Export-Csv -NoTypeInformation $ExportPath