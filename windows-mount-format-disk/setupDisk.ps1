#Get-Disk | Where partitionstyle -eq 'raw' | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel 'UserData' -Confirm:$false

### Stops the Hardware Detection Service ###
Stop-Service -Name ShellHWDetection

### Grabs all the new RAW disks into a variable ###
$disk = Get-Disk | Where partitionstyle -eq 'raw'

### Starts a foreach loop that will add the drive
### and format the drive for each RAW drive 
### the OS detects ###
foreach ($d in $disk){
$diskNumber = $d.Number
$dl = get-Disk $d.Number | Initialize-Disk -PartitionStyle GPT -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize
Format-Volume -driveletter $dl.Driveletter -FileSystem NTFS -NewFileSystemLabel "Data Disk $diskNumber" -Confirm:$false
### 2 Second pause between each disk ###
### Initialization, Partitioning, and formatting ###
Start-Sleep 2
}
### Starts the Hardware Detection Service again ###
Start-Service -Name ShellHWDetection
