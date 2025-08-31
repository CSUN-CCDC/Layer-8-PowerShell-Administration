$location = (Get-Location).Path
$distN = Get-ADDomain | Select-Object -ExpandProperty DistinguishedName
Import-GPO -BackupGpoName 'WinRM' -TargetName 'WinRM' -Path "$location\Group Policy\WinRM" -CreateifNeeded
New-GPLink -Name "WinRM" -Target "$distN" -LinkEnabled Yes
gpupdate /force