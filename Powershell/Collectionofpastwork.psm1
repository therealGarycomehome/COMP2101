function welcome { "Welcome to powershell! Have a Great day."}

function get-cpuinfo {get-ciminstance cim_processor | fl Manufacturer, Name, MaxClockSpeed, CurrentClockSpeed, NumberOfCores}

function get-mydisks {Get-Disk | ft Manufacturer, Model, SerialNumber, FirmwareVersion, Size}