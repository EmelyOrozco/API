--* Seleccionar 1 BD del Caso de Estudio visto en clases anteriores e ingresar información en las tablas de la base de datos (por lo menos 1 registro por tabla).
use [SistemadeVentas]
SELECT * FROM [dbo].[Categorias]
INSERT [dbo].[Categorias] ([NombreCategoria], [Descripcion])
VALUES ('Cocina', 'utensilios de cocina')

SELECT * FROM [dbo].[Direccion]
INSERT [dbo].[Direccion] ([Direccion])
VALUES ('Calle Gardenias 2')

INSERT [dbo].[Direccion] ([Direccion])
VALUES ('Calle Margarita')

SELECT * FROM [dbo].[Telefono]
INSERT [dbo].[Telefono] ([Telefono])
VALUES ('8293456')

INSERT [dbo].[Telefono] ([Telefono])
VALUES ('8679097')

SELECT * FROM [dbo].[Clientes]
INSERT [dbo].[Clientes] ([Nombre], [Cedula], [IDtelefono], [IDdireccion])
VALUES ('Maria', '2344567',	3, 1)

SELECT * FROM [dbo].[Proveedores]
INSERT [dbo].[Proveedores] ([NombreProveedor], [IDtelefono], [IDdireccion], [Paginaweb])
VALUES ('Rica',	4, 2, 'Rica.com')

SELECT * FROM [dbo].[Productos]
INSERT [dbo].[Productos] ([NombreProducto], [CantidadExistente], [PrecioActual], [IDCategorias], [IDproveedores])
VALUES ('Leche Rica',	10, 120, 1, 1)

SELECT * FROM [dbo].[Ventas]
INSERT  [dbo].[Ventas] ([Fecha], [Descuento], [MontoFinal], [CantidadVendida], [IDcliente], [IDProducto])
VALUES ('2023-04-03',	0.5, 200, 10, 5, 1)


--* Introducir el nuevo cliente "Ecuador".
use [FabricacionCelulares]
SELECT * FROM [dbo].[Clientes]
INSERT [dbo].[Clientes] ([NombreClientes], [Estatus])
VALUES ('Ecuador', 'I')

--* Crear vista V_Equipos cuando los los equipos tenga estatus de activo.

CREATE VIEW V_Equipos
AS
SELECT * 
FROM [dbo].[Equipos]
where Estatus = 'A'
--* Cree una copia de la tabla Distruidoras y borre los datos dejando solamente el de "Distribuidora Mendoza".
SELECT * FROM [dbo].[Distruidoras]

SELECT CodigoDistribuidora, NombreDistribuidora, Estatus
INTO Distruidoras2
FROM Distruidoras

SELECT * FROM [dbo].[Distruidoras2]
DELETE FROM [dbo].[Distruidoras2]
WHERE CodigoDistribuidora <> 004


--* De la tabla Equipos eliminar el registro de código 5.
SELECT * FROM [dbo].[Equipos]
DELETE FROM [dbo].[Facturas]
WHERE CodigoEquipo = '05'

DELETE FROM [dbo].[Equipos]
WHERE CodigoEquipo = '05'

--* De la base de datos AdventureWorksDW2019 exportar la data de la tabla DimEmployee cuando el SalesTerritoryKey sea diferente a 11 y colocarla en la base de datos FabricacionCelulares.
SELECT * FROM [dbo].[DimEmployee]
WHERE SalesTerritoryKey <> 11