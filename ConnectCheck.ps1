$targets = Get-Content "ip.txt"
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
Pause
