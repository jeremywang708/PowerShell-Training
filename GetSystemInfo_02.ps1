<#
Created by Yun Wang(Jeremy) on 2023-05-26, 10:30 a.m.

This script is for practice use only. Similar to the first version, this version can gather more
detailed information about the system, such as the number of cores and logical processors in the CPU, 
the system's BIOS manufacturer and version, IP and MAC addresses of network interfaces, names and 
versions of installed programs, and names and IDs of currently running processes and save it to a text 
file at M:\PowerShellTraining\Scripts\SystemInfo_02.txt.
#>

# Get more detailed System Information
$os = Get-CimInstance Win32_OperatingSystem | select Caption, Version, BuildNumber, OSArchitecture, SystemDirectory, InstallDate
$cpu = Get-CimInstance Win32_Processor | select Name, Manufacturer, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
$ram = Get-CimInstance CIM_ComputerSystem | select TotalPhysicalMemory
$disk = Get-CimInstance Win32_LogicalDisk | where {$_.DriveType -eq 3} | select DeviceID, Size, FreeSpace
$bios = Get-CimInstance Win32_BIOS | select Manufacturer, SMBIOSBIOSVersion, ReleaseDate
$network = Get-CimInstance Win32_NetworkAdapterConfiguration | where {$_.IPEnabled -eq $true} | select IPAddress, MACAddress, DefaultIPGateway
$programs = Get-CimInstance Win32_Product | select Name, Version, InstallDate
$processes = Get-Process | select Name, Id, StartTime

# Combine the results
$result = New-Object PSObject -Property @{
    OperatingSystem = $os.Caption
    OSVersion = $os.Version
    OSBuildNumber = $os.BuildNumber
    OSArchitecture = $os.OSArchitecture
    SystemDirectory = $os.SystemDirectory
    OSInstallDate = $os.InstallDate
    Processor = $cpu.Name
    ProcessorManufacturer = $cpu.Manufacturer
    ProcessorSpeed = $cpu.MaxClockSpeed
    ProcessorCores = $cpu.NumberOfCores
    ProcessorLogicalProcessors = $cpu.NumberOfLogicalProcessors
    TotalRAM = $ram.TotalPhysicalMemory / 1GB
    DiskInfo = $disk
    BIOSManufacturer = $bios.Manufacturer
    BIOSVersion = $bios.SMBIOSBIOSVersion
    BIOSReleaseDate = $bios.ReleaseDate
    NetworkInfo = $network
    InstalledPrograms = $programs
    RunningProcesses = $processes
}

# Export the results to a txt file
$result | Out-File "M:\PowerShellTraining\Scripts\SystemInfo_02.txt"
