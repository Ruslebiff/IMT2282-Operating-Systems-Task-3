
$valg = 0

do {
    Write-Output "
    1 - Hvem er jeg og hva er navnet paa dette scriptet?
    2 - Hvor lenge er det siden siste boot?
    3 - Hvor mange prosesser og traader finnes?
    4 - Hvor mange context switch'er fant sted siste sekund?
    5 - Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund?
    6 - Hvor mange interrupts fant sted siste sekund?
    9 - Avslutt"
    $valg = Read-Host -Prompt 'Valg: '

    switch ($valg) {
        1 {
            "Jeg er $([Environment]::UserName) og navnet paa dette scriptet er $($MyInvocation.MyCommand.Name)";
            break;
          }
        2 {
            "Tid siden siste boot: $((get-date) - (gcim Win32_OperatingSystem).LastBootUpTime)"
            break;
        }
        3 {
            $prosesser = (get-CimInstance Win32_PerfFormattedData_PerfOS_System).Processes
            $traader = (get-CimInstance Win32_PerfFormattedData_PerfOS_System).Threads
            "Det finnes $prosesser prosesser og $traader traader"
            break;
        }
        4 {
            "Context switcher siste sekund: $((get-CimInstance Win32_PerfFormattedData_PerfOS_System).ContextSwitchesPersec)"
            break;
        }
        5 {
            

            break;
        }
        6 {

            break;
        }
        Default {
            break;
        }
    }
} while ($valg -ne 9)
