
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
$DNSSuffix = ($_.DNSSuffix).split(",")
}

#DNS suffix validation
$suffixresult = (Get-DnsClientGlobalSetting).SuffixSearchList
for ($i=0; $i -lt $DNSSuffix.count; $i++)
{
if ($dnssuffix[$i] -eq $suffixresult[$i])
{
$a =$suffixresult[$i]
write-log "DnS suffix value $a is correct"
}
else
{
Set-DnsClientGlobalSetting -SuffixSearchList $DNSSuffix
}
}
write-log (Get-DnsClientGlobalSetting).SuffixSearchList
