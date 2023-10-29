use Nestle
--INSERTS

SELECT * FROM Empleado

INSERT INTO Empleado (Nombre, Cedula, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico, IdPuesto, FechaContratacion, Salario, IdDepartamento)
VALUES ('Juan Pérez', '40223456789', '1990-06-20', 'M', 'Calle 1, #123', '8091234567', 'juanperez@gmail.com', 2, '2021-01-01', 50000, 2);

INSERT INTO Empleado (Nombre, Cedula, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico, IdPuesto, FechaContratacion, Salario, IdDepartamento)
VALUES ('Pedro Rodríguez', '00123456781', '1985-12-25', 'M', 'Calle 3, #789', '8093456789', 'pedrorodriguez@gmail.com', 2, '2019-05-01', 60000, 2);

INSERT INTO Empleado (Nombre, Cedula, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico, IdPuesto, FechaContratacion, Salario, IdDepartamento)
VALUES ('María García', '40223456780', '1995-10-15', 'F', 'Calle 2, #456', '8092345678', 'mariagarcia@gmail.com', 1, '2020-03-01', 40000, 1);


INSERT INTO Empleado (Nombre, Cedula, FechaNacimiento, Genero, Direccion, Telefono, CorreoElectronico, IdPuesto, FechaContratacion, Salario, IdDepartamento)
VALUES ('Laura Martínez', '00123456782', '1998-02-28', 'F', 'Calle 4, #1234', '8094567890', 'lauramartinez@hotmail.com', 3, '2022-01-15', 45000, 3);

SELECT * FROM Puesto

INSERT INTO Puesto (Nombre)
VALUES ('Gerente');

INSERT INTO Puesto (Nombre)
VALUES ('Conductor');

INSERT INTO Puesto (Nombre)
VALUES ('Supervisor');

SELECT * FROM Departamentos

INSERT INTO Departamentos (Nombre)
VALUES ('Ventas');

INSERT INTO Departamentos (Nombre)
VALUES ('Transporte y Logistica')

INSERT INTO Departamentos (Nombre)
VALUES ('Recursos Humanos');

SELECT * FROM Conductor 

INSERT INTO Conductor (IdEmpleado, FechaVencLicencia) 
VALUES (5, '2023-05-01');
INSERT INTO Conductor (IdEmpleado, FechaVencLicencia) 
VALUES (6, '2024-06-01');

SELECT * FROM Productos

INSERT INTO Productos (Nombre, Categoria, Precio, UnidadMedida)
VALUES ('Nesquik', 'Lácteos', 50, 'Onzas');

INSERT INTO Productos (Nombre, Categoria, Precio, UnidadMedida)
VALUES ('Nestea', 'Bebidas', 30, 'Litros');

INSERT INTO Productos (Nombre, Categoria, Precio, UnidadMedida)
VALUES ('KitKat', 'Confiteria', 30, 'Gramos');

INSERT INTO Productos (Nombre, Categoria, Precio, UnidadMedida)
VALUES ('Corn Flakes', 'Cereales', 30, 'Gramos');

SELECT * FROM FlotillaVehiculo

INSERT INTO FlotillaVehiculo (IdMarca, IdModelo, Placa, AnoFacturacion, TipoCombustible, UltimaFechaMant, FechaAdquisicion, EstadoVehiculo, IdConductor, Color, Chasis)
VALUES (1, 1, 'G4567', '2019', 'Gasolina', '2022-01-01', '2021-01-01', 'A', 9, 'Azul', '123456');

INSERT INTO FlotillaVehiculo (IdMarca, IdModelo, Placa, AnoFacturacion, TipoCombustible, UltimaFechaMant, FechaAdquisicion, EstadoVehiculo, IdConductor, Color, Chasis)
VALUES (2, 2, 'R8901', '2020', 'Diesel', '2022-02-01', '2021-02-01', 'A', 10, 'Negro', '654321');

SELECT * FROM FacturaMaestro

INSERT INTO FacturaMaestro (idCliente, FechadDeEmision) 
VALUES (2, '2023-04-19');
INSERT INTO FacturaMaestro (idCliente, FechadDeEmision) 
VALUES (3, '2023-04-19');

SELECT * FROM FacturaDetalle

INSERT INTO FacturaDetalle (IdFactura, idProducto, Cantidad, Precio) 
VALUES (17, 2, 2, 10.00);
INSERT INTO FacturaDetalle (IdFactura, idProducto, Cantidad, Precio) 
VALUES (18, 2, 3, 15.00);


SELECT * FROM Modelo

INSERT INTO Modelo (Modelo) 
VALUES ('Hiance');
INSERT INTO Modelo (Modelo) 
VALUES ('Hijet');

SELECT * FROM Marca


INSERT INTO Marca (Marca) 
VALUES ('Toyota');
INSERT INTO Marca (Marca) 
VALUES ('Daihatsu');


SELECT * FROM Clientes

INSERT INTO Clientes (Nombre, DireccionCliente, Telefono, CorreoElectronico, RNC) 
VALUES ('Nacional', 'Av. Núñez de Cáceres, esq. Guarocuya', '8492005776‎', 'SuperNacional@outlook.com', '12345678901');

INSERT INTO Clientes (Nombre, DireccionCliente, Telefono, CorreoElectronico, RNC) 
VALUES ('La Cadena', 'Av. Los Próceres #200 esq. Rep. de Colombia, Los Ríos.', '8092345678', 'LaCadena@yahoo.com', '23456789012');

INSERT INTO Clientes (Nombre, DireccionCliente, Telefono, CorreoElectronico, RNC) 
VALUES ('Jumbo', ' Av. Luperón, Santo Domingo, Dominican Republic', '8093332111', 'JumboLuperon@gmail.com', '34567890123');

--Insertar Cliente
CREATE PROCEDURE SP_InsertarCliente
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
--Actualizar cliente
CREATE PROCEDURE SP_UpdateCliente
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
--Eliminar Cliente
CREATE PROCEDURE sp_EliminarCliente
	@IdCliente INT
AS
BEGIN
	DELETE FROM Clientes 
	WHERE IdCliente = @IdCliente
END
GO
--Ver cliente
CREATE PROCEDURE SP_VerCliente
	@IdCliente INT
AS
BEGIN
	SELECT IdCliente, Nombre, DireccionCliente, Telefono, CorreoElectronico, RNC
	FROM Clientes
	WHERE IdCliente = @IdCliente
END
GO
--Insertar nuevo empleado
CREATE PROCEDURE SP_InsertEmpleado
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
--Ver Empleado
CREATE PROCEDURE SP_VerEmpleado
    @IdEmpleado int
AS
BEGIN
    SELECT *
    FROM Empleado
    WHERE IdEmpleado = @IdEmpleado
END
GO
--Actualizar Empleado
CREATE PROCEDURE SP_UpdateEmpleado
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
--Eliminar Empleado
CREATE PROCEDURE SP_DeleteEmpleado
    @IdEmpleado int
AS
BEGIN
    DELETE FROM Empleado
    WHERE IdEmpleado = @IdEmpleado
END
GO
--Actualizar Precios
CREATE PROCEDURE SP_UpdatePrecio 
    @Precio decimal (9, 2),
    @IdProducto int
AS
BEGIN
  UPDATE Productos
  SET Precio = @Precio
  WHERE IdProducto = @IdProducto
END
GO
---Eliminar Productos
CREATE PROCEDURE SP_EliminarProducto 
    @IdProducto int
AS
BEGIN

    DELETE FROM Productos
    WHERE IdProducto = @IdProducto
END
GO
--Ver productos
CREATE PROCEDURE SP_VerProducto 
    @IdProducto int
AS
BEGIN

    SELECT *
    FROM Productos
    WHERE IdProducto = @IdProducto
END
GO

--Cantidad total de productos
CREATE PROCEDURE SP_ObtenerTotalVentasProducto 
	@IdProducto INT
AS
BEGIN

	SELECT SUM(Cantidad) AS TotalVentas
	FROM FacturaDetalle
	WHERE IdProducto = @IdProducto;
END
GO

--Ver factura
CREATE PROCEDURE SP_VerFactura 
    @IdFactura int
AS
BEGIN

    SELECT fm.IdFactura, fm.idCliente, fm.FechadDeEmision, fd.idProducto, fd.Cantidad, fd.Precio
    FROM FacturaMaestro fm
    INNER JOIN FacturaDetalle fd ON fm.IdFactura = fd.IdFactura
    WHERE fm.IdFactura = @IdFactura;
END
GO

