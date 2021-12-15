| base - senial de ajuste - barra
| PHREDA 2021

^r3/autotv/fuentes.r3
^r3/autotv/rubros.r3
^r3/win/inet.r3

##imglogo

##prgexit 

::pexit 1 'prgexit ! ;

|---- colorbars
:,2d
	10 <? ( "0" ,s ) ,d ;

:,time
	time
	dup 16 >> $ff and ,d ":" ,s
	dup 8 >> $ff and ,2d ":" ,s
	$ff and ,2d ;

:,date
	date
	dup $ff and ,d "/" ,s
	dup 8 >> $ff and ,d "/" ,s
	16 >> $ffff and ,d ;

#col $fdfdfd $fdfc01 $fcfd $fe00 $fd00fb $fc0001 $0100fc

#rf [ 0 0 0 0 ]

:sajuste
	'col sw 7 /mod 1 >> | 'col w x
	( sw 8 - <?
		rot @+ SDLcolor
		rot rot sh pick2 0 pick3 
		'rf d!+ d!+ d!+ d!
		SDLrenderer 'rf SDL_RenderFillRect
		over + ) 3drop
	SDLrenderer $ffffff font
	mark ,sp ,date ,sp ,eol empty here 
	40 140 RenderTextB

	SDLrenderer $ffffff font
	"ADTv"
	40 40 RenderTextB	
	
|	SDLrenderer $ffffff font
|	mark ,sp ,time ,sp ,eol empty here 
|	40 40 RenderTextB	
	;

##prgajuste 0 'sajuste 0

|---- Hora y temperatura

##tempact * 16
##presact * 16

:cpy, | src dst -- src
	over ( c@+ $2c <>? rot c!+ swap ) 2drop 
	0 swap c!
	;

::getHTH
	"https://api.weather.com/v2/pws/observations/current?apiKey=e1f10a1e78da46f5b10a1e78da96f525&stationId=ISANCA21&numericPrecision=decimal&format=json&units=m"
	0 here openurl here =? ( drop ; ) 0 swap !
	here 
	"temp" findstr 6 + 'tempact cpy,
	"pressure" findstr 10 + 'presact cpy,
	"°" 'tempact strcat
	drop
	;

:itemp
	timeline.clear
	
|----- panel
	0.2 0.2 0.6 0.6 xywh%64 $F0E9E2 +box 0.0 +fx.on
	
	fntbold 'tempact 0.2 0.2 0.6 0.4 xywh%64 $11CA6702 +tbox 0.0 +fx.on	
	fntbold 'presact 0.2 0.4 0.6 0.4 xywh%64 $11CA6702 +tbox 0.0 +fx.on	
	
	'getHTH 0.1 +event
	timeline.start
	;
	
:stemp
	0 SDLColor
	timeline.draw	
	;
	
##prgtemp 'itemp 'stemp 0

|----- barra

#buffscroll * 8192
#buff> 'buffscroll
#buffline * 64

#scrolltime

#prevt
#timenow

:rtime
	msec 'prevt ! 0 'timenow ! ;
	
:dtime
	msec dup prevt - 'timenow +! 'prevt ! ;

:cpy13 | dst src --
	( c@+ 1? 13 <>? 10 <>?
		rot c!+ swap ) 
	2drop 0 swap c! ;
	
:nextbuff
	'buffline buff> cpy13
	buff> >>cr trim 
	dup c@ 0? ( 2drop 'buffscroll 'buff> ! ; )  drop
	'buff> ! ;
	
:,time2
	time
	dup 16 >> $ff and ,d 
	|dup $1 and ": " + c@ ,c
	":" ,s
	8 >> $ff and ,2d ;

:horanow
	mark ,time2 ,eol empty here ;
	
::updatebarra
	0 SDLColor
	
	0 0.92 1.0 0.1 xywh%64 64xywh
	SDLFillRect

	$21 horanow
	0.79 0.93 0.1 0.08 xywh%64
	$ffffff fonthora textboxs 

	$21 'tempact
	0.86 0.93 0.1 0.08 xywh%64
	$ffffff	fonthora textboxs 

	|----------- scroll
	
	$01 'buffline
	0.03 
	1.0 |0.94 
	|timenow 1000 min 0.06 1000 */ - | animacion
	timenow 1024 min 0.07 10 *>> - | animacion
	0.8 0.08 xywh%64
	$ffffff fontline textboxs 
	
	dtime
	timenow 5000 <? ( drop ; ) drop | 5 seg cambio
	rtime
	nextbuff 
	;	
	
	
::loadscroll
	'buffscroll "autotv/mscroll.txt" load 0 swap !
	'buffscroll 'buff> !
	nextbuff
	rtime
	;
	
|---------------------------------------------------
:cajai | pos rubro --
	-? ( 11 + )
	10 >? ( 10 - )
	over 0.0556 * 0.208 + 0.8 0.0556 0.125 xywh%64 
	over nrubroc
	+box 0 +fx.on
	dup nrubroi 
	pick2 0.0556 * 0.208 + 0.84 0.0556 0.035 xywh%64 
	+imgar 0 +fx.on		
	2drop
	;

:cajac | rubro --
	0.374 0.8 0.224 0.125 xywh%64 
	over nrubroc
	+box 0 +fx.on
	dup nrubroi 
	0.374 0.84 0.0556 0.035 xywh%64 
	+imgar 0 +fx.on		
	fntbolde over nrubron 0.42 0.80 0.17 0.125 xywh%64 $01ffffff +tbox 0 +fx.on	
	drop
	;


::barraline
	0 0.8 1.0 0.125 xywh%64 $001a24 +box 0.0 +fx.on		| barra
	imglogo 0 0.82 0.18 0.07 xywh%64 +imgar 0 +fx.on	| logo
	
|------- rubros
	0 nowrubro 3 - cajai 
	1 nowrubro 2 - cajai 	
	2 nowrubro 1 - cajai 		
	nowrubro cajac
	7 nowrubro 1 + cajai 	
	8 nowrubro 2 + cajai 	
	9 nowrubro 3 + cajai 		
	
	fntbolde  "Para publicar:" 0.78 0.80 0.236 0.08 xywh%64 $01ffffff +tbox 0 +fx.on	
	fntbolde  "guianet.com.ar" 0.78 0.84 0.236 0.08 xywh%64 $01ffffff +tbox 0 +fx.on	
	;
	
|---------------------------------------------------
#mus_fondo 0
#needmf 0

::mfrestart
	1 'needmf !
	mus_fondo 1? ( dup Mix_FreeMusic ) drop
	"autotv/musica" loadnfile 
	"autotv/musica/%s" sprint
	Mix_LoadMUS 'mus_fondo !
	mus_fondo 1 Mix_PlayMusic
	;
	
::mmfcheck
	needmf 0? ( drop ; ) drop
	Mix_PlayingMusic 1? ( drop ; ) drop
	mfrestart
	;
	
::mfstop
	1000 Mix_fadeOutMusic
	0 'needmf !
	;
	