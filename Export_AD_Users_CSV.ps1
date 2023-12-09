#Import AD library
Import ActiveDirectory

#Path for the OU
$OUpath = Read-Host -Prompt "Enter the the distinguished name of the OU: "
#Path that teh CSV file will be saved
$ExportPath = "C:\ADusers.csv"

#get AD users from OU, filter object properties, then export to CSV
Get-ADUser -Filter * -SearchBase $OUpath | Select-Object DistinguishedName,Name,UserPrinciplaName,SamAccountName,Surname | Export-Csv -NoTypeInformation $ExportPath