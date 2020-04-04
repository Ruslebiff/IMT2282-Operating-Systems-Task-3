Get-Process chrome | Select-Object Name, ID, @{Name='#Threads';Expression = {$_.Threads.Count}}
