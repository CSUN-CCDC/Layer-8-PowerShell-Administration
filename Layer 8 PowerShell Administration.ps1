Set-ExecutionPolicy -Scope Process Bypass -Force
Write-Host -ForegroundColor Red @"
                                                                                
                                       ,,,                                      
                                    ,,,,,,,,,                                   
                               ,,,,,,,,,,,,,,,,,,,                              
                       ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                      
       ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,         ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,      
       ,,,,,,,,,,,,,,,,,,,,,,,       ,,,,,,.       ,,,,,,,,,,,,,,,,,,,,,,,      
       ,,,,,,,,,,,            ,,,,,,,,,,,,,,,,,,,,,            ,,,,,,,,,,,      
       ,,,,,,,    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.    ,,,,,,,      
       .,,,,,,  ,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,  ,,,,,,       
        ,,,,,,  .,,,,,,,,,,,,,%@@@@@@@@@@@@@@@@@@@(,,,,,,,,,,,,,   ,,,,,,       
                 ,,,,,,,,,,,,@@@@@@@@*,,,,,/@@@@@@@@,,,,,,,,,,,,                
         ,,,,,,  ,,,,,,,,,,,,@@@@@@@,,,,,,,,,@@@@@@@,,,,,,,,,,,,  ,,,,,,        
        .,,,,,,   ,,,,,,,,,,,@@@@@@@,,,,,,,,*@@@@@@&,,,,,,,,,,,   ,,,,,,        
         ,,,,,,,  ,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,  ,,,,,,,        
         ,,,,,,,   ,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,   ,,,,,,.        
          ,,,,,,,  ,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,  ,,,,,,,         
          .,,,,,,.  ,,,,,,,,@@@@@@@,,,,,,,,,,,@@@@@@@,,,,,,,,  ,,,,,,,          
           ,,,,,,,   ,,,,,,,@@@@@@@,,,,,,,,,,,@@@@@@@,,,,,,,   ,,,,,,,          
            ,,,,,,,   ,,,,,,@@@@@@@@@,,,,,,,@@@@@@@@@,,,,,,   ,,,,,,,           
             ,,,,,,,   ,,,,,,/@@@@@@@@@@@@@@@@@@@@@*,,,,,,   ,,,,,,,            
              ,,,,,,,   ,,,,,,,,/@@@@@@@@@@@@@@@/,,,,,,,,   ,,,,,,,             
               ,,,,,,,,  ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.  ,,,,,,,,              
                .,,,,,,,   ,,,,,,,,,,,,,,,,,,,,,,,,,,,   ,,,,,,,                
                  ,,,,,,,,   ,,,,,,,,,,,,,,,,,,,,,,,   ,,,,,,,,                 
                    ,,,,,,,,   .,,,,,,,,,,,,,,,,,    ,,,,,,,,                   
                     .,,,,,,,,,   ,,,,,,,,,,,,.   ,,,,,,,,,                     
                        ,,,,,,,,,,    ,,,,,    ,,,,,,,,,,                       
                          ,,,,,,,,,,,,     ,,,,,,,,,,,,                         
                             ,,,,,,,,,,,,,,,,,,,,,,,                            
                                 ,,,,,,,,,,,,,,,                                
                                      ,,,,,                                     
"@


<# 

	More info about scripts in 
	CCDC Administration myBox

	NOTE: It may not be up-to-date

#>

<#

	NOTES ABOUT SCRIPT:
		-3 and 4 use static names
		- Global credential not working as intended (will figure out later)
#>

try {
$Global:credential = Get-Credential
}
catch {
Write-Host -ForegroundColor Yellow "No initial credential provided. This is fine."
}
powershell -file .\Help.ps1
$start = $true
while ($start -eq $true) {
	$num = Read-Host "Enter a number"
	switch ($num) {
		1a {
		
			powershell -file ".\Scripts\1a.ps1"
			break
		}
	
		2a {
				
			powershell -file ".\Scripts\2a.ps1"
			break

		}
	
		3a {
	
			powershell -file ".\Scripts\3a.ps1"
			break

		}
		
		4a {
	
			powershell -file ".\Scripts\4a.ps1"
			break

		}
	
		5a {
	
			powershell -file ".\Scripts\5a.ps1"
			break

		}
	
		6a {
			
			powershell -file ".\Scripts\6a.ps1"
			break

		}
	
		7a {
	
			powershell -file ".\Scripts\7a.ps1"
			break

		}
		
		<#
		Below are CCDC Scripts
	#>
		
		100a {
		
			
		
		}
		
		101a {
			
			powershell -file ".\Scripts\101a.ps1"
			break
	
		}

		102a {
			
			powershell -file .\Passphrases\psswrdshfl.ps1
			break

		}
		
		103a {

			powershell -file .\Scripts\SMBv1Off.ps1
			break
		}

		#HELP
		? {
	
			powershell -file .\Help.ps1
			break

		}
	
		?? {
		
			Write-Host -ForegroundColor Yellow "Local: Can only be run on computer connected to domain."
			Write-Host -ForegroundColor Yellow "Remote: Can be run on any machine connected to a network (Uses WinRM)"
			Write-Host -ForegroundColor Yellow "(UF): Unfinished"

		}
	
		#exit
	
		quit {
			
			$Global:credential = $null
			$start = $false
			break

		}
		
	
	
		#test switch
		999 {
	
			$gpoName = Read-Host "Enter GPO Name"
			New-GPO $gpoName
			New-GPLink -Name $gpoName -Target (Get-ADRootDSE | Select-Object -ExpandProperty rootDomainNamingContext)
			
		}
	
	
	
		default {
			Read-Host "Relaunch script: Invalid Number/Command (Press Enter)"
		}
	}
}