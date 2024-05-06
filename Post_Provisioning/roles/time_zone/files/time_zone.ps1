$timezoneValue = "{{ input_timezone }}"
$TZ = Get-TimeZone
if ($TZ.Id -ne $timezoneValue) {
    Set-TimeZone -Name $timezoneValue
    Write-Host "Timezone set to $timezoneValue"
} else {
    Write-Host "Timezone already set to $timezoneValue"
}