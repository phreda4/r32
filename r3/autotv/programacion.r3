| Programacion
| PHREDA 2021

^r3/win/console.r3

|--- programa
| blkajuste
| blk hora-temperatura
| blkcomercio
| blkproductos

|--- generico
| video (archivo)
| carpeta video (carpeta)
| image (archivo)
| carpeta image (carpeta)

| placa (archivo) -> imagen -> texto


#memprog * 1024
#memprog> 'memprog

#memstr * 8192
#memstr> 'memstr

:resetmem
	'memstr 'memstr> ! ;
	
:,str | "" -- str
	memstr> dup rot
	( c@+ 1? 
		rot c!+ swap ) 
	rot c!+ 'memstr> !
	drop ;
	
:,strfld | 'adrto| -- str
	memstr> dup rot
	( c@+ 1? 
		$7c <>? | |
	 	$5e <>? | ^	
		rot c!+ swap ) 
	drop 0
	rot c!+ 'memstr> !
	drop ;



#programa
0
"ajuste "
"gn-com "
"gn-pro "
"video  "
"videos "
"placa  "

:printp
	3 << 'programa + .print ;
	
| 240 lugares - bloques de 10 min 
#programacion * 1920

:printhoy
	'programacion >a
	0 ( 96 <? 
		dup $3 and 15 * over 2 >> "%d:%d " .print
		a@+ printp
		cr
		1 + ) drop ;

:ahora
	time
	dup 16 >> $ff and "%d:" .print
	8 >> $ff and 15 / 15 * "%d" .print cr
	;	
		
:hmref
	time 
	;
	
:test
	"Inicio programacion" .println
	time "%h" .print
|	'programacion >a 8 a+
|	1 a!+ 2 a!+ 2 a!+ 3 a!+	4 a!+

|	printhoy
	
	ahora
	;
	
:reloadprog | "fl" --
	.cls
	dup "cargando %s..." .println

	mark
	here swap load 0 swap !
	'memstr 'memstr> !		| reset string
	'memprog 'memprog> !	| reset prog
	
	here ( dup c@ 1? drop
		) 2drop
	
	empty
	;	
	
:ini
	"autotv/programa.txt" reloadprog
	;

: ini test ;
