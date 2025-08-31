$listArray = @()
$numList = 1
$OUArr = Get-ADOrganizationalUnit -Filter * | Select-Object -ExpandProperty DistinguishedName | Sort-Object -desc
foreach ($OU in $OUArr) {
				"(" + $numList.ToString() + ")" + $OU
				$numList++
				$listArray += $OU
}
$choose = Read-Host "Choose OU"
$result = $listArray[$choose - 1]
Write-Host -ForegroundColor Yellow "$result CHOSEN"
Get-ADUser -Filter * -SearchBase "$result" | Select-Object -ExpandProperty SamAccountName | ForEach-Object { Set-ADUser -Credential $credential -Identity $_ -EMailAddress "$_@AnimeHealth.net" }