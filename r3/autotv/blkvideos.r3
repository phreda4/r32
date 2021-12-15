^r3/autotv/ajuste.r3
^r3/win/ffm.r3

|---------------------------------
#vcarpeta * 1024
#vfilenow * 1024
#videoframe
#srct [ 0 0 1280 720 ]
#mpixel 
#mpitch

|--------- carpeta de video	
:cvideoini  | "pathsin/" --
	mfstop
	
	"autotv/videos" 
|	'vcarpeta
	loadnfile 'vfilenow strcpy
	1280 720 SDLframebuffer 'videoframe !
	 
	timeline.clear

	videoframe 0.0 0.0 1.0 1.0 xywh%64 +imgar
	0.0 +fx.on	
	
|---- cartel	
	0.05 0.03 0.18 0.1 xywh%64 $0 +box 0 +fx.on
	fntboldd 
	"programa;infomercial" 
	0.05 0.03 0.18 0.1 xywh%64 $11ffffff +tbox
	0.0 +fx.on
|---- 	
	timeline.start

	'vfilenow 
"autotv/videos/%s" 
|	'vcarpeta "%s/%s" 
	sprint 1280 720 FFM_open	
	;
	
:cvideo 
	$0 SDLclear
	videoframe 'srct 'mpixel 'mpitch SDL_LockTexture
	mpixel FFM_redraw 1? ( pexit ) drop 
	videoframe SDL_UnlockTexture
	timeline.draw
	;
	
:cvideofin
	FFM_close
	videoframe SDL_DestroyTexture
	mfrestart | prender musica otra vez
	;
	
##prgcvideo 'cvideoini 'cvideo 'cvideofin

|--------- video unico
:videoiniu 
	1000 Mix_fadeOutMusic
	1280 720 SDLframebuffer 'videoframe !
	 
	timeline.clear
	videoframe 0.0 0.0 1.0 1.0 xywh%64 +imgar
	0.0 +fx.on	
	
	
	timeline.start

	'vfilenow 1280 720 FFM_open	
	;
	
##prgvideo 'videoiniu 'cvideo 'cvideofin

|-----------------------------
::setvcarpeta 
	'vcarpeta strcpy ;

::setvideo | "fullpathfilename" --
	'vfilenow strcpy ;

::inivideos
	FFM_init
	;
	