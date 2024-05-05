$TZ = Get-TimeZone
if ($TZ.id -ne "{{ input_timezone }}") {
    Set-TimeZone -Name "{{ input_timezone }}"
    Write-Host "Timezone set"
} else {
    Write-Host "Timezone already set"
}
