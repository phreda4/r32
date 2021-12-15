| GuiaNetV 
| PHREDA 2021

^r3/win/console.r3
^r3/win/sdl2.r3	
^r3/win/sdl2image.r3	
^r3/win/sdl2mixer.r3
^r3/win/sdl2ttf.r3

^r3/util/timeline.r3
^r3/util/fontutil.r3
^r3/util/boxtext.r3
^r3/util/dbtxt.r3

^r3/lib/parse.r3
^r3/lib/mem.r3
^r3/lib/key.r3
^r3/lib/sys.r3
^r3/lib/gr.r3

^r3/autotv/fuentes.r3

|---- cartel simple de comercios

#n1 "nombre1"
#d1 "direccion1" 
#t1 "telefono1"
#n2 "nombre2 que es demasiado largo"
#d2 "direccion2" 
#t2 "telefono2"
#n3 "nombre3"
#d3 "direccion3" 
#t3 "telefono3"

:cambia1
|------------- columna 1>sale

fntbold 'n1 -0.25 0.4 0.30 0.1 xywh%64 $11001A24 +tbox 0.0 +fx.on 
|	0.025 0.4 0.30 0.1 xywh%64 
|	-0.3 0.4 0.30 0.1 xywh%64 'Quad_Out 20.0
|	0.0 +fx.box	


|------------- columna 2>1

|0.35 0.4 0.30 0.1 xywh%64 $ff +box 0 +fx.on

|fntbold 'n2 0.35 0.4 0.30 0.1 xywh%64 $11001A24 +tbox 0.0 +fx.on 

fntbold 'n2 0.7 0.4 0.30 0.1 xywh%64 $11001A24 +tbox 0.0 +fx.on 


;

	
:comeini 
	timeline.clear
	cambia1
	timeline.start
	;
	
:come 
	$bb3e03 SDLClear
	.cls
	timeline.draw
		
|	debugtimeline
	;
	

:mainloop
	come
	SDLRedraw

	SDLkey
	>esc< =? ( exit )
	<f1> =? ( comeini )
	drop ;		


:main
	|"r3sdl" 1280 720 SDLinitgl
	"r3sdl" 1024 576 SDLinitgl
	inifont
	
	.cls
	0.35 0.4 0.30 0.1 xywh%64
	64xywh "%d %d %d %d" .println
	
	0.675 0.4 0.30 0.1 xywh%64
	64xywh "%d %d %d %d" .println

	comeini 
	'mainloop  SDLshow

	SDLquit
	;


:ini
	timeline.inimem
	;

: ini main ;