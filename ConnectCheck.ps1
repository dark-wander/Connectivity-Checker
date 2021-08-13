$selection = 2
   while ($selection -lt 0 -or $selection -gt 1){
    $selection = Read-Host -Prompt 'enter 0 for .txt || 1 for .csv'

        if ($selection -eq 0){

            $inputFile = Read-Host -Prompt 'Enter txt file name'
            try
                {
                    $targets = Get-Content $inputFile -ErrorAction Stop
                }
                catch [System.Management.Automation.ItemNotFoundException]
                {
                    Write-Output "Could not find $inputFile. please check path/file name and try again."
                }
          
 
            $ping = New-Object System.Net.NetworkInformation.Ping

        ForEach($target in $targets) { 
            $output = ($ping.Send($target)).Status
            Write-Host $target, "-", $output

                If ($output -ne 0){       
                 Write-Output $target | Out-File "fail.txt" -Append
                }else{
	        Write-Output $target | Out-File "pass.txt" -Append
	        }    

}

        } elseif ($selection -eq 1){
            Param(
                [Parameter(Mandatory=$true, position=0)][string]$csvfile
                )

                $targets = import-csv $csvfile
                $ping = New-Object System.Net.NetworkInformation.Ping

                ForEach($target in $targets) { 

                    $output = ($ping.Send($target.("IP Address"))).Status
                    Write-Host $target.("IP Address"), "-", $output

                        If ($output -ne 0){       
        	                Write-Output $target | Out-File "fail.txt" -Append
                        }else{
		                    Write-Output $target | Out-File "pass.txt" -Append
	                    }
                }
        }else{
            Write-Output "please enter a 0 or a 1"
        }

}
