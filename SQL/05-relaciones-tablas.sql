
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select 
	t."Name" as Nombre_cancion,
	a."Title" as Nombre_album
from "Track" t
inner join "Album" a 
	on t."AlbumId" = a."AlbumId" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select 
	a."Name" as nombre_artista,
	a2."Title" as album
from "Artist" a 
inner join "Album" a2 
	on a2."ArtistId" = a."ArtistId"
order by nombre_artista;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select 
	concat(c."FirstName",' ',c."LastName") as nombre_cliente,
	i."Total" 
from "Customer" c 
inner join "Invoice" i 
	on i."CustomerId" = c."CustomerId"
order by i."Total" desc
limit 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select 
	concat(e."FirstName",' ',e."LastName") as nombre_empleado,
	concat(c."FirstName",' ',c."LastName") as nombre_cliente
from "Employee" e 
inner join "Customer" c 
	on c."SupportRepId" = e."EmployeeId"
order by nombre_empleado;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select 
	il."InvoiceId",
	t."Name" 
from "InvoiceLine" il 
inner join "Track" t 
	on t."TrackId" = il."TrackId" 
order by il."InvoiceId" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select 
    a2."Name" AS artist_name,
    g."Name" AS genre_name
from "Track" t
inner join "Album" a on a."AlbumId" = t."AlbumId" 
inner join "Artist" a2 on a2."ArtistId" = a."ArtistId" 
inner join "Genre" g on g."GenreId" = t."GenreId"
order by a2."Name" ;

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select 
	t."Name" as nombre_cancion,
	mt."Name" as nombre_media
from "Track" t 
inner join "MediaType" mt 
	on mt."MediaTypeId" = t."MediaTypeId"
order by nombre_cancion;

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select 
	t."Name" as nombre_cancion,
	g."Name" as genero
from "Track" t 
left join "Genre" g 
	on g."GenreId" = t."GenreId" ;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select 
	concat(c."FirstName",' ', c."LastName") nombre_cliente,
	i."InvoiceId"
from "Customer" c 
left join "Invoice" i 
	on i."CustomerId" = c."CustomerId" ;

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select 
	a."Title" as album,
	a2."Name" as artist
from "Album" a
left join "Artist" a2 
	on a2."ArtistId" = a."ArtistId" 
order by artist;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select 
	g."Name" as genero,
	count(t."TrackId") as numero_canciones
from "Track" t 
inner join "Genre" g 
	on g."GenreId" = t."GenreId"
group by g."Name" 
order by numero_canciones desc;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select 
	a."Title" as album,
	sum(t."Milliseconds") as total_milliseconds
from "Track" t 
inner join "Album" a 
	on a."AlbumId" = t."AlbumId" 
group by a."AlbumId" 
order by total_milliseconds desc;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select 
	concat(c."FirstName",' ',c."LastName") as nombre_cliente,
	sum(i."Total") as total_gastado
from "Customer" c 
inner join "Invoice" i 
	on i."CustomerId" = c."CustomerId" 
group by c."CustomerId";

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select 
	concat(e."FirstName",' ',e."LastName") as nombre_empleado,
	concat(c."FirstName",' ',c."LastName") as nombre_cliente 
from "Employee" e 
left join "Customer" c 
	on c."SupportRepId" = e."EmployeeId" 
order by nombre_empleado;


