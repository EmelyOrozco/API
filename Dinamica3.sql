Create database RojasImport
use RojasImport
CREATE TABLE Articulos(
	[CodArt] varchar (100) NOT NULL,
	[NombreArt] varchar (100) NOT NULL,
	[FechaFabr] datetime NOT NULL,
	[Cantidad] int not NULL,
	Precio int not null,
CONSTRAINT PK_Articulos PRIMARY KEY CLUSTERED 
( 
CodArt ASC
)
)
DROP TABLE [dbo].[Facturas]
CREATE TABLE Facturas (
	[CodFact] varchar (100) NOT NULL,
	[NombreCliente] varchar (100) NOT NULL,
	[CodElectr] varchar (100) NULL,
	[FechaFact] datetime not NULL,
	Monto int not null,
CONSTRAINT PK_Facturas PRIMARY KEY CLUSTERED 
( 
CodFact ASC
)
)
SELECT * FROM [dbo].[Articulos]
SELECT * FROM Facturas

--Contenga código del a, artículo, nombre del cliente, monto y fecha de factura cuando la fecha de facturación sea 15/02/2022.
UPDATE Facturas
SET FechaFact = '15/02/2022'
WHERE FechaFact is null

UPDATE Facturas 
SET FechaFact= '25/3/2021'
where NombreCliente = 'Ruben Carrasco'

SELECT CodArt, 
       NombreArt,
	   NombreCliente,
	   Monto,
	   FechaFact
FROM Articulos 
INNER JOIN Facturas
ON CodArt = CodElectr
WHERE FechaFact = '15/02/2022'
--Contenga código de la factura, nombre del artículo y precio de los artículos con código T008, S010, P002, N023.
SELECT CodFact, 
       NombreArt,
	   Precio,
	   CodArt
FROM Articulos
Left JOIN Facturas
ON CodArt = CodElectr
WHERE CodArt in ('T008', 'S010', 'P002', 'N023') 
--Contenga todos los campos de ambas tablas.
SELECT * FROM Articulos
full JOIN Facturas
ON CodArt = CodElectr
--Contenga los datos de todo lo que se ha vendido.
SELECT NombreArt,
	   NombreCliente,	
	   CodFact,
	   Monto
FROM Articulos
Right JOIN Facturas
ON CodArt = CodElectr
Where CodArt is not null
