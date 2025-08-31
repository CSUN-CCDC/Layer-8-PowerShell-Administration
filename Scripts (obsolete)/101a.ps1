
if (!(Test-Path -Path "C:\output")) {
				New-Item -ItemType Directory -Path "C:\output"
} 
			
$fileName = Read-Host "Enter filename. File will be outputted to C:\output as .txt"
$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
$output = @()
		
foreach ($computer in $computers) {
				if ($computer -eq (Get-ComputerInfo | select-Object -ExpandProperty CsName)) {
				
        $ipAddress = Get-NetIPAddress | Select-Object -ExpandProperty IPv4Address | Where-Object { $_ -notlike "127.*" }
        $macAddress = Get-NetAdapter | select-Object -ExpandProperty MacAddress
        $osName = Get-ComputerInfo | Select-Object -ExpandProperty osname
						
				}
				else {
        try {
            $ipAddress = Invoke-Command -ComputerName $computer -ScriptBlock { Get-NetIPAddress | Select-Object -ExpandProperty IPv4Address | Where-Object { $_ -notlike "127.*" } } -ErrorAction Stop 
            $macAddress = Invoke-Command -ComputerName $computer -ScriptBlock { Get-NetAdapter | select-Object -ExpandProperty MacAddress } -ErrorAction Stop 
            $osName = Invoke-Command -ComputerName $computer -ScriptBlock { Get-ComputerInfo | Select-Object -ExpandProperty osname } -ErrorAction Stop 
        }
        catch {
					
            Write-Host -ForegroundColor Red "Something went wrong...is WinRM configured correctly on all machines?"
            break
        }
				}
			
				$output = @($computer + ": " + $macAddress + ", " + $ipAddress + ", " + $osName)
				$output | Out-File -FilePath "C:\output\$fileName.txt" -Append
}
		
			