/****** Object:  Database [Hotel]    Script Date: 17/04/2020 11:39:22 a. m. ******/
CREATE DATABASE [Hotel]
 
 
USE [Hotel]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[CodClientes] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](50) NULL,
	[CodPais] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido1] [varchar](50) NULL,
	[Apellido2] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Observaciones] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[CodClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gastos]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastos](
	[CodGastos] [int] IDENTITY(1,1) NOT NULL,
	[CodReserva] [int] NULL,
	[CodServicios] [int] NULL,
	[Fecha] [datetime] NULL,
	[Cantidad] [int] NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Gastos] PRIMARY KEY CLUSTERED 
(
	[CodGastos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[CodHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NumHabitacion] [int] NULL,
	[CodCategoria] [int] NULL,
 CONSTRAINT [PK_Habitaciones] PRIMARY KEY CLUSTERED 
(
	[CodHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paises]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[CodPais] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [char](10) NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[CodPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Precio_Habitacion]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio_Habitacion](
	[CodPrecio] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [money] NULL,
	[CodTemporada] [int] NULL,
	[Tipo_Habitacion] [int] NULL,
 CONSTRAINT [PK_Precio_Habitacion] PRIMARY KEY CLUSTERED 
(
	[CodPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reserva_Habitacion]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva_Habitacion](
	[CodReserva] [int] IDENTITY(1,1) NOT NULL,
	[FechaEntrada] [date] NULL,
	[FechaSalida] [date] NULL,
	[Iva] [numeric](5, 2) NULL,
	[CodHabitacion] [int] NULL,
	[CodCliente] [int] NULL,
 CONSTRAINT [PK_Reserva_Habitacion] PRIMARY KEY CLUSTERED 
(
	[CodReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[CodServicios] [int] IDENTITY(1,1) NOT NULL,
	[CodTipoServicio] [int] NULL,
	[Descripcion] [char](30) NULL,
	[Precio] [money] NULL,
	[Iva] [numeric](5, 2) NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[CodServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temporada]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporada](
	[CodTemporada] [int] NOT NULL,
	[Temporada] [int] NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Tipo] [char](1) NULL,
 CONSTRAINT [PK_Temporada] PRIMARY KEY CLUSTERED 
(
	[CodTemporada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Habitacion]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Habitacion](
	[Categoria] [int] NOT NULL,
	[Camas] [int] NULL,
	[Exterior] [char](2) NOT NULL,
	[Salon] [char](2) NULL,
	[Terraza] [char](2) NULL,
 CONSTRAINT [PK_Tipo_Habitacion] PRIMARY KEY CLUSTERED 
(
	[Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Servicio]    Script Date: 17/04/2020 11:38:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Servicio](
	[CodTipoServicio] [int] IDENTITY(1,1) NOT NULL,
	[NombreServicio] [char](10) NOT NULL,
 CONSTRAINT [PK_Tipo_Servicio] PRIMARY KEY CLUSTERED 
(
	[CodTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

GO
INSERT [dbo].[Clientes] ([CodClientes], [Identificacion], [CodPais], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono], [Observaciones]) VALUES (1, N'12345', 2, N'Felipe', N'Perez', N'Soza', N'Calle 15 # 48-59', N'555555', N'Buen Cliente')
GO
INSERT [dbo].[Clientes] ([CodClientes], [Identificacion], [CodPais], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono], [Observaciones]) VALUES (2, N'44444444', 2, N'Juan', N'Felipe', N'Perez', N'Calle 20 # 69-95', N'301286356', NULL)
GO
INSERT [dbo].[Clientes] ([CodClientes], [Identificacion], [CodPais], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono], [Observaciones]) VALUES (3, N'69856456', 3, N'Jorge', N'Pelaez', N'Reyes', N'Calle 63 # 69-63', N'6666665', NULL)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Gastos] ON 

GO
INSERT [dbo].[Gastos] ([CodGastos], [CodReserva], [CodServicios], [Fecha], [Cantidad], [Precio]) VALUES (1, 1, 1, CAST(N'2019-03-15T12:00:00.000' AS DateTime), 1, 10.0000)
GO
INSERT [dbo].[Gastos] ([CodGastos], [CodReserva], [CodServicios], [Fecha], [Cantidad], [Precio]) VALUES (2, 1, 1, CAST(N'2019-03-15T11:00:00.000' AS DateTime), 1, 10.0000)
GO
INSERT [dbo].[Gastos] ([CodGastos], [CodReserva], [CodServicios], [Fecha], [Cantidad], [Precio]) VALUES (3, 4, 2, CAST(N'2019-03-15T09:30:00.000' AS DateTime), 1, 2.0000)
GO
SET IDENTITY_INSERT [dbo].[Gastos] OFF
GO
SET IDENTITY_INSERT [dbo].[Habitaciones] ON 

GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (1, 101, 1)
GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (2, 102, 1)
GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (3, 103, 1)
GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (4, 104, 2)
GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (5, 105, 2)
GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (6, 106, 3)
GO
INSERT [dbo].[Habitaciones] ([CodHabitacion], [NumHabitacion], [CodCategoria]) VALUES (7, 107, 4)
GO
SET IDENTITY_INSERT [dbo].[Habitaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

GO
INSERT [dbo].[Paises] ([CodPais], [Pais]) VALUES (1, N'Alemania  ')
GO
INSERT [dbo].[Paises] ([CodPais], [Pais]) VALUES (2, N'España    ')
GO
INSERT [dbo].[Paises] ([CodPais], [Pais]) VALUES (3, N'Francia   ')
GO
INSERT [dbo].[Paises] ([CodPais], [Pais]) VALUES (4, N'Portugal  ')
GO
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[Precio_Habitacion] ON 

GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (1, 30.0000, 1, 1)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (2, 35.0000, 2, 1)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (3, 40.0000, 3, 1)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (4, 35.0000, 4, 1)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (5, 35.0000, 5, 1)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (6, 40.0000, 1, 2)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (7, 45.0000, 2, 2)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (8, 40.0000, 3, 2)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (9, 40.0000, 4, 2)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (10, 45.0000, 5, 2)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (11, 50.0000, 1, 3)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (12, 35.0000, 2, 3)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (13, 40.0000, 3, 3)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (14, 35.0000, 4, 3)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (15, 50.0000, 5, 3)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (16, 50.0000, 1, 4)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (17, 55.0000, 2, 4)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (18, 60.0000, 3, 4)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (19, 55.0000, 4, 4)
GO
INSERT [dbo].[Precio_Habitacion] ([CodPrecio], [Precio], [CodTemporada], [Tipo_Habitacion]) VALUES (20, 50.0000, 5, 4)
GO
SET IDENTITY_INSERT [dbo].[Precio_Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva_Habitacion] ON 

GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (1, CAST(N'2019-03-15' AS Date), CAST(N'2019-03-25' AS Date), CAST(0.07 AS Numeric(5, 2)), 101, 1)
GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (2, CAST(N'2019-03-15' AS Date), CAST(N'2019-03-25' AS Date), CAST(0.07 AS Numeric(5, 2)), 102, 1)
GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (3, CAST(N'2019-02-16' AS Date), CAST(N'2019-02-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 103, 1)
GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (4, CAST(N'2019-03-16' AS Date), CAST(N'2019-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 104, 2)
GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (5, CAST(N'2019-03-16' AS Date), CAST(N'2019-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 105, 2)
GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (6, CAST(N'2019-03-16' AS Date), CAST(N'2019-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 106, 2)
GO
INSERT [dbo].[Reserva_Habitacion] ([CodReserva], [FechaEntrada], [FechaSalida], [Iva], [CodHabitacion], [CodCliente]) VALUES (7, CAST(N'2019-03-16' AS Date), CAST(N'2019-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 107, 2)
GO
SET IDENTITY_INSERT [dbo].[Reserva_Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

GO
INSERT [dbo].[Servicios] ([CodServicios], [CodTipoServicio], [Descripcion], [Precio], [Iva], [Fecha]) VALUES (1, 1, N'1 menu del día                ', 10.0000, CAST(7.00 AS Numeric(5, 2)), CAST(N'2019-01-01' AS Date))
GO
INSERT [dbo].[Servicios] ([CodServicios], [CodTipoServicio], [Descripcion], [Precio], [Iva], [Fecha]) VALUES (2, 2, N'lavado de camisa              ', 2.0000, CAST(7.00 AS Numeric(5, 2)), CAST(N'2019-01-01' AS Date))
GO
INSERT [dbo].[Servicios] ([CodServicios], [CodTipoServicio], [Descripcion], [Precio], [Iva], [Fecha]) VALUES (3, 2, N'lavado de pantalon            ', 1.0000, CAST(7.00 AS Numeric(5, 2)), CAST(N'2019-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
INSERT [dbo].[Temporada] ([CodTemporada], [Temporada], [FechaInicio], [FechaFin], [Tipo]) VALUES (1, 1, CAST(N'2019-01-01' AS Date), CAST(N'2019-03-31' AS Date), N'B')
GO
INSERT [dbo].[Temporada] ([CodTemporada], [Temporada], [FechaInicio], [FechaFin], [Tipo]) VALUES (2, 2, CAST(N'2019-04-01' AS Date), CAST(N'2019-05-31' AS Date), N'M')
GO
INSERT [dbo].[Temporada] ([CodTemporada], [Temporada], [FechaInicio], [FechaFin], [Tipo]) VALUES (3, 3, CAST(N'2019-06-01' AS Date), CAST(N'2019-08-31' AS Date), N'A')
GO
INSERT [dbo].[Temporada] ([CodTemporada], [Temporada], [FechaInicio], [FechaFin], [Tipo]) VALUES (4, 4, CAST(N'2019-09-01' AS Date), CAST(N'2019-10-31' AS Date), N'M')
GO
INSERT [dbo].[Temporada] ([CodTemporada], [Temporada], [FechaInicio], [FechaFin], [Tipo]) VALUES (5, 5, CAST(N'2019-11-01' AS Date), CAST(N'2019-12-31' AS Date), N'B')
GO
INSERT [dbo].[Tipo_Habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (1, 1, N'Si', N'No', N'No')
GO
INSERT [dbo].[Tipo_Habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (2, 2, N'Si', N'No', N'No')
GO
INSERT [dbo].[Tipo_Habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (3, 3, N'Si', N'No', N'No')
GO
INSERT [dbo].[Tipo_Habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (4, 4, N'Si', N'Si', N'No')
GO
SET IDENTITY_INSERT [dbo].[Tipo_Servicio] ON 

GO
INSERT [dbo].[Tipo_Servicio] ([CodTipoServicio], [NombreServicio]) VALUES (1, N'Comedor   ')
GO
INSERT [dbo].[Tipo_Servicio] ([CodTipoServicio], [NombreServicio]) VALUES (2, N'Lavanderia')
GO
SET IDENTITY_INSERT [dbo].[Tipo_Servicio] OFF
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Paises] FOREIGN KEY([CodPais])
REFERENCES [dbo].[Paises] ([CodPais])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Paises]
GO
ALTER TABLE [dbo].[Gastos]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_Gastos] FOREIGN KEY([CodGastos])
REFERENCES [dbo].[Gastos] ([CodGastos])
GO
ALTER TABLE [dbo].[Gastos] CHECK CONSTRAINT [FK_Gastos_Gastos]
GO
ALTER TABLE [dbo].[Gastos]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_Reserva_Habitacion] FOREIGN KEY([CodReserva])
REFERENCES [dbo].[Reserva_Habitacion] ([CodReserva])
GO
ALTER TABLE [dbo].[Gastos] CHECK CONSTRAINT [FK_Gastos_Reserva_Habitacion]
GO
ALTER TABLE [dbo].[Gastos]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_Servicios] FOREIGN KEY([CodServicios])
REFERENCES [dbo].[Servicios] ([CodServicios])
GO
ALTER TABLE [dbo].[Gastos] CHECK CONSTRAINT [FK_Gastos_Servicios]
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Habitaciones_Tipo_Habitacion] FOREIGN KEY([CodCategoria])
REFERENCES [dbo].[Tipo_Habitacion] ([Categoria])
GO
ALTER TABLE [dbo].[Habitaciones] CHECK CONSTRAINT [FK_Habitaciones_Tipo_Habitacion]
GO
ALTER TABLE [dbo].[Precio_Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Precio_Habitacion_Temporada] FOREIGN KEY([CodTemporada])
REFERENCES [dbo].[Temporada] ([CodTemporada])
GO
ALTER TABLE [dbo].[Precio_Habitacion] CHECK CONSTRAINT [FK_Precio_Habitacion_Temporada]
GO
ALTER TABLE [dbo].[Precio_Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Precio_Habitacion_Tipo_Habitacion] FOREIGN KEY([Tipo_Habitacion])
REFERENCES [dbo].[Tipo_Habitacion] ([Categoria])
GO
ALTER TABLE [dbo].[Precio_Habitacion] CHECK CONSTRAINT [FK_Precio_Habitacion_Tipo_Habitacion]
GO
ALTER TABLE [dbo].[Temporada]  WITH CHECK ADD  CONSTRAINT [Tipo] CHECK  (([Tipo]='A' OR [Tipo]='M' OR [Tipo]='B'))
GO
ALTER TABLE [dbo].[Temporada] CHECK CONSTRAINT [Tipo]
GO
ALTER TABLE [dbo].[Tipo_Habitacion]  WITH CHECK ADD  CONSTRAINT [Exterior] CHECK  (([Exterior]='No' OR [Exterior]='SI'))
GO
ALTER TABLE [dbo].[Tipo_Habitacion] CHECK CONSTRAINT [Exterior]
GO
ALTER TABLE [dbo].[Tipo_Habitacion]  WITH CHECK ADD  CONSTRAINT [Salon] CHECK  (([Salon]='No' OR [Salon]='Si'))
GO
ALTER TABLE [dbo].[Tipo_Habitacion] CHECK CONSTRAINT [Salon]
GO
ALTER TABLE [dbo].[Tipo_Habitacion]  WITH CHECK ADD  CONSTRAINT [Terraza] CHECK  (([Terraza]='No' OR [Terraza]='Si'))
GO
ALTER TABLE [dbo].[Tipo_Habitacion] CHECK CONSTRAINT [Terraza]
GO
