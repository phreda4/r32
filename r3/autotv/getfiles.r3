| Test WININET
| PHREDA 2021

^r3/win/core.r3
^r3/win/inet.r3
^r3/win/console.r3
^r3/util/dbtxt.r3
^r3/lib/parse.r3

#fotopro "http://localhost/guia/guia-comercial/file-pro/"
#fotocom "http://localhost/guia/guia-comercial/file-com/"
#dbpro "http://localhost/guia/guia-comercial/panel/getpro.php"
#dbcom "http://localhost/guia/guia-comercial/panel/getcli.php"

|#fotopro "http://guianet.com.ar/file-pro/"
|#fotocom "http://guianet.com.ar/file-com/"
|#dbpro "http://guianet.com.ar/panel/getpro.php"
|#dbcom "http://guianet.com.ar/panel/getcli.php"

:,h2
	$ff and 16 <? ( "0" ,s ) ,h ;
	
:foton | id "" "" --
	mark
	,s 
	over 24 >> ,h2 "/" ,s 
	over 16 >> ,h2 "/" ,s
	"%s%d.png" ,print 0 ,c
	empty 
	here ;
	
	
:savefilepng | "file" "url" --
	mark 0 here openurl 'here ! savemem empty  ;
	
#db

#nro
#foto * 256
#filen * 1024

| 0:id 3-foto
:printline | adr --
	dup str>nro 'nro ! drop |'str cpydbfld 'str .print sp
	3 swap getdbfld 'foto cpydbfld
	
	'foto c@ 0? ( drop ; ) drop
	nro 'foto 'fotopro foton
	.print cr
	
	nro 'foto "autotv/file-pro/%s%d.png" sprint 'filen strcpy
	
	'filen
	nro 'foto 'fotopro foton
|	.print sp .print
	savefilepng
	;
	
:getfoto
	"autotv/pro.db" loaddb 'db !
	db ( 
		dup printline 
		>>line 
		dup c@ 1? drop
		) 2drop ;

|--cliente
|$reg['id'].'|'. $reg['nombre'].'|'. $reg['direccion'].'|'. $reg['telefono'].'||'. $reg['ubicacion'].'|'. $reg['fotos'].'|'. $reg['rubro'].'^';

|0 :id 6 :foton
:printline | adr --
	dup str>nro 'nro ! drop |'str cpydbfld 'str .print sp
	6 swap getdbfld 'foto cpydbfld
	
	'foto c@ 0? ( drop ; ) drop
	nro 'foto 'fotocom foton
	.print cr
	
	nro 'foto "autotv/file-com/%s%d.png" sprint 'filen strcpy
	
	'filen
	nro 'foto 'fotocom foton
|	.print sp .print
	savefilepng
	;
	
:getfotoc
	"autotv/cli.db" loaddb 'db !
	db (
		dup printline 
		>>line 
		dup c@ 1? drop
		) 2drop ;


:savedb
	mark
	'dbpro 0 here openurl 'here !
	"autotv/pro.db" savemem
	empty 

	mark
	'dbcom 0 here openurl 'here !
	"autotv/cli.db" savemem
	empty 
	;
	

#cnt

: 
.cls
"loading..." .println
savedb
getfoto
getfotoc
"ready" .println
.input
;
