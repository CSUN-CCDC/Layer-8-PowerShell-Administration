$listArray = @()
$numList = 1
$6a = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName | Sort-Object -desc
foreach ($6 in $6a) {
				"(" + $numList.ToString() + ")" + $6
				$numList++
				$listArray += $6
}
		
$inp = Read-Host "Enter numbers"
$numbers = $inp -split ',' | Where-Object { $_ -ne "" } | ForEach-Object { [int]$_ }
foreach ($number in $numbers) {
				Clear-ADAccountExpiration -Identity $listArray[$number - 1]
			
}
		