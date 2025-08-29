$writing = $true
$hostsList = @()
while($writing -eq $true){

	$read = Read-Host "Enter one host at a time"
	$hostsList += "$read`r`n"
	if($read -eq ""){
		$writing = $false
	
	}

}

$hostsLists.RemoveAt(
Write-Host $hostsList[1]