$tempCred = Get-Credential
if (!(Test-Path -Path "C:\output")) {
	New-Item -ItemType Directory -Path "C:\output"
} 
$output = @()
$fileName = Read-Host "Enter filename. File will be outputted to C:\output as .txt"
$Users = Get-ADUser -Filter * | Select-Object -ExpandProperty Name
foreach($User in $Users){
$passphrase = $null
$randomEndNumber = Get-Random -Max 99999 -Min 10000
$count = 0
$noun = $null
$verb = $null
$adjective = $null
# 3 words per passphrase logic
while($count -ne 3){
$txtFile = Get-Random -Max 4 -Min 1
switch($txtFile) {
    1 {
       # We don't want repeats of words
       if($null -ne $noun){
            break
       }
       $noun = Get-Random -InputObject (Get-Content .\Nouns.txt)
       $count++
       $passphrase += $noun + "-"
	   
    }

    2 {
       if($null -ne $verb){
            break
       } 
       $verb = Get-Random -InputObject (Get-Content .\Verbs.txt)
       $count++
       $passphrase += $verb + "-"
	   
    }

    3 {
        if($null -ne $adjective){
            break
        }
        $adjective = Get-Random -InputObject (Get-Content .\Adjectives.txt)
        $count++
        $passphrase += $adjective + "-"
		
    }

}
}
#Builds the final passphrase and sets it
    $passphrase += $randomEndNumber
	$securePassword = ConvertTo-SecureString -String $passphrase -AsPlainText -Force
	Set-ADAccountPassword -Identity $User -NewPassword $securePassword -Credential $tempCred
    $output = @("$User" + ": " + "$passphrase")
	$output | Out-File -FilePath "C:\output\$fileName.txt" -Append
}