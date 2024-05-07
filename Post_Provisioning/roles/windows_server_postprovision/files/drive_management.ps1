
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

#Change the CD drive letter
$CDDrive = Get-WmiObject win32_volume -Filter 'DriveType = "5"'
$CDDrive.DriveLetter = "z:"
$CDDrive.put()
write-log "CD drive letter changed to Z"