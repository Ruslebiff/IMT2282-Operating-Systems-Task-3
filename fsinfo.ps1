if ($args.Count -eq 1)
{
    $dir = $args[0]

    # Prosent full
    $used = (Get-Volume -FilePath $dir).Size - (Get-Volume -FilePath $dir).SizeRemaining
    $percent = $used / (Get-Volume -FilePath $dir).Size
    "Partisjonen $dir befinner seg pa er $($percent * 100)% full"


    # Antall filer
    $filer = Get-ChildItem $folder -Recurse -File
    $antallFiler = $filer.Count
    "Det finnes $antallFiler filer"


    # Storste fil
    $storsteFil = ($filer | sort Length -Descending)[0]
    $storsteFilNavn = $storsteFil.FullName
    $storsteFilStorrelse = $storsteFil.Length
    "Den storste er $storsteFilNavn som er $storsteFilStorrelse B stor."

    # Gjennomsnittlig filstorrelse
    $total = $filer | Measure-Object -Property Length -sum
    $gjennomsnitt = $total.Sum / $total.Count
    "Gjennomsnittlig filstorrelse er $gjennomsnitt B"
}
else
{
	"Missing argument: directory"
}
