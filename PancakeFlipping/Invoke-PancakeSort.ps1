[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 1)]
    [ValidateScript({test-path $_})]
    [string]$file
)

function GetBase {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 1)]
        [int[]]$Array
    )
    $Base = -1
    $i = 0
    $Max = [int]::MinValue
    [int]$Last = $null
    $Array.ForEach( {
        if ($last -ne $null) {
            if ($_ -gt $Max) {
                $Max = $_
            }
            if ($_ -lt $Last -or $_ -lt $Max) {
                $Base = $i
            }
        }
        $Last = $_
        $i++
    })
    $Base
}

function Start-PancakeSort {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 1)]
        [int[]]$Pancakes
    )
    [int[]]$Sorted = $Pancakes.Clone()
    [array]::Sort($Sorted)

    $StackBase = $null                  #The index of the base of the unsorted part of the stack.
                                        #Anything below the stack base is already sorted.
    $Flips = 0
    while (-not ([System.Linq.Enumerable]::SequenceEqual($Pancakes, $Sorted))) {
        #Find unsorted stack base and location of biggest pancake
        [int]$StackBase = GetBase $Pancakes
        [int]$Max = [system.linq.Enumerable]::Max([int[]]$Pancakes[0..$StackBase])
        #[int]$Max = ($Pancakes[0..$StackBase] | measure -Maximum).Maximum
        $MaxIndex = [array]::LastIndexOf($Pancakes, $Max, $StackBase) #GetMaxIndex $Stack $StackBase

        #Put largest on top
        if ($MaxIndex -ne 0) {
            [array]::Reverse($Pancakes, 0, $MaxIndex + 1)
            $Flips++
        }
        
        #Put current largest on top of stackbase
        if ($StackBase -ne 0) {
            [array]::Reverse($Pancakes, 0, $StackBase + 1)
            $Flips++
        }
        
    }

    "Total Flips: $Flips"
}

[int[]]$Pancakes = Get-Content $file | Select-Object -Skip 1 | ForEach-Object {$_ -split ' '}
Start-PancakeSort $Pancakes