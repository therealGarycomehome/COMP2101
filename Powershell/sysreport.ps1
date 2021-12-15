$hard = Get-CimInstance cim_computersystem
$hardF= $hard | Select-Object domain, 
                          manufacturer, 
                          model, 
                          name, 
                          Primaryownername,
                          @{n="TotalMemory(MB)";e={$_.totalphysicalmemory/1mb -as [int]}}

function hardware-desc { $hardF |fl          
} 
   


"====================
 HARWARE DESCRIPTION
====================="
 hardware-desc

 $osdesc=gwmi win32_operatingsystem
 $osdescF = $osdesc | select systemdirectory,
                             @{n="organization";e={"DATA UNAVALIBLE"}},
                             buildnumber,
                             registereduser,
                             serialnumber,
                             version


function os-desc {$osdescF | fl}

 
"====================
 OPERATING SYSTEM
====================="
os-desc


$cpudesc= gwmi win32_processor
$cpudescF= $cpudesc | select description,
                             @{n="Speed(Mhz)";e={$_.currentclockspeed}},
                             numberofcores,
                             @{n="L1cachesize";e={"DATA UNAVALIBLE"}},
                             @{n="L2cachesize";e={"DATA UNAVALIBLE"}},
                             L3cachesize

function cpu-info{$cpudescF |fl}
"====================
 CPU INFORMATION
====================="
 cpu-info

 $ramdesc = gwmi win32_physicalmemory
 $ramdescF= $ramdesc | select manufacturer,
                              description, 
                              @{n="capacity(MB)";e={$_.capacity/1mb -as [int]}}, 
                              banklabel
$totalram= $ramdesc.Capacity/1gb -as [int]



 function ram-desc {$ramdescF | ft }
 function total-ram{Write-Host "$($totalramdis)"}
  
"====================
 RAM DESCRIPTION
====================="
ram-desc
$totalramdis = Write-Host "the total amount of RAM installed is $($totalram) GB "
function total-ram{Write-Host "$($totalramdis)"}
total-ram



function net-desc {get-ciminstance win32_networkadapterconfiguration| 
Where-Object IPEnabled |
Format-Table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder}




"========================
 NETWORK ADAPTER CONFIG
========================="
net-desc


$grapdesc=gwmi win32_videocontroller
$grapdescF =$grapdesc | select @{n="vendor";e={$grapdesc.AdapterCompatibility}}, 
                               description,
                               @{n="Resolution";e={"$($grapdesc.CurrentHorizontalResolution) x $($grapdesc.CurrentverticalResolution)"}}

function graphics-desc {$grapdescF | fl}
    



"=====================
 GRAPHICS DESCRIPTION
======================"
graphics-desc
