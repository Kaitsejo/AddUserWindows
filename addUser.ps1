#Importation du fichier CSV
$users = Import-Csv -Path "C:\path\to\users.csv"
foreach ($user in $users) {
    $UserPrincipalName = $user.Prénom+"_"+$user.Nom+"_"+$user.Service
    New-ADUser -Name $user.Nom 
    -GivenName $user.Prénom
    -Surname $user.Prénom 
    -SamAccountName $user.NomUtilisateur 
    -AccountPassword (ConvertTo-SecureString $user.Mot -AsPlainText -Force) 
    -UserPrincipalName $UserPrincipalName 
    -Enabled $true
    -ChangePasswordAtLogon $false 
    -Path "OU=Users,DC=domain,DC=local" # Remplacez "domain" et "local" par votre nom de domaine
}

