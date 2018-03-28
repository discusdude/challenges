$input = get-content .\in.txt | select -Skip 1

function Get-HammingDistance {
    [cmdletBinding()]
    Param([string]$string1, [string]$string2)

    $distance = 0

    0..($string1.Length - 1) | % {
        if ($string1[$_] -ne $string2[$_]) {
            $distance++
        }
    }

    $distance
}

function Get-ShortestDistance {
    [cmdletBinding()]
    Param([string[]]$strings)

    $distances = @{}

    foreach ($string1 in $strings) {
        $currentDistance = 0
        foreach ($string2 in $strings) {
            $currentDistance += Get-HammingDistance $string1 $string2
        }
        $distances.Add($string1, $currentDistance)
    }

    $distances.GetEnumerator() | sort -Property Value| select -First 1 -ExpandProperty name
}

Get-ShortestDistance $input 