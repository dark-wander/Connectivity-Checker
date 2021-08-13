Param(
  [Parameter(Mandatory=$true, position=0)][string]$csvfile
)


$targets = Import-Csv $csvfile
Write-Host $targets

    
ForEach($target in $targets) { 
    $output = (System.Net.NetworkInformation.Ping.Send($target)).Status
    Write-Host $target, "-", $output

        
        If ($output -ne 0){
        
         Write-Output $target | Out-File "//Output File destination//" -Append

          }else{
	Write-Output $target | Out-File "pass.txt" -Append
        }
}

Pause