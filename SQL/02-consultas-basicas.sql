
-- Ejercicio 1: Seleccionar todos los campos de la tabla `customers` y renombrar la columna `CustomerId` a `ID`.
SELECT 
    "CustomerId" as ID,
    "FirstName",
    "LastName" ,
    "Company" ,
    "Address" ,
    "City" ,
    "State" ,
    "Country" ,
    "PostalCode" ,
    "Phone" ,
    "Fax" ,
    "Email" ,
    "SupportRepId" 
FROM  "Customer" c;


-- Ejercicio 2: Seleccionar los nombres de los clientes (`FirstName`, `LastName`) y renombrar las columnas a `First_Name` y `Last_Name`.
select 
	"FirstName" as First_Name,
	"LastName" as Last_Name
from "Customer" c ;


-- Ejercicio 3: Seleccionar los títulos de las pistas (`Name`) que duran más de 300,000 milisegundos y renombrar la columna a `Track_Title`.
select "Name" as Track_Title
from "Track" t
where "Milliseconds" > 300000;


-- Ejercicio 4: Seleccionar el nombre y el correo electrónico de los clientes que viven en Brasil y renombrar las columnas a `Name` y `Email_Address`.
select 
	concat("FirstName",' ', "LastName") as Name,
	"Email" as email_address 
from "Customer" c
where "Country" = 'Brazil';


-- Ejercicio 5: Seleccionar los nombres de las playlists (`Name`) que contienen la palabra 'Music' y renombrar la columna a `Playlist_Name`.
select "Name" as playlist_name
from "Playlist" pt 
where "Name" like '%Music%';

-- Ejercicio 6: Seleccionar los nombres de los empleados (`FirstName`, `LastName`) que trabajan como 'Sales Support Agent' y renombrar las columnas a `First_Name` y `Last_Name`.
select 
	"FirstName" as first_name,
	"LastName" as last_name 
from "Employee" e 
where "Title" = 'Sales Support Agent';

-- Ejercicio 7: Seleccionar los nombres de los géneros (`Name`) y renombrar la columna a `Genre_Name`.
select "Name" as genre_name
from "Genre" g ;

-- Ejercicio 8: Seleccionar los nombres de los empleados (`FirstName`, `LastName`) que reportan al empleado con `EmployeeId` = 1 y renombrar las columnas a `First_Name` y `Last_Name`.
select 
	"FirstName" as first_name,
	"LastName" as last_name
from "Employee" e 
where "EmployeeId" = 1;

-- Ejercicio 9: Seleccionar los nombres de las pistas (`Name`) y su duración en minutos (convertido de milisegundos) que duran más de 5 minutos y renombrar las columnas a `Track_Name` y `Duration_Minutes`.
select 
	"Name" as track_name,
	ROUND("Milliseconds"::NUMERIC / 60000, 2) AS duration_minutes
from "Track" t
where ROUND("Milliseconds"::NUMERIC / 60000, 2) > 5 ;

-- Ejercicio 10: Encuentra las pistas que tienen un precio mayor a 1.00 y una duración menor a 300,000 milisegundos. Muestra el nombre de la pista y su duración.
select 
	"Name" as track_name,
	"Milliseconds" 
from "Track" t
where "UnitPrice" > 1.00 and "Milliseconds" < 300000;

-- Ejercicio 11: Lista los empleados que trabajan en la ciudad 'Seattle' y cuyo estado es 'WA'. Muestra el nombre y el apellido del empleado.
select 
	concat("FirstName",' ',"LastName") as nombre_empleado
from "Employee" e 
where "City" = 'Seattle' and "State" = 'WA';

-- Ejercicio 12: Encuentra los clientes que están en el país 'USA' y tienen asignado un representante de soporte con un ID mayor o igual a 5. Muestra el nombre del cliente y su ID de soporte.
select 
	concat("FirstName",' ',"LastName") as nombre_cliente,
	"SupportRepId" 
from "Customer" c 
where "Country" = 'USA' and "SupportRepId" >= 5;

-- Ejercicio 13: Selecciona las facturas que tienen un total mayor a 10.00 y pertenecen a clientes con ID menor a 50. Muestra el ID de la factura y el total.
select
	"InvoiceId" ,
	"Total" 
from "Invoice" i 
where "Total" > 10.00 and "CustomerId" < 50;

-- Ejercicio 14: Lista las pistas que tienen una duración mayor a 250,000 milisegundos y pertenecen a un tipo de medio con ID 1 o 2. Muestra el nombre de la pista y el tipo de medio.
select 
	"Name" ,
	"MediaTypeId" 
from "Track" t 
where "Milliseconds" > 250000 and "MediaTypeId" between 1 and 2;


