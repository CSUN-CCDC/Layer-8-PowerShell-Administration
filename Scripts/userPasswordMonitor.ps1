# Will add colors to represent change (Work in progress)
# Will remove date
# MAKE YOU SET PASSWORDS FOR ALL USERS IN ORDER FOR THIS TO WORK PROPERLY

$iniCount = (get-aduser -filter * | Measure-Object).Count
$inilastPassR = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName | Sort-Object | ForEach-Object {(Get-ADUser -Identity $_ -Properties PasswordLastSet | Select-Object -ExpandProperty PasswordLastSet).Second}
$index = 0

while ($true) {
    $adUsers = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName | Sort-Object
    Write-Host -ForegroundColor Green "`nUSER PASSWORD MONITOR:"
	$getDate = Get-Date -Format "HH:mm:ss"
	Write-Host -ForegroundColor Yellow $getDate
    foreach ($adUser in $adUsers) {
		
        $lastPassR = (Get-ADUser -Identity $adUser -Properties PasswordLastSet | Select-Object -ExpandProperty PasswordLastSet).Second
		if($inilastPassR[$index] -ne $lastPassR){
			Write-Host -ForegroundColor Red $adUser": $lastPassR"
		}
			
		if($inilastPassR[$index] -eq $lastPassR) {	
			Write-Host $adUser": $lastPassR"
		}
		
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
