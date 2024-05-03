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
