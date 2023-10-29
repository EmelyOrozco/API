USE [Nestle]
GO
/****** Object:  User [AppUser]    Script Date: 20/04/2023 15:48:03 ******/
CREATE USER [AppUser] FOR LOGIN [AppUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NewUser]    Script Date: 20/04/2023 15:48:03 ******/
CREATE USER [NewUser] FOR LOGIN [NewUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [AppUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [AppUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NewUser]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[DireccionCliente] [varchar](150) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[CorreoElectronico] [varchar](30) NULL,
	[RNC] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[IdConductor] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaVencLicencia] [date] NOT NULL,
 CONSTRAINT [PK_Conductor] PRIMARY KEY CLUSTERED 
(
	[IdConductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[IdDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cedula] [varchar](11) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Genero] [char](1) NOT NULL,
	[Direccion] [varchar](150) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[IdPuesto] [int] NOT NULL,
	[FechaContratacion] [date] NOT NULL,
	[Salario] [decimal](10, 2) NOT NULL,
	[IdDepartamento] [int] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDetalle]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDetalle](
	[IdFactura] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_FacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaMaestro]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaMaestro](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[FechadDeEmision] [date] NOT NULL,
 CONSTRAINT [PK_FacturaMaestro] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlotillaVehiculo]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlotillaVehiculo](
	[IdVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[IdModelo] [int] NOT NULL,
	[Placa] [varchar](10) NOT NULL,
	[AnoFacturacion] [varchar](4) NULL,
	[TipoCombustible] [varchar](20) NOT NULL,
	[UltimaFechaMant] [date] NULL,
	[FechaAdquisicion] [date] NOT NULL,
	[EstadoVehiculo] [char](1) NOT NULL,
	[IdConductor] [int] NOT NULL,
	[Color] [varchar](30) NULL,
	[Chasis] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[IdModelo] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[IdModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Categoria] [varchar](30) NOT NULL,
	[Precio] [numeric](9, 2) NOT NULL,
	[UnidadMedida] [varchar](30) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[IdPuesto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[IdPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Conductor]  WITH CHECK ADD  CONSTRAINT [FK_Conductor_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Conductor] CHECK CONSTRAINT [FK_Conductor_Empleado]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamentos] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamentos] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamentos]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puesto] ([IdPuesto])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_FacturaMaestro] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[FacturaMaestro] ([IdFactura])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_FacturaMaestro]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Productos]
GO
ALTER TABLE [dbo].[FacturaMaestro]  WITH CHECK ADD  CONSTRAINT [FK_FacturaMaestro_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[FacturaMaestro] CHECK CONSTRAINT [FK_FacturaMaestro_Clientes]
GO
ALTER TABLE [dbo].[FlotillaVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_FlotillaVehiculo_Conductor] FOREIGN KEY([IdConductor])
REFERENCES [dbo].[Conductor] ([IdConductor])
GO
ALTER TABLE [dbo].[FlotillaVehiculo] CHECK CONSTRAINT [FK_FlotillaVehiculo_Conductor]
GO
ALTER TABLE [dbo].[FlotillaVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_FlotillaVehiculo_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[FlotillaVehiculo] CHECK CONSTRAINT [FK_FlotillaVehiculo_Marca]
GO
ALTER TABLE [dbo].[FlotillaVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_FlotillaVehiculo_Modelo] FOREIGN KEY([IdModelo])
REFERENCES [dbo].[Modelo] ([IdModelo])
GO
ALTER TABLE [dbo].[FlotillaVehiculo] CHECK CONSTRAINT [FK_FlotillaVehiculo_Modelo]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteEmpleado]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteEmpleado]
    @IdEmpleado int
AS
BEGIN
    DELETE FROM Empleado
    WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCliente]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarCliente]
	@IdCliente INT
AS
BEGIN
	DELETE FROM Clientes 
	WHERE IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarProducto]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarProducto] 
    @IdProducto int
AS
BEGIN

    DELETE FROM Productos
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarCliente]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarCliente]
    @Nombre varchar(50),
    @DireccionCliente varchar(150),
    @Telefono varchar(10),
    @CorreoElectronico varchar(30),
    @RNC varchar(11)
AS
BEGIN
    INSERT INTO Clientes (Nombre, DireccionCliente, Telefono, CorreoElectronico, RNC)
    VALUES (@Nombre, @DireccionCliente, @Telefono, @CorreoElectronico, @RNC)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEmpleado]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertEmpleado]
    @Nombre varchar(50),
    @Cedula varchar(11),
    @FechaNacimiento date,
    @Genero char(1),
    @Direccion varchar(150),
    @Telefono varchar(10),
    @CorreoElectronico varchar(100),
    @IdPuesto int,
    @FechaContratacion date,
    @Salario decimal(10,2),
    @IdDepartamento int
AS
BEGIN
    INSERT INTO Empleado (Nombre, Cedula, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico, IdPuesto, FechaContratacion, Salario, IdDepartamento)
    VALUES (@Nombre, @Cedula, @FechaNacimiento, @Genero, @Direccion, @Telefono, @CorreoElectronico, @IdPuesto, @FechaContratacion, @Salario, @IdDepartamento)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerTotalVentasProducto]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerTotalVentasProducto] 
	@IdProducto INT
AS
BEGIN

	SELECT SUM(Cantidad) AS TotalVentas
	FROM FacturaDetalle
	WHERE IdProducto = @IdProducto;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCliente]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateCliente]
	@IdCliente INT,
	@Nombre VARCHAR(50),
	@DireccionCliente VARCHAR(150),
	@Telefono VARCHAR(10),
	@CorreoElectronico VARCHAR(30),
	@RNC VARCHAR(11)
AS
BEGIN
	UPDATE Clientes 
	SET Nombre = @Nombre,
		DireccionCliente = @DireccionCliente,
		Telefono = @Telefono,
		CorreoElectronico = @CorreoElectronico,
		RNC = @RNC
	WHERE IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateEmpleado]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateEmpleado]
    @IdEmpleado int,
    @Nombre varchar(50),
    @Cedula varchar(11),
    @FechaNacimiento date,
    @Genero char(1),
    @Direccion varchar(150),
    @Telefono varchar(10),
    @CorreoElectronico varchar(100),
    @IdPuesto int,
    @FechaContratacion date,
    @Salario decimal(10,2),
    @IdDepartamento int
AS
BEGIN
    UPDATE Empleado
    SET Nombre = @Nombre, Cedula = @Cedula, FechaNacimiento = @FechaNacimiento, Genero = @Genero, Direccion = @Direccion, Telefono = @Telefono, CorreoElectronico = @CorreoElectronico, IdPuesto = @IdPuesto, FechaContratacion = @FechaContratacion, Salario = @Salario, IdDepartamento = @IdDepartamento
    WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePrecio]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdatePrecio] 
    @Precio decimal (9, 2),
    @IdProducto int
AS
BEGIN
  UPDATE Productos
  SET Precio = @Precio
  WHERE IdProducto = @IdProducto
END

GO
/****** Object:  StoredProcedure [dbo].[SP_VerCliente]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerCliente]
	@IdCliente INT
AS
BEGIN
	SELECT IdCliente, Nombre, DireccionCliente, Telefono, CorreoElectronico, RNC
	FROM Clientes
	WHERE IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VerEmpleado]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerEmpleado]
    @IdEmpleado int
AS
BEGIN
    SELECT *
    FROM Empleado
    WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VerFactura]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerFactura] 
    @IdFactura int
AS
BEGIN

    SELECT fm.IdFactura, fm.idCliente, fm.FechadDeEmision, fd.idProducto, fd.Cantidad, fd.Precio
    FROM FacturaMaestro fm
    INNER JOIN FacturaDetalle fd ON fm.IdFactura = fd.IdFactura
    WHERE fm.IdFactura = @IdFactura;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VerProducto]    Script Date: 20/04/2023 15:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerProducto] 
    @IdProducto int
AS
BEGIN

    SELECT *
    FROM Productos
    WHERE IdProducto = @IdProducto
END

GO
