CREATE DATABASE DB_sisteRestaurant
go

CREATE TABLE TBL_usuarios(

nombreUsuario VARCHAR (20) PRIMARY KEY NOT NULL,
contraseña VARBINARY (MAX) NOT NULL,
nombre varchar (50) NOT NULL,
apellido1 VARCHAR (50) NOT NULL,
apellido2 VARCHAR (50) NOT NULL,
)

CREATE TABLE TBL_cliente(

id_cliente INT  IDENTITY (1,1) PRIMARY KEY NOT NULL,
nombre VARCHAR (50) NOT NULL,
apellido1 VARCHAR (50) NOT NULL,
apellido2 VARCHAR (50) NOT NULL,
rut VARCHAR (10) NOT NULL,
estado VARCHAR (50) NOT NULL

)

CREATE TABLE TBL_pedidos(

numeroPedido INT  IDENTITY (1,1) PRIMARY KEY NOT NULL,
id_cliente INT,
fecha DATE
CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES TBL_cliente (id_cliente)
)


CREATE TABLE TBL_productos(

codigoProducto INT PRIMARY KEY NOT NULL,
descripcion VARCHAR (100) NOT NULL,
precioUnitario int NOT NULL

)

CREATE TABLE TBL_detalle (

numeroPedido INT NOT NULL,
codigoProducto INT NOT NULL,
cantidadProducto INT NOT NULL,
total int NOT NULL,
CONSTRAINT fk_pedido FOREIGN KEY (numeroPedido) REFERENCES TBL_pedidos (numeroPedido),
CONSTRAINT fk_producto FOREIGN KEY (codigoProducto) REFERENCES TBL_productos (codigoProducto)
)

-------------------------------------------------------------------------------------
--Procedimiento almacenado que inserta registros a la tabla TBL_usuarios
------------------------------------------------------------------------------------

ALTER PROCEDURE SP_InsertaUsuarios
@in_nombreUsuario VARCHAR (20),
@in_contraseña VARCHAR (20),
@in_nombre varchar (50),
@in_apellido1 VARCHAR (50),
@in_apellido2 VARCHAR (50)
AS
BEGIN
	INSERT INTO TBL_usuarios VALUES (@in_nombreUsuario,ENCRYPTBYPASSPHRASE('password',@in_contraseña),@in_nombre,@in_apellido1,@in_apellido2)
END

EXEC SP_InsertaUsuarios 'sibanez','ibanez1','sandor','ibanez','arriagada'
EXEC SP_InsertaUsuarios 'aramirezm','ramirez1989','antonio','ramirez','monsalve'



----------------------------------------------------------------------------------
--Procedimiento almacenado que inserta registros en la tabla TBL_cliente
----------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertaCLiente
@in_nombre VARCHAR (50),
@in_apellido1 VARCHAR (50),
@in_apellido2 VARCHAR (50),
@in_rut VARCHAR (10),
@in_estado VARCHAR (50)
AS
BEGIN

 IF EXISTS (SELECT rut from TBL_cliente WHERE rut = @in_rut)
	BEGIN
	  SELECT 'El rut de cliente ya existe'
	END
 ELSE
	BEGIN
	INSERT INTO TBL_cliente VALUES (@in_nombre,@in_apellido1,@in_apellido2,@in_rut,@in_estado)
    END
END

EXEC SP_InsertaCLiente 'antonio','ramirez','monsalve','17052271-0','reciente'

Select *  from TBL_cliente

DBCC CHECKIDENT (TBL_cliente, RESEED, 0)


-------------------------------------------------------------------------------------
--Procedimiento almacenado que inserta registros en la tabla TBL_pedidos
-------------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertaPedido

 @in_id_cliente INT,
 @in_fecha DATE
AS
BEGIN  
	INSERT INTO TBL_pedidos VALUES (@in_id_cliente,@in_fecha)
END

exec SP_InsertaPedido 1,'20201201'

--------------------------------------------------------------------------------
--Procedimiento almacenado que inserta registros en la tabla TBL_detalle
--------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertaDetalle

@in_numeroPedido INT,
@in_codigoProducto INT,
@in_cantidadProducto INT,
@in_total int
AS
BEGIN
	INSERT INTO TBL_detalle VALUES (@in_numeroPedido,@in_codigoProducto,@in_cantidadProducto,@in_total)
END


---------------------------------------------------------------------------
--Procedimiento almacenado que inserta registros en la tabla TBL_productos
----------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertaProducto

@in_codigoProducto INT,
@in_descripcion VARCHAR (100),
@in_precioUnitario INT
AS 
BEGIN
 INSERT INTO TBL_productos VALUES (@in_codigoProducto,@in_descripcion,@in_precioUnitario)
END

EXEC SP_InsertaProducto 5002,'Vigilante',5500

select * from TBL_productos


---------------------------------------------------------------------------------
--Procedimiento alamacenado que buscar usuarios autorizados 
---------------------------------------------------------------------------------

CREATE PROCEDURE SP_BuscaUsuarios
@in_nombreUsuario VARCHAR (20),
@in_contraseña VARCHAR (20)
AS
BEGIN 

DECLARE @contraseñaDes varchar(MAX)
SET @contraseñaDes = (SELECT CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password',contraseña)) 
from TBL_usuarios WHERE nombreUsuario = @in_nombreUsuario)


 SELECT * FROM TBL_usuarios WHERE nombreUsuario = @in_nombreUsuario AND @contraseñaDes = @in_contraseña
END
exec SP_BuscaUsuarios 'aramirezm','ramirez1989'


select * from TBL_pedidos

update  TBL_cliente set estado = 'Nuevo' where id_cliente = 1 and estado = 'reciente'









-------------------------------------------------------
--SP Cambia estado cliente con mas de 4 pedidos
-----------------------------------------------------
CREATE PROCEDURE SP_CambiaEstado
@in_id_cliente INT 
AS
BEGIN 
declare @CANTIDAD_PEDIDOS INT
SET @CANTIDAD_PEDIDOS = (SELECT count (id_cliente) FROM TBL_pedidos  WHERE id_cliente = @in_id_cliente)

IF(@CANTIDAD_PEDIDOS >=4)
  BEGIN
	UPDATE  TBL_cliente SET estado = 'Frecuente' WHERE id_cliente = @in_id_cliente
  END
ELSE
 PRINT 'CLIENTE NUEVO'
END

EXEC SP_CambiaEstado 1

select* from TBL_cliente

SELECT * FROM TBL_cliente

CREATE VIEW V_ConsultaPedidos
AS
SELECT TOP 1000 ped.id_cliente,cli.rut, numeroPedido, nombre, apellido1, apellido2, cli.estado FROM TBL_pedidos ped 
INNER JOIN TBL_cliente cli
ON cli.id_cliente = ped.id_cliente
ORDER BY ped.id_cliente ASC

select * from V_ConsultaPedidos


ALTER PROCEDURE SP_BuscaEstadoCliente
@in_numeroPedido INT
AS
BEGIN
select cli.id_cliente, cli.estado, ped.numeroPedido from TBL_cliente cli INNER JOIN TBL_pedidos ped
ON cli.id_cliente = ped.id_cliente
where ped.numeroPedido =  @in_numeroPedido
END

exec SP_BuscaEstadoCliente 3
---------------------------------------------------------------------------------------------------------------
	--Procedimiento almacenado que busca todo el detalle segun numero de pedido
	---------------------------------------------------------------------------------------------------------------
	CREATE PROCEDURE SP_BuscaDetalle
	@in_numeroPedido INT
	AS
    BEGIN
	SELECT numeroPedido,pro.codigoProducto , descripcion, det.cantidadProducto, total  FROM TBL_productos pro 
	INNER JOIN TBL_detalle det ON  pro.codigoProducto = det.codigoProducto WHERE numeroPedido = @in_numeroPedido
	END

	EXEC SP_BuscaDetalle 1

	----------------------------------------------------------------------------------------------------------------
	--Procedimiento almacenado que totaliza la compra segun numero pedido
	----------------------------------------------------------------------------------------------------------------
	CREATE PROCEDURE SP_TotalizaCompra
	@in_numeroPedido INT
	AS
    BEGIN
	SELECT SUM(total) as total FROM TBL_detalle WHERE numeroPedido = @in_numeroPedido
	END

	exec SP_TotalizaCompra 1




-------------------------------------------------------------------------------------------------------------
--Vista que muestra los pruductos mas vendidso
--------------------------------------------------------------------------------------------------------------


	CREATE VIEW V_ProductosMasVendidos
	AS
	SELECT TOP 100 det.codigoProducto,pro.descripcion ,COUNT(det.cantidadProducto) AS vendidos FROM TBL_detalle det  
	INNER JOIN TBL_productos pro  ON pro.codigoProducto = det.codigoProducto GROUP BY det.codigoProducto, descripcion
	Order BY vendidos DESC

	select * from V_ProductosMasVendidos