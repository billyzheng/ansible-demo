#Output file variables
Function write-log{
Param (
[string] $msg
)
$date = Get-Date -Format "MM-dd-yyyy"
New-Item -Path "C:\Programdata\Logs" -ItemType Directory -ErrorAction SilentlyContinue
$Logfile = "C:\Programdata\Logs\Post-Build_Script1.log"
$TimeStamp = Get-Date -Format "MM/dd/yyyy hh:mm:ss tt"
write-host "$($TimeStamp): $msg"
Write-Output "$($TimeStamp): $msg" |out-file $Logfile -append
}

$TZ = Get-TimeZone
if ($TZ.id -ne "{{ input_timezone }}") {
    Set-TimeZone -Name "{{ input_timezone }}"
    Write-Host "Timezone set"
} else {
    Write-Host "Timezone already set"
}
