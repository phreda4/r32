| Rubros guianet
| PHREDA 2021

^r3/lib/str.r3
^r3/win/sdl2image.r3

##nowrubro 0

|SIN RUBRO#Alimentos y bebidas#Autos#Profesionales y servicios#Ropa e indumentaria#Salud y belleza#Casa#Deporte y ocio#Agro#Tecnología#Regalería y librería#Animales
|"rubro|Rubro|S|SIN RUBRO#Alimentos y bebidas#Autos#Profesionales y servicios#Ropa e indumentaria#Salud y belleza#Casa#Deporte y ocio#Agro#Tecnología#Regalería y librería#Animales",
| sin rubro=0
|---------------
#rubroname 
"Alimentos y bebidas" | 0
"Auto"  | 1
"Profesionales y servicios"  | 2
"Ropa e indumentaria" | 3
"Salud y belleza" | 4
"Casa" | 5
"Deporte y ocio" | 6
"Agro" | 7
"Tecnología" | 8
"Regalería y librería" | 9
"Animales" | 10
"Productos" | 11 ** no es rubro
"Promociones" | 11 ** es rubro

::nrubron | nro -- name
	'rubroname swap ( 1? 1 - swap >>0 swap ) drop ;

|---------------
#imgl * 128

::nrubroi | nro -- image
	3 << 'imgl + @ ;
	
|---------------	
#coll
$9B2227
$AE2012
$BB3F03
$CA6702
$EE9B01
$E9D8A4
$94D2BD
$55C9A2
$2BBB8A
$03A6B5
$07818C
$005F73

::nrubroc | nro -- color
	3 << 'coll + @ ;

|---------------
::inirubros
	'imgl >a
	"media/iconos/icn-alimentos.png" loadimg dup a!+ 
	"media/iconos/icn-autos.png" loadimg dup a!+ 
	"media/iconos/icn-servicios.png" loadimg dup a!+ 
	"media/iconos/icn-ropa.png" loadimg dup a!+ 
	"media/iconos/icn-salud.png" loadimg dup a!+
	"media/iconos/icn-casa.png" loadimg dup a!+ 
	"media/iconos/icn-ocio.png" loadimg dup a!+
	"media/iconos/icn-agro.png" loadimg dup a!+
	"media/iconos/icn-tecnologia.png" loadimg dup a!+
	"media/iconos/icn-regaleria.png" loadimg dup a!+
	"media/iconos/icn-promociones.png" loadimg dup a!+
	"media/iconos/icn-productos.png" loadimg dup a!+
	;
	