for ($i = 0; $i -lt $args.Count; $i++) {
       $dato = Get-Date -Format "yyyyMMdd-HHmmss"
       $filnavn = $args[$i].toString() +"--"+"$dato"+".meminfo"

       Add-Content -Encoding UTF8 $filnavn "******** Minneinfo om prosess med PID $($args[$i]) ********"
       Add-Content -Encoding UTF8 $filnavn "Total virtuelt minne: $((Get-Process -Id $args[$i]).VirtualMemorySize/ 1MB) MB"
       Add-Content -Encoding UTF8 $filnavn "Størrelse på Working Set: $((Get-Process -Id $args[$i]).WorkingSet/ 1KB) KB`n"
}
