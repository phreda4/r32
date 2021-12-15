| Test WININET
| PHREDA 2021

^r3/win/core.r3
^r3/win/inet.r3
^r3/win/console.r3

#cnt

: 
|"http://www.google.com" | ok
|"https://www.accuweather.com/es/ar/san-cayetano/2942/hourly-weather-forecast/2942"
|"http://anterior.inta.gov.ar/barrow/sancayetano/met/cam.htm"
|"https://news.ycombinator.com/news" | ok
|"http://anterior.inta.gov.ar/barrow/sancayetano/met/downld02.txt" | ok
|"http://anterior.inta.gov.ar/barrow/sancayetano/met/cam.htm"
|"https://weather.com/es-AR/tiempo/hoy/l/-38.34,-59.61?par=google"
|"https://www.google.com/search?q=clima+san+cayetano&rlz=1C1CHBF_esAR888AR888&oq=clima+san+cayetano&aqs=chrome..69i57j0i512l5j69i60l2.10610j1j9&sourceid=chrome&ie=UTF-8"
"https://freemeteo.com.ar/eltiempo/san-cayetano/7dias/lista/?gid=3429171&language=spanishar&country=argentina" | ok!!!!
|"https://weather.com/es-US/tiempo/horario/l/c467d7b345d9ebab2bcebeafe764f0ab33462b3362bad59d1bd0a60d8781beae"
|"https://freemeteo.com.ar/eltiempo/san-cayetano/pronostico-hora-hora/hoy/?gid=3429171&language=spanishar&country=argentina" 

0 here openurl
dup here - 'cnt !
0 swap c!

here .println

cnt " largo:%d " .println

;
