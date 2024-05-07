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

#KMS registration (OS License)
$ActivationStatus = Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | Where-Object { $_.PartialProductKey } | Select-Object LicenseStatus       
$LicenseResult = switch($ActivationStatus.LicenseStatus){
          0	{"Unlicensed"}
          1	{"Licensed"}
          2	{"OOBGrace"}
          3	{"OOTGrace"}
          4	{"NonGenuineGrace"}
          5	{"Not Activated"}
          6	{"ExtendedGrace"}
          default {"unknown"}
        }
if ($LicenseResult -ne "Licensed")
{
cscript "C:\windows\system32\slmgr.vbs" -skms 'it-s-kms0001.it.abb.com:1688'
Start-Sleep 15
cscript "C:\windows\system32\slmgr.vbs" -ato
Start-Sleep 30
write-log "OS License activated successfully"
}
else
{
 write-log "OS License already activated"	
}
