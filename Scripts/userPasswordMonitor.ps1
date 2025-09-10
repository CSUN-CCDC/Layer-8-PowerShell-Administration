# Will add colors to represent change (Work in progress)
# Will remove date
# MAKE YOU SET PASSWORDS FOR ALL USERS IN ORDER FOR THIS TO WORK PROPERLY

$iniCount = (get-aduser -filter * | Measure-Object).Count
$inilastPassR = @(get-aduser -filter * -Properties PasswordLastSet | Select-Object -ExpandProperty PasswordLastSet | Sort-Object)
$index = 0

while ($true) {
    $adUsers = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName | Sort-Object
    Write-Host -ForegroundColor Green "`nUSER PASSWORD MONITOR:"
	$getDate = Get-Date -Format "HH:mm:ss"
	Write-Host -ForegroundColor Yellow $getDate
    foreach ($adUser in $adUsers) {
		
        $lastPassR = Get-ADUser -Identity $adUser -Properties PasswordLastSet | Select-Object -ExpandProperty PasswordLastSet | Sort-Object
		if($inilastPassR[$index] -ne $lastPassR){
			Write-Host -ForegroundColor Red $adUser": $lastPassR"
		}
		
			Write-Host $adUser": $lastPassR"
		
		$index++

    }

	$index = 0
    $count = (get-aduser -filter * | Measure-Object).Count
	if($iniCount -ne $count){
		Write-Host -ForegroundColor Red "`nTotal Users: $count"
	}else{
		Write-Host "`nTotal Users: $count"
	}
    
    Start-Sleep -Seconds 10

}
