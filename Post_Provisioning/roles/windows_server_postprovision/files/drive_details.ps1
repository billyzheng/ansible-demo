# Get the list of drives
$drives = Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, VolumeName, Size, FreeSpace, FileSystem

# Output the list of drives
$drives
