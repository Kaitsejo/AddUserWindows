$uri = "https://jsonplaceholder.typicode.com/users"
$response = Invoke-RestMethod -Uri $uri
$response | Select-Object @{Name='Nom'; Expression={$.name}}, @{Name='Prénom'; Expression={$.username}}, @{Name='NomUtilisateur'; Expression={$_.email}}, @{Name='MotDePasse'; Expression={'Pa$$w0rd'}}, @{Name='Service'; Expression={'IT'}} |
    Export-Csv -Path "C:\Users\Administrateur\Documents\Controle_continu\UserList.csv" -NoTypeInformation -Encoding UTF8
