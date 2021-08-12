$targets = Get-Content "//Path of IP address List//"
$ping = New-Object System.Net.NetworkInformation.Ping

    Out-File "//Output File destination//"

ForEach($target in $targets) { 
    $output = ($ping.Send($target)).Status
    Write-Host $target, "-", $output

        If ($output -ne 0){
        
         Write-Output $target | Out-File "//Output File destination//" -Append

        
        }
}
Pause