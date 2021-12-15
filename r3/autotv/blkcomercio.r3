^r3/autotv/ajuste.r3

|--------------------------------------------------
| DB COMERCIOS
|--------------------------------------------------

:photoname | id name dir -- adr
	mark
	over c@ 0? ( 4drop "autotv/sinfoto.png" ; ) drop
	,s "%s%d.png" ,print 0 ,c
	empty here ;

	
#dbcomercio 0
#nowcomercio 0
#cntcomercio 0


#aux * 256

#n1 * 256 #d1 * 256 #t1 * 256 #tfoto1 #trubro1
#n2 * 256 #d2 * 256 #t2 * 256 #tfoto2 #trubro2
#n3 * 256 #d3 * 256 #t3 * 256 #tfoto3 #trubro3
#n4 * 256 #d4 * 256 #t4 * 256 #tfoto4 #trubro4

:comercio@ | rubro foto t d n --
	nowcomercio dbcomercio getdbrow >a | nro 'db -- 'row
	1 a> getdbfld swap cpydbfld | fld 'str -- nombre
	2 a> getdbfld swap cpydbfld | fld 'str -- direccion
	|3 a> getdbfld swap cpydbfld | fld 'str -- telefono

	3 a> getdbfld over cpydbfld | fld 'str -- telefono
	dup c@ 0? ( 4 a> getdbfld pick2 cpydbfld ) 2drop | telefonofijo
	
	6 a> getdbfld 'aux cpydbfld 
	0 a> getdbfld str>nro nip 
	'aux "autotv/file-com/" photoname loadimg swap ! 
	7 a> getdbfld str>nro nip swap !
	1 'nowcomercio +!	
	nowcomercio cntcomercio >=? ( 0 'nowcomercio ! ) drop	
	;


:loadfirst
	'trubro1 'tfoto1 't1 'd1 'n1 comercio@
	'trubro2 'tfoto2 't2 'd2 'n2 comercio@
	'trubro3 'tfoto3 't3 'd3 'n3 comercio@
	'trubro4 'tfoto4 't4 'd4 'n4 comercio@
	trubro2 'nowrubro !
	;
	
:loadnext
	tfoto1 unloadimg
	'n2 'n1 strcpy 'd2 'd1 strcpy 't2 't1 strcpy tfoto2 'tfoto1 ! trubro2 'trubro1 !
	'n3 'n2 strcpy 'd3 'd2 strcpy 't3 't2 strcpy tfoto3 'tfoto2 ! trubro3 'trubro2 !
	'n4 'n3 strcpy 'd4 'd3 strcpy 't4 't3 strcpy tfoto4 'tfoto3 ! trubro4 'trubro3 !
	'trubro4 'tfoto4 't4 'd4 'n4 comercio@
	trubro3 'nowrubro !
	;
	
:unload
	tfoto1 unloadimg
	tfoto2 unloadimg
	tfoto3 unloadimg
	tfoto4 unloadimg
	;
		

|-------------------------------
#col

:caja1 0.05 0.036 0.275 0.72 xywh%64 ;

:caja2 0.363 0.036 0.275 0.72 xywh%64 ;
|:caja2 0.353 0.029 0.285 0.74 xywh%64 ;

:caja3 0.672 0.036 0.275 0.72 xywh%64 ;	
:caja-1 -0.363 0.036 0.275 0.72 xywh%64 ;	
:caja4 1.085 0.036 0.275 0.72 xywh%64 ;	
:cajau1 0.05 -1.0 0.275 0.72 xywh%64 ;
:cajau2 0.363 -1.0 0.275 0.72 xywh%64 ;
:cajau3 0.672 -1.0 0.275 0.72 xywh%64 ;	
	
:foto1	0.05 0.036 0.275 0.366 xywh%64 ;
	
:foto2	0.363 0.036 0.275 0.366 xywh%64 ;	
|:foto2	0.353 0.026 0.285 0.385 xywh%64 ;	

:foto3	0.672 0.036 0.275 0.366 xywh%64 ;	
:foto4	1.085 0.036 0.275 0.366 xywh%64 ;	
:foto-1 -0.363 0.036 0.275 0.366 xywh%64 ;	
:fotou1	0.05 -1.0 0.275 0.366 xywh%64 ;	
:fotou2	0.363 -1.0 0.275 0.366 xywh%64 ;	
:fotou3	0.672 -1.0 0.275 0.366 xywh%64 ;	

:nom1	0.06 0.402 0.255 0.128 xywh%64 ;
:nom2	0.373 0.402 0.255 0.128 xywh%64 ;
:nom3	0.682 0.402 0.255 0.128 xywh%64 ;
:nom4	1.095 0.402 0.255 0.128 xywh%64 ;
:nom-1	-0.373 0.402 0.255 0.128 xywh%64 ;

:dir1	0.05 0.47 0.275 0.128 xywh%64 ;
:dir2	0.363 0.47 0.275 0.128 xywh%64 ;
:dir3	0.672 0.47 0.275 0.128 xywh%64 ;
:dir4	1.085 0.47 0.275 0.128 xywh%64 ;
:dir-1	-0.363 0.47 0.275 0.128 xywh%64 ;

:tel1	0.05 0.58 0.275 0.128 xywh%64 ;
:tel2	0.363 0.58 0.275 0.128 xywh%64 ;
:tel3	0.672 0.58 0.275 0.128 xywh%64 ;
:tel4	1.085 0.58 0.275 0.128 xywh%64 ;
:tel-1	-0.363 0.58 0.275 0.128 xywh%64 ;

	
:entran3
|------------- columna 1
|trubro1 nrubroc 'col !
0 $ffffff +box 0.0  +fx.on
	cajau1 caja1 'Quad_Out 0.8 0.0 +fx.box	
tfoto1 0 +imgar 0.0 +fx.on
	fotou1 foto1 'Quad_Out 0.8 0.0  +fx.box	
fntbold 'n1 0 $11001A24 +tbox 0.0 +fx.on 
	fotou1 nom1 'Quad_Out 0.8 0.0 +fx.box	
fntboldb 't1 0 $11001A24 +tbox 0.0 +fx.on
	fotou1 tel1 'Quad_Out 0.8 0.0 +fx.box	
fntboldd 'd1 0 $11666666 +tbox 0.0 +fx.on
	fotou1 dir1 'Quad_Out 0.8 0.0 +fx.box	
|------------- columna 2
|trubro2 nrubroc 'col !
0 $ffffff +box 0.1 +fx.on
	cajau2 caja2 'Quad_Out 0.8 0.1 +fx.box	
tfoto2 0 +imgar 0.1 +fx.on
	fotou2 foto2 'Quad_Out 0.8 0.1  +fx.box	
fntbold 'n2 0 $11001A24 +tbox 0.1 +fx.on 
	fotou2 nom2 'Quad_Out 0.8 0.1  +fx.box	
fntboldb 't2 0 $11001A24 +tbox 0.1 +fx.on
	fotou2 tel2 'Quad_Out 0.8 0.1  +fx.box	
fntboldd 'd2 0 $11666666 +tbox 0.1 +fx.on
	fotou2 dir2 'Quad_Out 0.8 0.1  +fx.box	
|------------- columna 3
|trubro3 nrubroc 'col !
0 $ffffff +box 0.2  +fx.on
	cajau3 caja3 'Quad_Out 0.8 0.2  +fx.box		
tfoto3 0 +imgar 0.2 +fx.on
	fotou3 foto3 'Quad_Out 0.8 0.2  +fx.box		
fntbold 'n3 0 $11001A24 +tbox 0.2  +fx.on 
	fotou3 nom3 'Quad_Out 0.8 0.2  +fx.box		
fntboldb 't3 0 $11001A24 +tbox 0.2  +fx.on
	fotou3 tel3 'Quad_Out 0.8 0.2  +fx.box		
fntboldd 'd3 0 $11666666 +tbox 0.2  +fx.on
	fotou3 dir3 'Quad_Out 0.8 0.2  +fx.box		
;

:salen3
|------------- columna 1
|trubro2 nrubroc 'col !
caja1 $ffffff +box 0.0  +fx.on
	caja1 cajau1 'Quad_Out 0.8 0.0  +fx.box	
tfoto1 0 +imgar 0.0  +fx.on
	foto1 fotou1 'Quad_Out 0.8 0.0  +fx.box	
fntbold 'n2 0 $11001A24 +tbox 0.0  +fx.on 
	nom1 fotou1 'Quad_Out 0.8 0.0  +fx.box	
fntboldb 't2 0 $11001A24 +tbox 0.0  +fx.on
	tel1 fotou1 'Quad_Out 0.8 0.0  +fx.box	
fntboldd 'd2 0 $11666666 +tbox 0.0  +fx.on
	dir1 fotou1 'Quad_Out 0.8 0.0  +fx.box	
|------------- columna 2
|trubro3 nrubroc 'col !
caja2 $ffffff +box 0.0  +fx.on
	caja2 cajau2 'Quad_Out 0.8 0.1  +fx.box	
tfoto2 foto2 +imgar 0.0  +fx.on
	foto2 fotou2 'Quad_Out 0.8 0.1  +fx.box	
fntbold 'n3 nom2 $11001A24 +tbox 0.0  +fx.on 
	nom2 fotou2 'Quad_Out 0.8 0.1  +fx.box	
fntboldb 't3 tel2 $11001A24 +tbox 0.0  +fx.on
	tel2 fotou2 'Quad_Out 0.8 0.1  +fx.box	
fntboldd 'd3 dir2 $11666666 +tbox 0.0  +fx.on
	dir2 fotou2 'Quad_Out 0.8 0.1  +fx.box	
|------------- columna 3
|trubro4 nrubroc 'col !
caja3 $ffffff +box 0.0  +fx.on
	caja3 cajau3 'Quad_Out 0.8 0.2  +fx.box		
tfoto3 foto3 +imgar 0.0  +fx.on
	foto3 fotou3 'Quad_Out 0.8 0.2  +fx.box		
fntbold 'n4 nom3 $11001A24 +tbox 0.0  +fx.on 
	nom3 fotou3 'Quad_Out 0.8 0.2  +fx.box		
fntboldb 't4 tel3 $11001A24 +tbox 0.0  +fx.on
	tel3 fotou3 'Quad_Out 0.8 0.2  +fx.box		
fntboldd 'd4 dir3 $11666666 +tbox 0.0  +fx.on
	dir3 fotou3 'Quad_Out 0.8 0.2  +fx.box		
;

:cambia1
|------------- columna 1>sale
|trubro1 nrubroc 'col !
0 $ffffff +box 0.0  +fx.on
	caja1 caja-1 'Quad_Out 0.8 0.0  +fx.box	
tfoto1 0 +imgar 0.0  +fx.on
	foto1 foto-1 'Quad_Out 0.8 0.0  +fx.box	
fntbold 'n1 0 $11001A24 +tbox 0.0  +fx.on 
	nom1 nom-1 'Quad_Out 0.8 0.0  +fx.box	
fntboldb 't1 0 $11001A24 +tbox 0.0  +fx.on
	tel1 tel-1 'Quad_Out 0.8 0.0  +fx.box	
fntboldd 'd1 0 $11666666 +tbox 0.0  +fx.on
	dir1 dir-1 'Quad_Out 0.8 0.0  +fx.box	
|------------- columna 2>1
|trubro2 nrubroc 'col !
0 $ffffff +box 0.0  +fx.on
	caja2 caja1 'Quad_Out 0.8 0.0  +fx.box	
tfoto2 0 +imgar 0.0  +fx.on
	foto2 foto1 'Quad_Out 0.8 0.0  +fx.box	
fntbold 'n2 0 $11001A24 +tbox 0.0  +fx.on 
	nom2 nom1 'Quad_Out 0.8 0.0  +fx.box	
fntboldb 't2 0 $11001A24 +tbox 0.0  +fx.on
	tel2 tel1 'Quad_Out 0.8 0.0  +fx.box	
fntboldd 'd2 0 $11666666 +tbox 0.0  +fx.on
	dir2 dir1 'Quad_Out 0.8 0.0  +fx.box	
|------------- columna 3>2
|trubro3 nrubroc 'col !
0 $ffffff +box 0.0  +fx.on
	caja3 caja2 'Quad_Out 0.8 0.0  +fx.box	
tfoto3 0 +imgar 0.0  +fx.on
	foto3 foto2 'Quad_Out 0.8 0.0  +fx.box	
fntbold 'n3 0 $11001A24 +tbox 0.0  +fx.on 
	nom3 nom2 'Quad_Out 0.8 0.0  +fx.box	
fntboldb 't3 0 $11001A24 +tbox 0.0  +fx.on
	tel3 tel2 'Quad_Out 0.8 0.0  +fx.box	
fntboldd 'd3 0 $11666666 +tbox 0.0  +fx.on
	dir3 dir2 'Quad_Out 0.8 0.0  +fx.box	
|------------- columna entra>3
|trubro4 nrubroc 'col !
0 $ffffff +box 0.0  +fx.on
	caja4 caja3 'Quad_Out 0.8 0.0  +fx.box		
tfoto4 0 +imgar 0.0  +fx.on
	foto4 foto3 'Quad_Out 0.8 0.0  +fx.box		
fntbold 'n4 0 $11001A24 +tbox 0.0  +fx.on 
	nom4 nom3 'Quad_Out 0.8 0.0  +fx.box		
fntboldb 't4 0 $11001A24 +tbox 0.0  +fx.on
	tel4 tel3 'Quad_Out 0.8 0.0  +fx.box		
fntboldd 'd4 0 $11666666 +tbox 0.0  +fx.on
	dir4 dir3 'Quad_Out 0.8 0.0  +fx.box		
;

	
|-------------------------------------------	
|-------
|-------------------------------------------

#colfondo 0
#modo 0

:conext
	modo 4 >> 1 >? ( loadnext ) drop | no cargar primero
	timeline.clear
	cambia1
	barraline
	[ $11 'modo +! ; ] 10.0 +event	| tiempo de exposicion
	timeline.start
	;

:conend
	timeline.clear
	salen3
	barraline
	'pexit 1.0 +event
	timeline.start
	;
	
:cambiomodo
	modo 
	dup $fff0 and 'modo !
	4 >>
	15 <? ( conext ) | cantidad de comercios
	15 >=? ( conend )
	drop
	nowrubro nrubroc 'colfondo !
	;
	
:coini 
	0 'modo !
	loadfirst

	timeline.clear
	entran3
	barraline
	[ $11 'modo +! ; ] 10.0 +event | tiempo del exposicion
	timeline.start
	nowrubro nrubroc 'colfondo !
	;

:corun 
	colfondo SDLClear
	timeline.draw 
	modo $1 and? ( cambiomodo ) drop
	;
	
:cofin	
	unload
	;
	
##prgcomercio 'coini 'corun 'cofin

::reloaddbcomercio
	"autotv/cli.db" loaddb 'dbcomercio !
	dbcomercio cntdbrow 
	'cntcomercio !
	;
