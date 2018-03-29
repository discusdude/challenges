# Closest String

/r/dailyprogrammer: [2018-03-05] Challenge #353 [Easy] Closest String

## Description

In theoretical computer science, the closest string is an NP-hard computational problem, which tries to find the geometrical center of a set of input strings. To understand the word "center", it is necessary to define a distance between two strings. Usually, this problem is studied with the Hamming distance in mind. This center must be one of the input strings.

In bioinformatics, the closest string problem is an intensively studied facet of the problem of finding signals in DNA. In keeping with the bioinformatics utility, we'll use DNA sequences as examples.

Consider the following DNA sequences:
```
ATCAATATCAA
ATTAAATAACT
AATCCTTAAAC
CTACTTTCTTT
TCCCATCCTTT
ACTTCAATATA
```
Using the Hamming distance (the number of different characters between two sequences of the same length), the all-pairs distances of the above 6 sequences puts `ATTAAATAACT` at the center.
Input Description

You'll be given input with the first line an integer N telling you how many lines to read for the input, then that number of lines of strings. All strings will be the same length. Example:
```
4
CTCCATCACAC
AATATCTACAT
ACATTCTCCAT
CCTCCCCACTC
```
## Output Description

Your program should emit the string from the input that's closest to all of them. Example:

AATATCTACAT

## Challenge Input
```
11
AACACCCTATA
CTTCATCCACA
TTTCAATTTTC
ACAATCAAACC
ATTCTACAACT
ATTCCTTATTC
ACTTCTCTATT
TAAAACTCACC
CTTTTCCCACC
ACCTTTTCTCA
TACCACTACTT

21
ACAAAATCCTATCAAAAACTACCATACCAAT
ACTATACTTCTAATATCATTCATTACACTTT
TTAACTCCCATTATATATTATTAATTTACCC
CCAACATACTAAACTTATTTTTTAACTACCA
TTCTAAACATTACTCCTACACCTACATACCT
ATCATCAATTACCTAATAATTCCCAATTTAT
TCCCTAATCATACCATTTTACACTCAAAAAC
AATTCAAACTTTACACACCCCTCTCATCATC
CTCCATCTTATCATATAATAAACCAAATTTA
AAAAATCCATCATTTTTTAATTCCATTCCTT
CCACTCCAAACACAAAATTATTACAATAACA
ATATTTACTCACACAAACAATTACCATCACA
TTCAAATACAAATCTCAAAATCACCTTATTT
TCCTTTAACAACTTCCCTTATCTATCTATTC
CATCCATCCCAAAACTCTCACACATAACAAC
ATTACTTATACAAAATAACTACTCCCCAATA
TATATTTTAACCACTTACCAAAATCTCTACT
TCTTTTATATCCATAAATCCAACAACTCCTA
CTCTCAAACATATATTTCTATAACTCTTATC
ACAAATAATAAAACATCCATTTCATTCATAA
CACCACCAAACCTTATAATCCCCAACCACAC
```
## Challenge Output
```
ATTCTACAACT

TTAACTCCCATTATATATTATTAATTTACCC
```
EDITED to correct the output of the first challenge.
## Bonus

Try this with various other algorithms to measuring string similarity
String metric

In mathematics and computer science, a string metric (also known as a string similarity metric or string distance function) is a metric that measures distance ("inverse similarity") between two text strings for approximate string matching or comparison and in fuzzy string searching. A necessary requirement for a string metric (e.g. in contrast to string matching) is fulfillment of the triangle inequality. For example, the strings "Sam" and "Samuel" can be considered to be close. A string metric provides a number indicating an algorithm-specific indication of distance.

The most widely known string metric is a rudimentary one called the Levenshtein distance (also known as edit distance). It operates between two input strings, returning a number equivalent to the number of substitutions and deletions needed in order to transform one input string into another. Simplistic string metrics such as Levenshtein distance have expanded to include phonetic, token, grammatical and character-based methods of statistical comparisons.

String metrics are used heavily in information integration and are currently used in areas including fraud detection, fingerprint analysis, plagiarism detection, ontology merging, DNA analysis, RNA analysis, image analysis, evidence-based machine learning, database data deduplication, data mining, incremental search, data integration, and semantic knowledge integration.