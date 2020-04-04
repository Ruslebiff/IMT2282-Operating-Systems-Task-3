
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

            $userTime = $((Get-Counter -Counter "\prosessor(_total)\% Brukermodustid" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue)
            $kernelTime = $((Get-Counter -Counter "\prosessor(_total)\% Systemmodustid" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue)
            "Kernelmode: $kernelTime Usermode: $userTime"
            break;
        }
        6 {
            "Interrupts siste sekund: $((Get-Counter -Counter "\prosessor(_total)\Avbrudd/sek").CounterSamples.CookedValue)"
            break;
        }
        Default {
            break;
        }
    }
} while ($valg -ne 9)
