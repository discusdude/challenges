$line = Get-Content .\in.txt

$Message = $line.split(' ')[1]
$Cipher = $line.split(' ')[0]
for ($i = 0; $i -lt $Message.length; $i++) {
    $c = [char]([int]$Cipher[$i % $Cipher.length] + 
        ([int]$Message[$i] - [int][char]'a'))
    if ($c -gt [int][char]'z') {
        $c = [int]$c - 26
    }
    write-host $([char]$c) -NoNewline
}