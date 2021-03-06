USE [master]
GO
/****** Object:  Database [DB_sisteRestaurant]    Script Date: 09-04-2021 15:14:07 ******/
CREATE DATABASE [DB_sisteRestaurant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_sisteRestaurant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB_sisteRestaurant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_sisteRestaurant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB_sisteRestaurant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_sisteRestaurant] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_sisteRestaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_sisteRestaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_sisteRestaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_sisteRestaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_sisteRestaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_sisteRestaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_sisteRestaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_sisteRestaurant] SET  MULTI_USER 
GO
ALTER DATABASE [DB_sisteRestaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_sisteRestaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_sisteRestaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_sisteRestaurant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_sisteRestaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_sisteRestaurant] SET QUERY_STORE = OFF
GO
USE [DB_sisteRestaurant]
GO
/****** Object:  Table [dbo].[TBL_cliente]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[apellido2] [varchar](50) NOT NULL,
	[rut] [varchar](10) NOT NULL,
	[estado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_pedidos]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_pedidos](
	[numeroPedido] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[numeroPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ConsultaPedidos]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ConsultaPedidos]
AS
SELECT TOP 1000 ped.id_cliente,cli.rut, numeroPedido, nombre, apellido1, apellido2, cli.estado FROM TBL_pedidos ped 
INNER JOIN TBL_cliente cli
ON cli.id_cliente = ped.id_cliente
ORDER BY ped.id_cliente ASC
GO
/****** Object:  Table [dbo].[TBL_detalle]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_detalle](
	[numeroPedido] [int] NOT NULL,
	[codigoProducto] [int] NOT NULL,
	[cantidadProducto] [int] NOT NULL,
	[total] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_productos]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_productos](
	[codigoProducto] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[precioUnitario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_usuarios]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_usuarios](
	[nombreUsuario] [varchar](20) NOT NULL,
	[contraseña] [varbinary](max) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[apellido2] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_detalle]  WITH CHECK ADD  CONSTRAINT [fk_pedido] FOREIGN KEY([numeroPedido])
REFERENCES [dbo].[TBL_pedidos] ([numeroPedido])
GO
ALTER TABLE [dbo].[TBL_detalle] CHECK CONSTRAINT [fk_pedido]
GO
ALTER TABLE [dbo].[TBL_detalle]  WITH CHECK ADD  CONSTRAINT [fk_producto] FOREIGN KEY([codigoProducto])
REFERENCES [dbo].[TBL_productos] ([codigoProducto])
GO
ALTER TABLE [dbo].[TBL_detalle] CHECK CONSTRAINT [fk_producto]
GO
ALTER TABLE [dbo].[TBL_pedidos]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[TBL_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[TBL_pedidos] CHECK CONSTRAINT [fk_cliente]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscaEstadoCliente]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscaEstadoCliente]
@in_numeroPedido INT
AS
BEGIN
select cli.id_cliente, cli.estado, ped.numeroPedido from TBL_cliente cli INNER JOIN TBL_pedidos ped
ON cli.id_cliente = ped.id_cliente
where ped.numeroPedido =  @in_numeroPedido
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscaUsuarios]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BuscaUsuarios]
@in_nombreUsuario VARCHAR (20),
@in_contraseña VARCHAR (20)
AS
BEGIN 

DECLARE @contraseñaDes varchar(MAX)
SET @contraseñaDes = (SELECT CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password',contraseña)) 
from TBL_usuarios WHERE nombreUsuario = @in_nombreUsuario)


 SELECT * FROM TBL_usuarios WHERE nombreUsuario = @in_nombreUsuario AND @contraseñaDes = @in_contraseña
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CambiaEstado]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CambiaEstado]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertaCLiente]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertaCLiente]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertaDetalle]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertaDetalle]

@in_numeroPedido INT,
@in_codigoProducto INT,
@in_cantidadProducto INT,
@in_total int
AS
BEGIN
	INSERT INTO TBL_detalle VALUES (@in_numeroPedido,@in_codigoProducto,@in_cantidadProducto,@in_total)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertaPedido]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertaPedido]

 @in_id_cliente INT,
 @in_fecha DATE
AS
BEGIN  
	INSERT INTO TBL_pedidos VALUES (@in_id_cliente,@in_fecha)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertaProducto]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertaProducto]

@in_codigoProducto INT,
@in_descripcion VARCHAR (100),
@in_precioUnitario INT
AS 
BEGIN
 INSERT INTO TBL_productos VALUES (@in_codigoProducto,@in_descripcion,@in_precioUnitario)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertaUsuarios]    Script Date: 09-04-2021 15:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertaUsuarios]
@in_nombreUsuario VARCHAR (20),
@in_contraseña VARCHAR (20),
@in_nombre varchar (50),
@in_apellido1 VARCHAR (50),
@in_apellido2 VARCHAR (50)
AS
BEGIN
	INSERT INTO TBL_usuarios VALUES (@in_nombreUsuario,ENCRYPTBYPASSPHRASE('password',@in_contraseña),@in_nombre,@in_apellido1,@in_apellido2)
END
GO
USE [master]
GO
ALTER DATABASE [DB_sisteRestaurant] SET  READ_WRITE 
GO
