
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
try {
    $CDDrive = Get-WmiObject win32_volume -Filter 'DriveType = "5"'

    if ($CDDrive) {
        $CDDrive.DriveLetter = "Z:"
        $CDDrive.put()
        Write-Host "CD drive letter changed to Z"
        Write-Log "CD drive letter changed to Z"
    } else {
        Write-Host "No CD drive found"
        Write-Log "No CD drive found"
    }
} catch {
    Write-Host "An error occurred: $_"
    Write-Log "An error occurred: $_"
}

#Expand C drive
try {
    $CDL = "C"
    $CSize = (Get-PartitionSupportedSize -DriveLetter $CDL)
    Resize-Partition -DriveLetter $CDL -Size $CSize.SizeMax
    Write-Host "C drive expanded successfully"
} catch {
    Write-Host "Error: $_"
}
