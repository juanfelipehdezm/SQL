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
• País
• Nombre
• Apellido1
• Apellido2
• Teléfono
• Código Reserva
• Número de la habitación reservada
• Fecha de entrada
• Fecha de salida
• Precio de la habitación + IVA
• Nombre de los servicios que consumió
• Total de los gastos (servicios que solicito durante el hospedaje)
• Total a pagar
• Tipo de la habitación
• Temporada si es (B,M,A)*/

