# Will add colors to represent change
# Will remove date

while ($true) {
    $adUsers = Get-ADUser -Filter * | Select-Object -ExpandProperty Name
    Write-Host -ForegroundColor Cyan "`nUSER MONITOR:"
    foreach ($adUser in $adUsers) {

        $lastPassR = Get-ADUser -Identity $adUser -Properties PasswordLastSet | Select-Object -ExpandProperty PasswordLastSet
        Write-Host $adUser": $lastPassR"

    }

    $count = (get-aduser -filter * | Measure-Object).Count
    Write-Host "`nTotal Users: $count"
    Start-Sleep -Seconds 10

}

