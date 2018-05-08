function Decode {
    param(
        [Parameter(Position=0)][string]$a,
        [Parameter(Position=1)][string]$b,
        [Parameter(Position=2)][string]$c
    )
    $out = "" 
    if(@($a[1],$b[0],$b[1],$b[2],$c[0],$c[1],$c[2]) -notcontains ' '){$out = "8"}
    elseif(@($a[1],$b[0],$b[1],$b[2],$c[1],$c[2]) -notcontains ' '){$out = "9"}
    elseif(@($a[1],$b[0],$b[1],$c[0],$c[1],$c[2]) -notcontains ' '){$out = "6"}
    elseif(@($a[1],$b[0],$b[2],$c[0],$c[1],$c[2]) -notcontains ' '){$out = "0"}
    elseif(@($a[1],$b[0],$b[1],$c[1],$c[2]) -notcontains ' '){$out = "5"}
    elseif(@($a[1],$b[1],$b[2],$c[1],$c[2]) -notcontains ' '){$out = "3"}
    elseif(@($a[1],$b[1],$b[2],$c[0],$c[1]) -notcontains ' '){$out = "2"}
    elseif(@($b[0],$b[1],$b[2],$c[2]) -notcontains ' '){$out = "4"}
    elseif(@($a[1],$b[2],$c[2]) -notcontains ' '){$out = "7"}
    elseif(@($b[2],$c[2]) -notcontains ' '){$out = "1"}
    else{"error"}
    Write-Host -NoNewline $out
}

$In = Get-Content  .\in.txt
0..8 | % {Decode $in[0].Substring(3*$_,3) $in[1].Substring(3*$_,3) $in[2].Substring(3*$_,3)}