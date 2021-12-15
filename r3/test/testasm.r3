^r3/win/console.r3

#coll 
$9B2227
$AE2012
$BB3F03
$CA6702
$EE9B01
$E9D8A4
$94D2BD
$55C9A2
$2BBB8A
$03A6B5
$07818C
$005F73

::nrubroc | nro -- color
	3 << 'coll + @ ;

:	
	0 ( 10 <? 
		dup nrubroc "%h " .println
		1 + ) drop
	;