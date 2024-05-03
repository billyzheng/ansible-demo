
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

Import-Csv "C:\temp\$env:computername.csv" -UseCulture| %{
$Timezone = $_.Timezone}

#Timezone configuration
$TZ = Get-TimeZone
If ($TZ.id -ne $Timezone)
{
 Set-TimeZone -name $Timezone
 write-log "Timezone set"
 }
 else
 {
  write-log "TimeZone already set"
 }