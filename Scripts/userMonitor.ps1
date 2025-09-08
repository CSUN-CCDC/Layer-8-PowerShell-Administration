$adUsers = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName
foreach ($adUser in $adUsers) {
    $lastpsswrd = Get-ADUser -Identity $adUser -Properties pwdLastSet
    $output = @($adUser + ": " + $lastpsswrd)
    $output += $output
}

Write-Host $output
