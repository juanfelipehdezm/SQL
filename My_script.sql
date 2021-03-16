/* 1. Inserte el tipo de servicio OCIO*/
SET IDENTITY_INSERT [dbo].[Servicios] ON 
GO
INSERT [dbo].[Servicios] (CodServicios, CodTipoServicio, Descripcion, Precio, Iva, Fecha) VALUES (4, 4, N'OCIO                ', 50.0000, CAST(7.00 AS Numeric(5, 2)), CAST(N'2021-02-26' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO

/* 2. Realice una reserva de la habitación 101 para el cliente 12345 para las noches del 2 al 4 de julio de 2020. */
SET IDENTITY_INSERT [dbo].[Reserva_Habitacion] ON 
GO
INSERT [dbo].Reserva_Habitacion (CodReserva, FechaEntrada, FechaSalida, Iva, CodHabitacion, CodCliente)
						 VALUES (8,CAST(N'2020-07-02' AS DATE),CAST(N'2020-07-04' AS DATE),CAST(0.07 AS Numeric(5, 2)),101,12345)
GO
SET IDENTITY_INSERT [dbo].[Reserva_Habitacion] ON 
GO

/* 3. Actualice el teléfono del cliente 12345. Su nuevo número es 123456789. */
UPDATE [Clientes]
SET Telefono = '123546789'
WHERE Identificacion = '12345' GO

/* 4. Actualice el precio de los servicios incrementándolos en un 2%*/
UPDATE Servicios
SET Precio = Precio*1.02
GO

/* 5. Crear una vista que devuelva los clientes cuyo apellido incluya la sílaba “Pe” ordenados por su
identificador.*/
SELECT * 
FROM Clientes
WHERE Apellido1 LIKE '%PE%' OR Apellido2 LIKE '%PE%'
ORDER BY Identificacion 
GO

/* 6. Crea una vista que devuelva los clientes, ordenados por su primer apellido, que tengan alguna observación
anotada.*/
SELECT *
FROM Clientes
WHERE Observaciones IS NOT NULL
ORDER BY Apellido1
GO

/* 7. Crea una vista que devuelva los servicios cuyo precio supere los 5 USD ordenados por su código de
servicio. */
SELECT *
FROM Servicios
WHERE Precio > 5
ORDER BY CodServicios
GO

/*8. Cree una consulta que devuelva las habitaciones reservadas para el día 16 de febrero de 2019. */
SELECT CodHabitacion AS habitaciones
FROM Reserva_Habitacion
WHERE FechaEntrada = '2019-02-16'
GO

/* 9. Cree una consulta que devuelva el precio del servicio más caro y del más barato. ¨*/
SELECT *
FROM Servicios
WHERE Precio = (SELECT MAX(Precio) FROM Servicios) 
   OR Precio = (SELECT MIN(Precio) FROM Servicios)
GO

/*10. Realice una consulta en donde detalle la siguiente información:
• País DONE
• Nombre DONE
• Apellido1 DONE
• Apellido2 DONE
• Teléfono DONE
• Código Reserva DONE
• Número de la habitación reservada DONE
• Fecha de entrada DONE
• Fecha de salida DONE
• Precio de la habitación + IVA DONE
• Nombre de los servicios que consumió DONE
• Total de los gastos (servicios que solicito durante el hospedaje) DONE
• Total a pagar DONE 
• Tipo de la habitación   DONE
• Temporada si es (B,M,A)
*/ 
WITH countries_cliente AS (
    SELECT p.Pais,c.Nombre,c.Apellido1,c.Apellido2,c.Telefono,c.CodClientes
    FROM Paises AS p
    INNER JOIN Clientes AS c
    ON p.CodPais = c.CodPais
	                      ),
reservas AS (
    SELECT *
	FROM countries_cliente AS cc
	INNER JOIN Reserva_Habitacion AS rh
	ON cc.CodClientes = rh.CodCliente
	        ),
num_habi AS (
    SELECT r.Pais,r.Nombre,r.Apellido1,r.Apellido2,r.Telefono,r.CodReserva,r.CodCliente,r.FechaEntrada,r.FechaSalida,
	       h.CodCategoria AS Tipo_habitacion,h.NumHabitacion
	FROM reservas AS r
	INNER JOIN Habitaciones AS h 
	ON r.CodHabitacion = h.NumHabitacion
	        ),
season AS (
    SELECT *,
        CASE WHEN MONTH(FechaEntrada) BETWEEN 01 AND 03 THEN 1
	         WHEN MONTH(FechaEntrada) BETWEEN 04 AND 05 THEN 2
		     WHEN MONTH(FechaEntrada) BETWEEN 06 AND 08 THEN 3
		     WHEN MONTH(FechaEntrada) BETWEEN 06 AND 08 THEN 4
		     ELSE 5 END AS Cual_temporada
    FROM num_habi
          ),
precio AS (
    SELECT s.Pais,s.Nombre,s.Apellido1,s.Apellido2,s.Telefono,s.CodReserva,s.CodCliente,s.FechaEntrada,s.FechaSalida,s.Tipo_habitacion,
           s.NumHabitacion, ph.Precio*(1.07) AS Precio_hab, ph.CodTemporada
    FROM season as s
    INNER JOIN Precio_Habitacion AS ph
    ON s.Cual_temporada = ph.CodTemporada AND s.Tipo_habitacion = ph.Tipo_Habitacion
          ),
servicios_ga AS (
    SELECT DISTINCT p.Pais,p.Nombre,p.Apellido1,p.Apellido2,p.Telefono,p.CodReserva,p.CodCliente,p.FechaEntrada,p.FechaSalida,p.Tipo_habitacion,
	       p.NumHabitacion,p.Precio_hab,p.CodTemporada, ISNULL(g.Precio*(1.07),0) AS gastos_servi,se.Descripcion
    FROM precio AS p
	LEFT JOIN Gastos AS g
	ON p.CodReserva = g.CodReserva
	LEFT JOIN Servicios AS se
	ON g.CodServicios = se.CodServicios
	            )
SELECT *, Precio_hab + gastos_servi AS total_pagar, 
    CASE  WHEN MONTH(FechaEntrada) IN (01,02,03,11,12) THEN 'B'
	      WHEN MONTH(FechaEntrada) IN (04,05,09,10) THEN 'M'
		  ELSE 'A' END AS Tipo_Temporada
FROM servicios_ga

/* 11. Realice una consulta en donde se liste el último servicio solicitado por los clientes (tabla de referencia es
gastos con la columna Fecha y la tabla servicios). Restricción: Se debe realizar la consulta sin hacer uso del
filtro fecha y la clausula TOP Ejm: where Fecha:’xxxxx’ o select top 1. */

SELECT s.Descripcion,g.Fecha
FROM Gastos AS g
INNER JOIN Servicios AS s
ON g.CodServicios = s.CodServicios

/* another exercise 
SELECT c.NAME,o.PRICE
FROM CUSTOMERS AS c
INNER JOIN ORDERS AS o
ON c.ORDER_ID = o.ID
WHERE YEAR(o.ORDER_DATE) < 1980
ORDER BY o.PRICE DESC
LIMIT 1;





