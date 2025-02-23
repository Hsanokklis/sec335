param(
   [Parameter(Mandatory = $true)]
   [string]$NetworkPrefix,
   [Parameter(Mandatory = $true)]
   [string]$DNSServer
)

for ($i = 1; $i -le 254; $i++) {
    $IPAddress = "$NetworkPrefix.$i"

try {
     $result = Resolve-DnsName -Name $IPAddress -Server $DNSServer -ErrorAction stop
     Write-Output "IP: $IPAddress - Hostname $($result.NameHost)"
} catch { 
     continue

}
}