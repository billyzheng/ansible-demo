param (
    [string]$Timezone
)

$TZ = Get-TimeZone
if ($TZ.id -ne $Timezone) {
    Set-TimeZone -Name $Timezone
    write-log "Timezone set"
} else {
    write-log "TimeZone already set"
}
