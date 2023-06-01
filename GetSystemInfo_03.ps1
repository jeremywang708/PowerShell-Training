<#
Created by Yun Wang(Jeremy) on 2023-05-31.

This script is for practice use only. Similar to the previous versions, this version allows users to
grab their own manchine data but also adds up the functionality that alerts and reports can be sent to 
user's MS email when certain events happen.
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
$reportPath = "M:\PowerShellTraining\Scripts\SystemInfo_03.txt"
$result | Out-File $reportPath

# Set up SMTP settings for MS
$smtpServer = "smtp.office365.com"
$smtpPort = 587
$smtpUser = "wang0885@algonquinlive.com"
$smtpPass = ConvertTo-SecureString "YZsuccess1013-" -AsPlainText -Force # create a SecureString object in PowerShell from a plain text password. The SecureString object encrypts the data so it can be safely stored and manipulated in memory.
$smtpCreds = New-Object System.Management.Automation.PSCredential($smtpUser, $smtpPass) # create a new PSCredential object '$smtpCreds', which is a type of object in PowerShell that can store a username and a password. This object can be used later whenever a username and a password are needed.

# Email settings
$mailFrom = "wang0885@algonquinlive.com"
$mailTo = "wangyunjeremy@gmail.com"
$mailSubject = "System INformation Report"
$mailBody = "The system information report is attached."

# Send the report
Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -Credential $smtpCreds -UseSsl -From $mailFrom -To $mailTo -Subject $mailSubject -Body $mailBody -Attachments $reportPath