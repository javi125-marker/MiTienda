USE [master]
GO
/****** Object:  Database [DB_CARRITO]    Script Date: 16/1/2023 14:07:08 ******/
CREATE DATABASE [DB_CARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_CARRITO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_CARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_CARRITO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_CARRITO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_CARRITO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_CARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_CARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_CARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_CARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_CARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_CARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_CARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_CARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_CARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_CARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_CARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_CARRITO', N'ON'
GO
ALTER DATABASE [DB_CARRITO] SET QUERY_STORE = OFF
GO
USE [DB_CARRITO]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[TotalProducto] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[FechaCompra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](500) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[EsAdministrador] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Tecnología', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Muebles', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Dormitorio', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'Deportes', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'Zapatos', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'Accesorios', 0, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'Juguetería', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (8, N'Electrohogar', 1, CAST(N'2023-01-14T08:14:34.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRA] ON 

INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (9, 2, 2, CAST(450000.00 AS Decimal(10, 2)), N'083325325', N'Sauces 5', CAST(N'2023-01-16T11:44:14.253' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (10, 2, 1, CAST(750000.00 AS Decimal(10, 2)), N'0932552444', N'Gye', CAST(N'2023-01-16T13:03:12.473' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (11, 2, 2, CAST(550000.00 AS Decimal(10, 2)), N'fssafasf', N'safsfsfsafsa', CAST(N'2023-01-16T13:16:45.617' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (12, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'dsfdfd', N'qfafsfsaf', CAST(N'2023-01-16T13:17:20.223' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (13, 2, 1, CAST(300000.00 AS Decimal(10, 2)), N'3353253', N'dfgf', CAST(N'2023-01-16T13:20:21.397' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (14, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'34334343243', N'wffefsdfdsf', CAST(N'2023-01-16T13:25:43.260' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (15, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'vdvdsvdsd', N'efdfdfdsfdsfsdf', CAST(N'2023-01-16T13:25:59.470' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (16, 2, 2, CAST(550000.00 AS Decimal(10, 2)), N'dsvsdvd', N'dvdsvdsvds', CAST(N'2023-01-16T13:26:54.987' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (17, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'dsdd', N'334332', CAST(N'2023-01-16T13:27:25.483' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (18, 2, 2, CAST(450000.00 AS Decimal(10, 2)), N'wfweewew', N'dsfsdfsdfs', CAST(N'2023-01-16T13:40:49.963' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (19, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'ddsf', N'sdfsdf', CAST(N'2023-01-16T13:41:50.050' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (20, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'23523553', N'dfdfdsfsdf', CAST(N'2023-01-16T13:55:03.807' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Telefono], [Direccion], [FechaCompra]) VALUES (21, 2, 1, CAST(250000.00 AS Decimal(10, 2)), N'4343344444', N'dvvddsd', CAST(N'2023-01-16T13:59:10.973' AS DateTime))
SET IDENTITY_INSERT [dbo].[COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] ON 

INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (21, 9, 1, 1, CAST(200000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (22, 9, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (23, 10, 2, 3, CAST(750000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (24, 11, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (25, 11, 3, 1, CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (26, 12, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (27, 13, 3, 1, CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (28, 14, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (29, 15, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (30, 16, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (31, 16, 3, 1, CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (32, 17, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (33, 18, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (34, 18, 1, 1, CAST(200000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (35, 19, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (36, 20, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (37, 21, 2, 1, CAST(250000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 

INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'SONYTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'HPTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'LGTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'HYUNDAITE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'CANONTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'ROBERTA ALLENTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'MICATE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (8, N'FORLITE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (9, N'BE CRAFTYTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (10, N'ADIDASTE', 0, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (11, N'BESTTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (12, N'REEBOKTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (13, N'FOSSILTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (14, N'BILLABONGTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (15, N'POWCOTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (16, N'HOT WHEELSTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (17, N'LEGOTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (18, N'SAMSUNGTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (19, N'RECCOTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (20, N'INDURAMATE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (21, N'ALFANOTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (22, N'MABETE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (23, N'ELECTROLUXTE', 1, CAST(N'2023-01-14T08:14:34.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (1, N'Consola de PS4 Pro 1TB Negro', N'Tipo: PS4
Procesador: AMD
Entradas USB: 3
Entradas HDMI: 1
Conectividad: WiFi', 1, 1, CAST(2000.00 AS Decimal(10, 2)), 46, N'~/Imagenes/Productos/1.jpg', 1, CAST(N'2023-01-14T08:14:34.357' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (2, N'HP Laptop 15-EF1019LA', N'Procesador: AMD RYZEN R5
Modelo tarjeta de video: Gráficos AMD Radeon
Tamaño de la pantalla: 15.6 pulgadas
Disco duro sólido: 512GB
Núcleos del procesador: Hexa Core', 2, 1, CAST(2500.00 AS Decimal(10, 2)), 42, N'~/Imagenes/Productos/2.jpg', 1, CAST(N'2023-01-14T08:14:34.357' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (3, N'Televisor 65 4K Ultra HD Smart TV 65UN7100PSA.AWF', N'Tamaño de la pantalla: 65 pulgadas
Resolución: 4K Ultra HD
Tecnología: LED
Conexión Bluetooth: Sí
Entradas USB: 2', 3, 1, CAST(3000.00 AS Decimal(10, 2)), 113, N'~/Imagenes/Productos/3.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (4, N'Televisor 50 4K Ultra HD Smart Android', N'Tamaño de la pantalla: 50 pulgadas
Resolución: 4K Ultra HD
Tecnología: LED
Conexión Bluetooth: Sí
Entradas USB: 2', 4, 1, CAST(3200.00 AS Decimal(10, 2)), 69, N'~/Imagenes/Productos/4.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (5, N'Cámara Reflex EOS Rebel T100', N'', 5, 1, CAST(1560.00 AS Decimal(10, 2)), 89, N'~/Imagenes/Productos/5.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (6, N'Aparador Surat', N'Marca: Roberta Allen
Modelo: SURAT
Tipo: Buffets
Alto: 86 cm
Ancho: 85 cm', 6, 2, CAST(500.00 AS Decimal(10, 2)), 59, N'~/Imagenes/Productos/6.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (7, N'Mesa de Comedor Donatello', N'Ancho/Diámetro: 90 cm
Largo: 150 cm
Alto: 75 cm
Número de puestos: 6
Material de la base: Madera', 7, 2, CAST(400.00 AS Decimal(10, 2)), 90, N'~/Imagenes/Productos/7.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (8, N'Colchón Polaris 1 Plz + 1 Almohada + Protector', N'Nivel de confort: Intermedio
Tamaño: 1 plz
Tipo de estructura: Acero
Relleno del colchón: Resortes
Material del tapiz: Jacquard', 8, 3, CAST(500.00 AS Decimal(10, 2)), 120, N'~/Imagenes/Productos/8.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (9, N'Juegos de Sábanas 180 Hilos Solid', N'1.5 PLAZAS', 6, 3, CAST(200.00 AS Decimal(10, 2)), 129, N'~/Imagenes/Productos/9.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (10, N'Tocador Franca', N'Marca: Mica
Tipo: Tocadores
Modelo: Franca
Material de la estructura: Aglomerado MDP
Espesor: 15 mm', 7, 3, CAST(450.00 AS Decimal(10, 2)), 60, N'~/Imagenes/Productos/10.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (11, N'Alfombra Infantil de Osa Melange Medio', N'Marca: Be Crafty
Modelo: Osa
Tipo: Alfombras
Tipo de tejido: A mano
Tamaño: Pequeña', 9, 3, CAST(120.00 AS Decimal(10, 2)), 50, N'~/Imagenes/Productos/11.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (12, N'Mochila Unisex Deportivo Classic', N'NINGUNO', 10, 4, CAST(220.00 AS Decimal(10, 2)), 45, N'~/Imagenes/Productos/12.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (13, N'Bicicleta Montañera Best Inka Aro 29 Roja', N'NINGUNO', 11, 4, CAST(890.00 AS Decimal(10, 2)), 75, N'~/Imagenes/Productos/13.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (14, N'Zapatillas Urbanas Mujer adidas Team Court', N'TALLA: 4
TALLA:4.5', 10, 5, CAST(260.00 AS Decimal(10, 2)), 80, N'~/Imagenes/Productos/14.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (15, N'Zapatillas Training Hombre Rebook Dart TR 2', N'TALLA: 4
TALLA:4.5', 12, 5, CAST(230.00 AS Decimal(10, 2)), 38, N'~/Imagenes/Productos/15.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (16, N'Reloj', N'NINGUNO', 13, 6, CAST(300.00 AS Decimal(10, 2)), 20, N'~/Imagenes/Productos/16.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (17, N'Billetera Hombre', N'NINGUNO', 14, 6, CAST(87.00 AS Decimal(10, 2)), 88, N'~/Imagenes/Productos/17.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (18, N'Auto Deportivo 45 cm Naranja', N'COLOR: NARANJA', 15, 7, CAST(90.00 AS Decimal(10, 2)), 55, N'~/Imagenes/Productos/18.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (19, N'Set de Juego Hot Wheels Robo Tiburón', N'NINGUNO', 16, 7, CAST(130.00 AS Decimal(10, 2)), 70, N'~/Imagenes/Productos/19.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (20, N'Lego 10713 Set Classic: Maletín Creativo', N'NINGUNO', 17, 7, CAST(110.00 AS Decimal(10, 2)), 60, N'~/Imagenes/Productos/20.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (21, N'Refrigerador Samsung RT29K571JS8 295 litros', N'Modelo: RT29K571JS8/PE
Capacidad total útil: 295 lt
Dispensador de agua: Sí
Ice maker interior: Sí
Material de las bandejas: Vidrio templado', 18, 8, CAST(2100.00 AS Decimal(10, 2)), 90, N'~/Imagenes/Productos/21.jpg', 1, CAST(N'2023-01-14T08:14:34.360' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (22, N'Ventilador 3 En 1 16 50W', N'Marca: RECCO
Modelo: RD-40G-3
Tipo: Ventiladores 3 en 1
Número de velocidades: 4
Potencia: 50', 19, 8, CAST(1100.00 AS Decimal(10, 2)), 56, N'~/Imagenes/Productos/22.jpg', 1, CAST(N'2023-01-14T08:14:34.363' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (23, N'Frigobar RI-100BL 92 Lt Blanco', N'Marca: Indurama
Modelo: RI-100BL
Tipo: Frigobar
Eficiencia energética: A
Capacidad total útil: 92 lt', 20, 8, CAST(940.00 AS Decimal(10, 2)), 78, N'~/Imagenes/Productos/23.jpg', 1, CAST(N'2023-01-14T08:14:34.363' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (24, N'Aire Acondicionado 12,000 BTU/h Split', N'Marca: ALFANO
Modelo: 12000 BTU
Tipo: Aires acondicionados Split
Capacidad de enfriamiento: 12000 BTU
Modo: Frío', 21, 8, CAST(1700.00 AS Decimal(10, 2)), 56, N'~/Imagenes/Productos/24.jpg', 1, CAST(N'2023-01-14T08:14:34.363' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (25, N'Lavadora Mabe 16kg', N'Capacidad de carga: 16KG
Tipo de carga: Superior
Material del tambor: Acero inoxidable
Tecnología: No inverter
Dimensiones (AltoxAnchoxProfundidad): 100cmx62cmx61cm', 22, 8, CAST(2800.00 AS Decimal(10, 2)), 48, N'~/Imagenes/Productos/25.jpg', 1, CAST(N'2023-01-14T08:14:34.363' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (26, N'Campana Extractora EJSE202TBJS', N'Retráctil: No
Iluminación: Sí
Modelo: EJSE202TBJS
Tipo: Campanas clásicas
Alto: 14 cm', 23, 8, CAST(1500.00 AS Decimal(10, 2)), 56, N'~/Imagenes/Productos/26.jpg', 1, CAST(N'2023-01-14T08:14:34.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Contrasena], [EsAdministrador], [Activo], [FechaRegistro]) VALUES (1, N'Admin', N'user', N'admin@email.com', N'admin123', 1, 1, CAST(N'2023-01-14T08:14:34.333' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Contrasena], [EsAdministrador], [Activo], [FechaRegistro]) VALUES (2, N'Maria', N'Mora', N'mariamora@gmail.com', N'12345', 0, 1, CAST(N'2023-01-14T09:16:08.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaCompra]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarRutaImagen]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_actualizarRutaImagen](
@IdProducto int,
@RutaImagen varchar(500)
)
as
begin
	update PRODUCTO set RutaImagen = @RutaImagen where IdProducto = @IdProducto
end

GO
/****** Object:  StoredProcedure [dbo].[sp_editarProducto]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_editarProducto](
@IdProducto int,
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion and IdProducto != @IdProducto)
	begin
		update PRODUCTO set 
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio =@Precio ,
		Stock =@Stock ,
		Activo = @Activo where IdProducto = @IdProducto

		SET @Resultado =1
	end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCarrito]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_InsertarCarrito](
@IdUsuario int,
@IdProducto int,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CARRITO where IdProducto = @IdProducto and IdUsuario = @IdUsuario)
	begin
		update PRODUCTO set Stock = Stock -1 where IdProducto = @IdProducto
		insert into CARRITO(IdUsuario,IdProducto) values ( @IdUsuario,@IdProducto)
		set @Resultado = 1
	end
	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[sp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarMarca]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR MARCA
create procedure [dbo].[sp_ModificarMarca](
@IdMarca int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion =@Descripcion and IdMarca != @IdMarca)
		
		update MARCA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCarrito]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCarrito](
@IdUsuario int
)
as
begin
	select c.IdCarrito, p.IdProducto,m.Descripcion,p.Nombre,p.Precio,p.RutaImagen from carrito c
	inner join PRODUCTO p on p.IdProducto = c.IdProducto
	inner join MARCA m on m.IdMarca = p.IdMarca
	where c.IdUsuario = @IdUsuario
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCategoria]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerCategoria]
as
begin
 select * from CATEGORIA
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCompra]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCompra](
@IdUsuario int)
as
begin
select c.Total,convert(char(10),c.FechaCompra,103)[Fecha],

(select m.Descripcion, p.Nombre,p.RutaImagen,dc.Total,dc.Cantidad from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
inner join MARCA m on m.IdMarca = p.IdMarca
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from compra c
where c.IdUsuario = @IdUsuario
FOR XML PATH('COMPRA'), ROOT('DATA') 
end

exec sp_ObtenerCompra 2
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMarca]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerMarca]
as
begin
 select * from MARCA
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerProducto]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerProducto]
as
begin
 select p.*,m.Descripcion[DescripcionMarca],c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join marca m on m.IdMarca = p.IdMarca
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuario]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_obtenerUsuario](
@Correo varchar(100),
@Contrasena varchar(100)
)
as
begin
	IF EXISTS (SELECT * FROM usuario WHERE correo = @Correo and contrasena = @Contrasena)
	begin
		SELECT IdUsuario,Nombres,Apellidos,Correo,Contrasena,EsAdministrador FROM usuario WHERE correo = @Correo and contrasena = @Contrasena
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_registrarCompra]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_registrarCompra](
@IdUsuario int,
@TotalProducto int,
@Total decimal(10,2),
@Telefono varchar(100),
@Direccion varchar(100),
@QueryDetalleCompra nvarchar(max),
@Resultado bit output
)
as
begin
	begin try
		SET @Resultado = 0
		begin transaction
		
		declare @idcompra int = 0
		insert into COMPRA(IdUsuario,TotalProducto,Total,Telefono,Direccion) values
		(@IdUsuario,@TotalProducto,@Total,@Telefono,@Direccion)

		set @idcompra = scope_identity()

		set @QueryDetalleCompra = replace(@QueryDetalleCompra,'¡idcompra!',@idcompra)

		EXECUTE sp_executesql @QueryDetalleCompra

		delete from CARRITO where IdUsuario = @IdUsuario

		SET @Resultado = 1

		commit
	end try
	begin catch
		rollback
		SET @Resultado = 0
	end catch
end

GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR MARCA
CREATE PROC [dbo].[sp_RegistrarMarca](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)

		insert into MARCA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_registrarProducto]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarProducto](
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@RutaImagen varchar(500),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion)
	begin
		insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values (
		@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@RutaImagen)

		SET @Resultado = scope_identity()
	end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_registrarUsuario]    Script Date: 16/1/2023 14:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Contrasena varchar(100),
@EsAdministrador bit,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values
		(@Nombres,@Apellidos,@Correo,@Contrasena,@EsAdministrador)

		SET @Resultado = scope_identity()
	end
end
GO
USE [master]
GO
ALTER DATABASE [DB_CARRITO] SET  READ_WRITE 
GO
