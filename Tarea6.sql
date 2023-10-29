
--1. Crear un Stored Procedure que nos permita realizar una consulta a la tabla dbo.DimEmployee para los EmployeeKey 14, 20, 24, 33, 48.
use AdventureWorksDW2019
Select * FROM DimEmployee

CREATE PROCEDURE SP_DimEmployee 14, 20, 24, 33, 48

@employe1 int,
@employe2 int,
@employe3 int,
@employe4 int,
@employe5 int
AS
BEGIN

	SELECT * FROM DimEmployee
		WHERE EmployeeKey IN (@employe1, @employe2, @employe3, @employe4, @employe5)

END
GO
----
CREATE PROCEDURE SP_DimEmployee2 
AS

BEGIN
	SELECT * FROM DimEmployee
		WHERE EmployeeKey IN (14, 20, 24, 33, 48)
END
GO
--2. Crear una tabla nueva llamada DimProduct_New (vacía) con los campos ProductKey, ProductAlternateKey, EnglishProductName, Color desde la tabla DimProduct. Luego crear un stored procedure que nos permita realizar una consulta a la tabla dbo.DimProduct utilizando como parámetro el ProductKey y luego inserte en la tabla nueva (DimProduct_New) los datos de los campos descritos a esta última solamente.
Select * FROM DimProduct

SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color
INTO DimProduct_New
FROM DimProduct
WHERE ProductKey = 0
Select * FROM DimProduct_New

CREATE PROCEDURE SP_DimProduct 
@ProductKey int
AS
BEGIN
	SELECT * FROM DimProduct
	WHERE ProductKey = @ProductKey
	
	INSERT INTO DimProduct_New 
	SELECT ProductAlternateKey, EnglishProductName, Color
	FROM DimProduct
	WHERE ProductKey = @ProductKey

END
GO

--1. Crear un Stored Procedure que nos permita insertar información en la tabla Camioneros.
use Transportes

Select * FROM Camioneros
CREATE PROCEDURE  INS_Camioneros
@cedula varchar (11),
@nombre varchar (50),
@telefono varchar (10),
@direccion varchar (150),
@codigo int
AS
BEGIN
	INSERT INTO Camioneros ([Cedula], [Nombres], [Telefono], [Direccion], [CodigoProvincia])
	VALUES (@cedula, @nombre, @telefono, @direccion, @codigo)
END
GO
--2. Cree una tabla de Regiones y relacionar con Provincia.
Select * FROM Provincias
CREATE TABLE Regiones (
	IDRegion int IDENTITY(1,1) NOT NULL,
	Region varchar (100) NOT NULL,
 CONSTRAINT PK_Regiones PRIMARY KEY CLUSTERED 
(
	IDRegion ASC
)
)

ALTER TABLE Provincias ADD CodigoRegion int

Select * FROM Regiones
INSERT [dbo].[Regiones] ([Region])
VALUES ('Norte-Cibao')

INSERT [dbo].[Regiones] ([Region])
VALUES ('Suroeste')

INSERT [dbo].[Regiones] ([Region])
VALUES ('Sureste')
Select * FROM Regiones
--3. Crear un Stored Procedure que nos permita buscar una región y nos liste las provincias correspondientes a esta región.
CREATE PROC SP_Region 3
@Region int
AS
BEGIN
  SELECT Region,
  NombreProvincia
  FROM Provincias as p
  INNER JOIN Regiones as r
  ON p.CodigoRegion = r.IDRegion
  WHERE @Region = IDRegion
	
END
GO
--4. Crear un Stored Procedure que realice un reporte de los camioneros por provincia y camiones asignados.
Select * FROM Camioneros
Select * FROM Camiones

ALTER TABLE Camiones ADD IdCamionero int

INSERT [dbo].[Camiones] ([Matricula], [Modelo], [Tipo], [IdCamionero])
VALUES ('GLP9023', 'Camion Scania G', 'Caja cerrada', 1)

INSERT [dbo].[Camiones] ([Matricula], [Modelo], [Tipo], [IdCamionero])
VALUES ('A9912KL', 'Camion Scania P', 'Caja cerrada', 3)

INSERT [dbo].[Camiones] ([Matricula], [Modelo], [Tipo], [IdCamionero])
VALUES ('KE26780', 'Camion Ligero', 'Caja cerrada', 2)

CREATE PROC SP_Camion
AS
BEGIN
SELECT 
        Nombres,
		Cedula,
		NombreProvincia,
		Modelo,
		Tipo
FROM Camioneros B
INNER JOIN Camiones A
ON B.IdCamionero = A.IdCamionero
INNER JOIN Provincias C
ON C.CodigoProvincia = B.CodigoProvincia
END
GO

