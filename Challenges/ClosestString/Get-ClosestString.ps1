[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$file
)

[string[]]$Strings = @()
$StringObj = @{}
foreach($string in (get-content $file | select -Skip 1)){
#1..$expect | %{
    $in = $string
    $Parts = @{
        String = $in
        Distance = 0
        Visited = @($in)
    }
    $Strings += $in
    $StringObj[$in] = New-Object -Type PSObject -Property $Parts
}
[int]$CurrentShortest = [int]::MaxValue
$CurString = ""

foreach($OuterString in $Strings){
    foreach($InnerString in $Strings){
        if($StringObj[$OuterString].Visited -notcontains $InnerString){
            $diff = 0
            #"Compairing $OuterString and $InnerString"
            for($i = 0; $i -lt $OuterString.Length;$i++){
                $char1 = $([char[]]$OuterString[$i])
                $char2 = $([char[]]$InnerString[$i])
                if($char1 -ne $char2){
                    #"$char1 is diff to $char2"
                    $diff++
                }
            }
            $StringObj[$OuterString].Distance += $diff
            $StringObj[$InnerString].Distance += $diff
            $StringObj[$OuterString].Visited += $InnerString
            $StringObj[$InnerString].Visited += $OuterString
            #"`r`n`r`n"
        }
    }
    if($StringObj[$OuterString].Distance -lt $CurrentShortest){
        $CurrentShortest = $StringObj[$OuterString].Distance
        #"$OuterString with $($StringObj[$OuterString].Distance) is shorter than $CurString with $($StringObj[$CurrentShortest].Distance)"
        $CurString = $OuterString
    }
}

$CurString
#$StringObj.values | sort Distance | select -first 1 -ExpandProperty String

#run with
#1..20 | % {measure-command {.\Get-ClosestString.ps1 -file 'C:\Users\fskylart\OneDrive\Documents\PowerShell Scripts\challenges\ClosestString\in.txt'}} | select -ExpandProperty TotalSeconds | sort | select -First 1