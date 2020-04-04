for ($i = 0; $i -lt $args.Count; $i++) {
       $dato = Get-Date -Format "yyyyMMdd-HHmmss"
       $filnavn = $args[$i].toString() +"--"+"$dato"+".meminfo"

       Add-Content $filnavn "******** Minneinfo om prosess med PID $($args[$i]) ********"
       Add-Content $filnavn "Total virtuelt minne: $((Get-Process -Id $args[$i]).VirtualMemorySize/ 1MB) MB"
       Add-Content $filnavn "Størrelse på Working Set: $((Get-Process -Id $args[$i]).WorkingSet/ 1KB) KB`n"
}
