USE [master]
GO
/****** Object:  Database [SistemadeVentas]    Script Date: 20/02/2023 16:16:38 ******/
CREATE DATABASE [SistemadeVentas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemadeVentas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SistemadeVentas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemadeVentas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SistemadeVentas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SistemadeVentas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemadeVentas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemadeVentas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemadeVentas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemadeVentas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemadeVentas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemadeVentas] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemadeVentas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemadeVentas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemadeVentas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemadeVentas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemadeVentas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemadeVentas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemadeVentas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemadeVentas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemadeVentas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemadeVentas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemadeVentas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemadeVentas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemadeVentas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemadeVentas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemadeVentas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemadeVentas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemadeVentas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemadeVentas] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemadeVentas] SET  MULTI_USER 
GO
ALTER DATABASE [SistemadeVentas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemadeVentas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemadeVentas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemadeVentas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemadeVentas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemadeVentas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemadeVentas', N'ON'
GO
ALTER DATABASE [SistemadeVentas] SET QUERY_STORE = OFF
GO
USE [SistemadeVentas]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IDCategorias] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NOT NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategorias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDcliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cedula] [int] NOT NULL,
	[IDtelefono] [int] NOT NULL,
	[IDdireccion] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IDcliente] ASC,
	[IDtelefono] ASC,
	[IDdireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Clientes] UNIQUE NONCLUSTERED 
(
	[IDcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[IDdireccion] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IDdireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](100) NOT NULL,
	[CantidadExistente] [varchar](100) NULL,
	[PrecioActual] [money] NULL,
	[IDCategorias] [int] NOT NULL,
	[IDproveedores] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC,
	[IDCategorias] ASC,
	[IDproveedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Productos] UNIQUE NONCLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IDproveedores] [int] IDENTITY(1,1) NOT NULL,
	[NombreProveedor] [varchar](50) NOT NULL,
	[IDtelefono] [int] NOT NULL,
	[IDdireccion] [int] NOT NULL,
	[Paginaweb] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[IDproveedores] ASC,
	[IDtelefono] ASC,
	[IDdireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Proveedores] UNIQUE NONCLUSTERED 
(
	[IDproveedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[IDtelefono] [int] IDENTITY(1,1) NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[IDtelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 20/02/2023 16:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[IDVenta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Descuento] [decimal](9, 2) NOT NULL,
	[MontoFinal] [money] NOT NULL,
	[CantidadVendida] [int] NOT NULL,
	[IDcliente] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
 CONSTRAINT [PK_Ventas_1] PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC,
	[IDcliente] ASC,
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Direccion] FOREIGN KEY([IDdireccion])
REFERENCES [dbo].[Direccion] ([IDdireccion])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Direccion]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Telefono] FOREIGN KEY([IDtelefono])
REFERENCES [dbo].[Telefono] ([IDtelefono])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Telefono]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IDCategorias])
REFERENCES [dbo].[Categorias] ([IDCategorias])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([IDproveedores])
REFERENCES [dbo].[Proveedores] ([IDproveedores])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Direccion] FOREIGN KEY([IDdireccion])
REFERENCES [dbo].[Direccion] ([IDdireccion])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Direccion]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Telefono] FOREIGN KEY([IDtelefono])
REFERENCES [dbo].[Telefono] ([IDtelefono])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Telefono]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([IDcliente])
REFERENCES [dbo].[Clientes] ([IDcliente])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([IDProducto])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
USE [master]
GO
ALTER DATABASE [SistemadeVentas] SET  READ_WRITE 
GO
