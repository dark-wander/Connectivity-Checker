
Param(
  [Parameter(Mandatory=$true, position=0)][string]$csvfile
)


$targets = import-csv $csvfile
$ping = New-Object System.Net.NetworkInformation.Ping

ForEach($target in $targets) { 
    $output = ($ping.Send($target.("IP Address"))).Status
    Write-Host $target.("IP Address"), "-", $output

      <#  If ($output -ne 0){       
         Write-Output $target | Out-File "fail.txt" -Append
        }else{
	Write-Output $target | Out-File "pass.txt" -Append
	}   #> 

}

