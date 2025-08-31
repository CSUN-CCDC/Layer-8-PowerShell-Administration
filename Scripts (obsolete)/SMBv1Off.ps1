#Turns SMB1 off
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force

#Checks if SMB1 if off
$test = (Get-SmbServerConfiguration).EnableSMB1Protocol 

if($test -eq $false){
    Write-Host "Success"
} else {
    Write-Host "Failure"
}
