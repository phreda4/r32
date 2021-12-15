:barralinenext
	0 0.80 1.0 0.11 xywh%64 $001a24 +box 0.0 +fx.on		| barra
	imglogo 0 0.82 0.18 0.08 xywh%64 +imgar 0 +fx.on	| logo
	
|------- rubros
	nowrubro
	0.35 0.8 0.3 0.1 xywh%64 
	over nrubroc +box 0 +fx.on
	0.35 0.8 0.3 0.1 xywh%64 0.2 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 1.0 +fx.box		
	0.2 0.6 0.6 0.3 xywh%64 -0.4 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 2.5 +fx.box		
	-0.4 0.6 0.6 0.3 xywh%64 0.25 0.8 0.1 0.1 xywh%64 
	'Quad_out 1.0 3.5 +fx.box		

	dup nrubroi 0.35 0.81 0.08 0.08 xywh%64 +imgar 0 +fx.on	
	0.35 0.81 0.08 0.08 xywh%64 0.25 0.65 0.2 0.2 xywh%64 
	'Quad_out 1.0 1.0 +fx.box		
	0.25 0.65 0.2 0.2 xywh%64 -0.45 0.65 0.2 0.2 xywh%64 
	'Quad_out 1.0 2.5 +fx.box	
	-0.45 0.65 0.2 0.2 xywh%64 0.25 0.81 0.08 0.08 xywh%64
	'Quad_out 1.0 3.5 +fx.box	

	fntbolde over nrubron 0.35 0.8 0.3 0.14 xywh%64 $11ffffff +tbox 0 +fx.on
	0.35 0.8 0.3 0.14 xywh%64 0.3 0.65 0.4 0.2 xywh%64 
	'Quad_out 1.0 1.0 +fx.box
	0.3 0.65 0.4 0.2 xywh%64 -0.3 0.65 0.4 0.2 xywh%64 
	'Quad_out 1.0 2.5 +fx.box		
	3.5 +fx.off
	drop

	nowrubro 1 + 10 mod 
	0.65 0.8 0.1 0.1 xywh%64 
	over nrubroc +box 0 +fx.on
	0.65 0.8 0.1 0.1 xywh%64 0.8 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 1.0 +fx.box		
	0.8 0.6 0.6 0.3 xywh%64 0.2 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 2.5 +fx.box
	0.2 0.6 0.6 0.3 xywh%64 0.35 0.8 0.3 0.1 xywh%64 
	'Quad_out 1.0 3.5 +fx.box
	
	dup nrubroi 0.65 0.81 0.08 0.08 xywh%64 +imgar 0 +fx.on	
	0.65 0.81 0.08 0.08 xywh%64 0.8 0.65 0.2 0.2 xywh%64 
	'Quad_out 1.0 1.0 +fx.box		
	0.8 0.65 0.2 0.2 xywh%64 0.25 0.65 0.2 0.2 xywh%64 
	'Quad_out 1.0 2.5 +fx.box		
	0.25 0.65 0.2 0.2 xywh%64 0.35 0.81 0.08 0.08 xywh%64
	'Quad_out 1.0 3.5 +fx.box		

	fntbolde over nrubron 0.65 0.8 0.3 0.14 xywh%64 $11ffffff +tbox 2.5 +fx.on
|	0.65 0.8 0.3 0.14 xywh%64 0.6 0.65 0.4 0.2 xywh%64 
|	'Quad_out 1.0 1.0 +fx.box 
	0.9 0.65 0.4 0.2 xywh%64 0.3 0.65 0.4 0.2 xywh%64 
	'Quad_out 1.0 2.5 +fx.box		
	0.3 0.65 0.4 0.2 xywh%64 0.35 0.8 0.3 0.14 xywh%64
	'Quad_out 1.0 3.5 +fx.box		
	drop
	

	nowrubro -1 + 10 mod abs
	0.25 0.8 0.1 0.1 xywh%64 
	over nrubroc +box 0 +fx.on
	0.25 0.8 0.1 0.1 xywh%64 -0.4 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 1.0 +fx.box		
	-0.4 0.6 0.6 0.3 xywh%64 -1.0 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 2.5 +fx.box		
	
	dup nrubroi 0.25 0.81 0.08 0.08 xywh%64 +imgar 0 +fx.on	
	0.25 0.81 0.08 0.08 xywh%64 -0.4 0.65 0.2 0.2 xywh%64 
	'Quad_out 1.0 1.0 +fx.box	
	drop

	nowrubro 2 + 10 mod
	0.75 0.8 0.1 0.1 xywh%64 
	over nrubroc +box 2.5 +fx.on

	1.4 0.6 0.6 0.3  xywh%64 0.8 0.6 0.6 0.3 xywh%64 
	'Quad_out 1.0 2.5 +fx.box		
	0.8 0.6 0.6 0.3 xywh%64 0.65 0.8 0.1 0.1 xywh%64 
	'Quad_out 1.0 3.5 +fx.box		

	dup nrubroi 0.25 0.81 0.08 0.08 xywh%64 +imgar 0.0 +fx.off 2.5 +fx.on	
	1.4 0.65 0.2 0.2 xywh%64 0.8 0.65 0.2 0.2 xywh%64 
	'Quad_out 1.0 2.5 +fx.box	
	0.8 0.65 0.2 0.2 xywh%64 0.65 0.81 0.08 0.08 xywh%64
	'Quad_out 1.0 3.5 +fx.box		
	drop

	1 'nowrubro +!
	;

:barraini 
	timeline.clear
	.cls
	barralinenext
	
	'pexit 30.0 +event
	timeline.start
	;
	
:barranow 
	;
	
:barrafin
	;
	
#cambiabarra 'barraini 'barranow 'barrafin

|---------------------------------

:barraline
	0 0.80 1.0 0.14 xywh%64 $001a24 +box 0.0 +fx.on		| barra

	imglogo 0 0.82 0.18 0.08 xywh%64 +imgar 0 +fx.on	| logo
	
|------- rubros
	
	0 ( 10 <? 
		dup 0.05 * 0.25 + 0.8 0.05 0.1 xywh%64 
		over nrubroc
		+box 0 +fx.on
		dup nrubroi 
		over 0.05 * 0.25 +  0.825 0.0501 0.05 xywh%64 
		+imgar 0 +fx.on		
		1 + ) drop 

|------- mscroll y ht
	0 0.93 1.0 0.071 xywh%64 0 +box 0 +fx.on
	
	fonthora 'buffhora 0.85 0.93 0.1 0.07 xywh%64 $21ffffff +tbox 0.0 +fx.on	
	
	fontline 'buffline 0.05 0.93 0.8 0.07 xywh%64 $01ffffff +tbox 
	0.0 +fx.on	
	
	"Otro scroll" 'buffline strcpy
	;
