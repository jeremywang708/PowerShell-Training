<#
Created by Yun Wang(Jeremy) on 2023-05-26, 9:00 a.m.

This script is for practice use only. It is used to gather data about the Operating System, CPU, RAM, 
and Disk drives and save it to a text file at M:\PowerShellTraining\Scripts\SystemInfo_01.txt. The disk 
information will include the drive letter, total size in bytes, and free space in bytes for each disk 
that has a drive type of 3 (which typically refers to local hard disks).
#>

<# Get System Information
The first part of the script uses the Get-CimInstance cmdlet to retrieve information about various 
hardware and software aspects of the system.
#>
$os = Get-CimInstance Win32_OperatingSystem | select Caption, Version, BuildNumber
$cpu = Get-CimInstance Win32_Processor | select Name, Manufacturer, MaxClockSpeed
$ram = Get-CimInstance Win32_ComputerSystem | select TotalPhysicalMemory
$disk = Get-CimInstance Win32_LogicalDisk | where {$_.DriveType -eq 3} | select DeviceID, Size, FreeSpace

<# Combine the results
After gathering the system information, the script creates a new PowerShell object to store this information 
in a structured manner.
#>
$result = New-Object PSObject -Property @{
    OperatingSystem = $os.Caption
    OSVersion = $os.Version
    OSBuildNumber = $os.BuildNumber
    Processor = $cpu.Name
    ProcessorManufacturer = $cpu.Manufacturer
    ProcessorSpeed = $cpu.MaxClockSpeed
    TotalRAM = $ram.TotalPhysicalMemory / 1GB
    DiskInfo = $disk
}

# Export the results to a txt file
# Finally, the script exports the gathered information to a text file using the Out-File cmdlet.
$result | Out-File "M:\PowerShellTraining\Scripts\SystemInfo_01.txt"
