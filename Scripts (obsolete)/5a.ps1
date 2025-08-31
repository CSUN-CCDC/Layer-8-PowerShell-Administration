$listArray = @()
$numList = 1
$5a = Get-ADOrganizationalUnit -Filter * | Select-Object -ExpandProperty DistinguishedName | Sort-Object -desc
foreach ($5 in $5a) {
				"(" + $numList.ToString() + ")" + $5
				$numList++
				$listArray += $5
}
		
Write-Host "Choose an OU"
$choose = Read-Host
$result = $listArray[$choose - 1]
$users = @(Get-ADUser -Filter * -SearchBase $result | Select-Object -ExpandProperty SamAccountName | Sort-Object -desc)
Write-Host -ForegroundColor Yellow "How powershell reads dates:'6/9/2069'"
[string]$year = Read-Host "Enter year"
[string]$month = Read-Host "Enter month (ADD '/' @ END)"
[string]$day = Read-Host "Enter day(ADD '/' @ END)"
[string]$date = $month + $day + $year
foreach ($user in $users) {
				Set-ADAccountExpiration -Credential $credential -Identity $user -DateTime $date
}