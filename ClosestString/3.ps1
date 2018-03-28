$i = Get-Content .\in.txt | Select -Skip 1

Function hd($orig, $comp){
   $dist = 0
   for($x=0; $x -lt $orig.Length; $x++){
        if($orig[$x] -ne $comp[$x]){$dist++}
   }
   $dist
}

$total = @()

foreach($s in $i){
    $total += ,[PSCustomObject]@{String=$s;Distance=($i | % {$sum=0}{$sum +=(hd $s $_)}{$sum})}
}

$total | Sort Distance | Select -First 1 -ExpandProperty String