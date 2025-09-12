# Might combine into one or give options to do either or later
# Still glitching

$iniCount = (get-aduser -filter * | Measure-Object).Count
$iniLastLogon = (Get-ADUser -filter * -Properties lastlogon | Select-Object -ExpandProperty lastlogon | ForEach-Object {([datetime]$_).ToString()})
$index = 0

while ($true) {
    $adUsers = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName | Sort-Object
    Write-Host -ForegroundColor Green "`nUSER LOGON MONITOR:"
	$getDate = Get-Date -Format "HH:mm:ss"
	Write-Host -ForegroundColor Yellow $getDate
    foreach ($adUser in $adUsers) {
		
        $lastLogon = (Get-ADUser -Identity $adUser -Properties lastlogon | Select-Object -ExpandProperty lastlogon)
		$lastLogon = ([datetime]$lastLogon).ToString()
		if($iniLastLogon[$index] -ne $lastLogon){
			Write-Host -ForegroundColor Red $adUser": $lastLogon"
		}
			
		if($iniLastLogon[$index] -eq $lastLogon) {	
			Write-Host $adUser": $lastLogon"
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
