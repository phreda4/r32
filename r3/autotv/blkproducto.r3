^r3/autotv/ajuste.r3

|--------------------------------------------------
| DB PRODUCTO

:fotoprod | id name -- adr
	mark
	dup c@ 0? ( 4drop "autotv/sinfoto.png" ; ) drop
	"autotv/file-pro/%s%d.png" ,print 0 ,c
	empty here ;
	
|---------------- cartel simple
	
#dbpro
#cntpro
#dbpronow 0
#tiendanow

#tiendanom * 64
#tiendatel * 64
#tiendadir * 64

#prodcnt
#prodnom * 80
#prodpre * 80
#prodfot * 80

:pnom! prodcnt 3 << 'prodnom + ! ;
:ppre! prodcnt 3 << 'prodpre + ! ;
:pfot! prodcnt 3 << 'prodfot + ! ;

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
	
#aux * 16
	
|id idc nombre  precio foto || nombret urlname telefono telefonof direccion email fotos trubro rubro

:loadpp
	dbpronow dbpro getdbrow | fldnow
	2 over getdbfld ,strfld pnom!
	3 over getdbfld ,strfld ppre!
	4 over getdbfld 'aux cpydbfld
	0 over getdbfld str>nro nip 
	'aux fotoprod loadimg pfot!
	drop
	1 'prodcnt +!
	1 'dbpronow +!
	dbpronow cntpro >=? ( 0 'dbpronow ! ) drop
	;


:loadtiendapro 
	dbpronow dbpro getdbrow | fldnow
	1 over getdbfld str>nro nip 'tiendanow ! 
	5 over getdbfld 'tiendanom cpydbfld | nombre tienda
	7 over getdbfld 'tiendatel cpydbfld | telefono
	'tiendatel c@ 0? ( 8 pick2 getdbfld 'tiendatel cpydbfld ) drop | telefono fijo

	9 over getdbfld 'tiendadir cpydbfld | direccion
	drop
	resetmem
	0 'prodcnt !
	(	loadpp
		dbpronow dbpro getdbrow | fldnow	
		1 swap getdbfld str>nro nip 
		tiendanow =? drop | de la misma tienda
		) drop ;
	
:dumppp
	0 ( prodcnt <? 
		dup 3 << 
		dup 'prodnom + @ .println
		dup 'prodpre + @ .println
		dup 'prodfot + "%h" .println
		"---" .println
		drop
		1 + ) drop 
	'memstr ( memstr> <? 
		c@+ emit ) drop
		
	;
		

|-- reset db productos
::reloaddbproductos
	"autotv/pro.db" loaddb 'dbpro !
	dbpro cntdbrow 'cntpro !
	0 'dbpronow !
	;

|-------------------------------------------------------	
#tpro

:preciocartel
	fntprecio 
	over 3 << 'prodpre + @
	dup c@ 0? ( 3drop ; ) drop
		
	0.05 0.66 0.15 0.066 xywh%64 $001A24 +box 
		tpro +fx.on 		
		-0.3 0.66 0.15 0.066 xywh%64 0.05 0.66 0.15 0.066 xywh%64 'Quad_out 1.0
		tpro +fx.box
		0.05 0.66 0.15 0.066 xywh%64 -0.3 0.66 0.15 0.066 xywh%64 'Quad_out 1.0
		tpro 9.0 + +fx.box
		tpro 10.0 + +fx.off
		
	|drop "$40.000"
	0.05 0.67 0.15 0.066 xywh%64 $01ffffff +tbox
		tpro +fx.on 		
		-0.3 0.67 0.15 0.066 xywh%64 0.05 0.67 0.15 0.066 xywh%64 'Quad_out 1.0
		tpro +fx.box
		0.05 0.67 0.15 0.066 xywh%64 -0.3 0.67 0.15 0.066 xywh%64 'Quad_out 1.0
		tpro 9.0 + +fx.box
		tpro 10.0 + +fx.off
	
	;
	
:cartelini
	loadtiendapro 
	11 'nowrubro !
	timeline.clear

|-------- productos	fotos (atras)
	0 'tpro !
	0 ( prodcnt <? 
		dup 3 << 'prodfot + @ 
		0.36 0.0 0.7 0.8 xywh%64 +imgar
	
		tpro +fx.on
		-1.0 0.0 0.7 0.8 xywh%64 0.36 0.0 0.7 0.8 xywh%64 'Quad_Out 1.0
		tpro +fx.box
		0.36 0.0 0.7 0.8 xywh%64 1.3 0.0 0.7 0.8 xywh%64 'Quad_Out 1.0
		tpro 9.0 + +fx.box
		10.0 'tpro +!
		1 + ) drop

|----- tienda
0.0 0.0 0.363 1.0 xywh%64 $eeeeee +box 0.0 +fx.on
	
fntbold2 'tiendanom 0.05 0.03 0.276 0.166 xywh%64 $01333333 +tbox 
0.0 +fx.on	
	-0.3 0.03 0.276 0.166 xywh%64 0.05 0.03 0.276 0.166 xywh%64 'Quad_out 1.0
	0.0 +fx.box

fntboldd 'tiendadir 0.05 0.165 0.276 0.05 xywh%64 $01666666 +tbox 
0.0 +fx.on	
	-0.3 0.165 0.276 0.05 xywh%64 0.05 0.165 0.276 0.05 xywh%64 'Quad_out 1.0
	0.0 +fx.box

fntboldb 'tiendatel 0.05 0.24 0.276 0.101 xywh%64 $01001A24 +tbox 
0.0 +fx.on	
	-0.3 0.24 0.276 0.101 xywh%64 0.05 0.24 0.276 0.101 xywh%64 'Quad_out 1.0
	0.0 +fx.box

0.05 0.35 0.27 0.002 xywh%64 $666666 +box 0 +fx.on
	
|-------- productos	descripcion	
	0 'tpro !
	0 ( prodcnt <? 
		
		fntdes2 over 3 << 'prodnom + @
		0.05 0.4 0.276 0.181 xywh%64 $01001219 +tbox 

		tpro +fx.on 		
		-0.3 0.4 0.276 0.181 xywh%64 0.05 0.4 0.276 0.181 xywh%64 'Quad_out 1.0
		tpro +fx.box
		0.05 0.4 0.276 0.181 xywh%64 -0.3 0.4 0.276 0.181 xywh%64 'Quad_out 1.0
		tpro 9.0 + +fx.box
		tpro 10.0 + +fx.off

		preciocartel
		
		10.0 'tpro +!
		1 + ) drop
		
|-------  salir

	'pexit tpro 1.0 + +event
	
	barraline	
	
	timeline.start
	
	;
	

:cartel
	$ffffff SDLclear
	timeline.draw
	;
	
:cartelfin
	0 ( prodcnt <? 
		dup 3 << 'prodfot + @ unloadimg
		1 + ) drop ;

##prgproductos 'cartelini 'cartel 'cartelfin
