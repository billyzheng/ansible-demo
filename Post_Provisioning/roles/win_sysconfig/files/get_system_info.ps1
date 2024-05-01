# Get system information
$systemInfo = @{
    "Hostname" = $env:COMPUTERNAME
    "IP Address" = (Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4' -and $_.InterfaceAlias -ne 'Loopback' -and $_.InterfaceAlias -ne 'Teredo'} | Select-Object -ExpandProperty IPAddress)
    "Operating System Version" = (Get-ComputerInfo | Select-Object -ExpandProperty OsVersion)
}

# Output system information as JSON
$systemInfo | ConvertTo-Json
