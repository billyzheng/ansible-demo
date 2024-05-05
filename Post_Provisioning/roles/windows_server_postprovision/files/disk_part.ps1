
#Change the CD drive letter
$CDDrive = Get-WmiObject win32_volume -Filter 'DriveType = "5"'
$CDDrive.DriveLetter = "z:"
$CDDrive.put()
write-log "CD drive letter changed to Z"

#Expand C drive
$CDL = "C"
$CSize = (Get-PartitionSupportedSize -DriveLetter $CDL)
Resize-Partition -DriveLetter $CDL -Size $CSize.SizeMax 

#Formatting available disks
Function Partition-disk
{
 $newdisks = get-disk |where partitionstyle -eq 'raw'
 If ($newdisks -ne $null)
 {
   foreach($newdisk in $newdisks)
  {
    $dl= get-Disk -number $newdisk.Number | Initialize-Disk -PartitionStyle GPT -PassThru |  New-Partition -AssignDriveLetter -UseMaximumSize
    Format-Volume  -driveletter $dl.driveletter -FileSystem NTFS  -Confirm:$false
	write-log "Disk $newdisk.number partitioned, formatted and assigned the drive letter as $dl.driveletter"
  }
 }
 else
 {
  write-log "No raw disks found"
 }
}

Partition-disk