$listArray = @()
$numList = 1
$2a = Get-ADOrganizationalUnit -Filter * | Select-Object -ExpandProperty DistinguishedName | Sort-Object -desc
foreach ($2 in $2a) {
				"(" + $numList.ToString() + ")" + $2
				$numList++
				$listArray += $2
}
		
Write-Host "Choose an OU"
$choose = Read-Host
$result = $listArray[$choose - 1]
$users = @(Get-ADUser -Filter * -SearchBase $result | Select-Object -ExpandProperty SamAccountName | Sort-Object -desc)
$numList = 1
foreach ($user in $users) {
				"(" + $numList.ToString() + ")" + $user
				$numList++
				$users += $users
}
		
Write-Host "Choose a user"
$choose = Read-Host
$result = $users[$choose - 1]
$if = Read-Host "Change password on next logon? (Y/N)"
if ($if -eq "Y") {
				Set-ADUser -Credential $credential -Identity $result -ChangePasswordAtLogon $true
				Set-ADAccountPassword -Credential $credential -Identity $result -Reset
}
ElseIf ($if -eq "N") {
				Set-ADUser -Credential $credential -Identity $result -ChangePasswordAtLogon $false
				Set-ADAccountPassword -Credential $credential -Identity $result -Reset
}
Else {
				Write-Host -ForegroundColor Red "Incorrect value proceeding to password reset"
				Set-ADAccountPassword -Credential $credential -Identity $result -Reset
}