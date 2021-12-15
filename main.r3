| GuiaNetV 
| PHREDA 2021
|MEM 128
^r3/win/console.r3
^r3/win/sdl2.r3	
^r3/win/sdl2image.r3	
^r3/win/sdl2mixer.r3
^r3/win/sdl2ttf.r3
|^r3/win/ffm.r3

^r3/util/timeline.r3
^r3/util/fontutil.r3
^r3/util/boxtext.r3
^r3/util/dbtxt.r3

^r3/lib/parse.r3
^r3/lib/mem.r3
^r3/lib/key.r3
^r3/lib/sys.r3
^r3/lib/gr.r3

^r3/autotv/ajuste.r3
^r3/autotv/rubros.r3

^r3/autotv/blkproducto.r3
^r3/autotv/blkcomercio.r3
^r3/autotv/blkvideos.r3

|--------------- Programas
#prognow 0
#prog>> 0
#estado

|--------------- 
##programa 0
#prgnow 0

:endlast | -- ; ejecuta final de actual
	prgnow 0? ( drop ; ) 
	16 + @ 0? ( drop ; )
	ex ;
	
:changeprg | adr --
	endlast
	0 'prgexit !
	dup 'prgnow !
	dup 8 + @ 'programa ! 
	@ 0? ( drop ; )
	ex ;

	
#pr 'prgcomercio 'prgproductos 'prgcvideo 0
#np 'pr

:nextprog
	np @ 0? ( drop 'pr dup 'np !  @ )
	changeprg
	8 'np +!
	;
	

|---------------------------------
:mainloop
	programa ex	
	updatebarra 
	SDLRedraw
	
	prgexit 1? ( nextprog ) drop | termino bloque
		
	SDLkey
	>esc< =? ( exit )
	
	<f1> =? ( nextprog )
|	<f1> =? ( 'prgcomercio changeprg )
|	<f2> =? ( 'prgproductos changeprg ) 		
|	<f3> =? ( 'prgajuste changeprg )
|	<f3> =? ( 'prgtemp changeprg )	
|	<f4> =? ( 'prgcvideo changeprg )
	
|	<f6> =? ( mus_fondo 0 Mix_PlayMusic )
	
	drop ;		

:main
	inifont
	inivideos

	inirubros
	loadscroll
	getHTH
	
	"media/LOGO-GuiaNET-TV.png" loadimg 'imglogo !

	reloaddbproductos	
	reloaddbcomercio
	
	mfrestart
	
	'prgajuste changeprg
	'mainloop SDLshow
	
	;

:  |---------------------------------------------
	timeline.inimem
	
	"r3sdl" 1280 720 SDLinitgl
	|"r3sdl" 1024 576 SDLinitgl
	|"r3sdl" 800 600 SDLinitgl
	SNDInit
	
	main 
	
	SNDQuit
	SDLquit
	;