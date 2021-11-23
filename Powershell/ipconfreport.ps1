get-ciminstance win32_networkadapterconfiguration| 
Where-Object IPEnabled |
Format-Table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder