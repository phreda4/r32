| Fuentes utilizadas

^r3/win/sdl2.r3	
^r3/win/sdl2ttf.r3

##font
##fntbold
##fntboldb
##fntboldd
##fntbolde

##fntbold2
##fntdes2
##fntprecio

##fonthora
##fontline

|--------------------------------

::inifont
	ttf_init
	
	"media/ttf/Gill Sans Bold.otf" 26 TTF_OpenFont 'fntbold !
	"media/ttf/Gill Sans Bold.otf" 34 TTF_OpenFont 'fntbold2 !	
	
	"media/ttf/Gill Sans Bold.otf" 42 TTF_OpenFont 'fntprecio !
	
	"media/ttf/Gill Sans.otf" 24 TTF_OpenFont 'fntboldd !
	"media/ttf/Gill Sans.otf" 24 TTF_OpenFont 'fntbolde !
	"media/ttf/Gill Sans.otf" 38 TTF_OpenFont 'fntdes2 !	
	
	"media/ttf/KeepCalm-Medium.ttf" 48 TTF_OpenFont 'font !	
	"media/ttf/KeepCalm-Medium.ttf" 36 TTF_OpenFont 'fntboldb !	
	
	"media/ttf/Gill Sans Bold.otf" 28 TTF_OpenFont 'fonthora !
	"media/ttf/Gill Sans.otf" 28 TTF_OpenFont 'fontline !
	;