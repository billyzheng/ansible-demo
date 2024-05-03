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

#Timezone configuration
param (
    [string]$Timezone
)

$TZ = Get-TimeZone
Write-Output "Provided Timezone: $Timezone"
if ($TZ.id -ne $Timezone) {
    Set-TimeZone -Name $Timezone
    Write-Output "Timezone set to $Timezone"
} else {
    Write-Output "Timezone already set to $Timezone"
}
