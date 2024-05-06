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