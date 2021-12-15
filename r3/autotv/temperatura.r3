| Test WININET
| PHREDA 2021

^r3/win/core.r3
^r3/win/inet.r3
^r3/win/console.r3

#sitio "http://anterior.inta.gov.ar/barrow/sancayetano/met/downld02.txt" 
#sitio2 "http://anterior.inta.gov.ar/barrow/met/downld02.txt"
#sitio "https://www.windguru.cz/111856"
#sitio "https://api.weather.com/v2/pws/observations/current?apiKey=e1f10a1e78da46f5b10a1e78da96f525&stationId=ISANCA21&numericPrecision=decimal&format=json&units=m"

:filete | "ini" "ini" mem -- adr/0
	swap findstri
	0? ( nip ; )
	swap count >r findstri
	r> + ;
	

:gettemp | temo
	""">" "dato-temperatura" here filete
	0? ( ; )
	.println
|	dup "%l " .println
|	str>nro nip 
	;
	
|"metric":{"temp":32.4,
|"heatIndex":30.8,
|"dewpt":10.5,"windChill":32.4,"windSpeed":7.2,"windGust":11.1,
|"pressure":1006.13,"precipRate":0.00,"precipTotal":0.00	


##tempact * 16
##presact * 16

:cpy, | src dst -- src
	over ( c@+ $2c <>? rot c!+ swap ) 2drop 
	0 swap c!
	;

:loadyparse
	"https://api.weather.com/v2/pws/observations/current?apiKey=e1f10a1e78da46f5b10a1e78da96f525&stationId=ISANCA21&numericPrecision=decimal&format=json&units=m"
	0 here openurl here =? ( drop ; ) 0 swap !
	here 
	"""temp"":" findstr 7 + 
	'tempact cpy,
	"""pressure"":" findstr 11 + 
	'presact cpy,
	"°" 'tempact strcat
	drop 
	'tempact .println
	'presact .println

	;

#valtemp
#valpres	
	
:loadyparsef
	'sitio 0 here openurl 
	here =? ( drop 
		'sitio2 0 here openurl )
	0 swap c!

	here 
	"""temp"":" findstr 7 + str>fnro 'valtemp !
	"""pressure"":" findstr 11 + str>fnro 'valpres !
	valtemp "%f grados" .println
	valpres "%f hp" .println
	
	;
	
:loadyparse2
	here "autotv/downld02.txt" load 0 swap !	
	;
	
:loadtemp
	"loading..." .println
	loadyparse
	
	
	|here .print
	|gettemp 
	|"%d" .println
	"end." .println
	.input
	;
	
: 
loadtemp

;
