USE [master]
GO
/****** Object:  Database [LaundryDB]    Script Date: 10.06.2022 11:49:21 ******/
CREATE DATABASE [LaundryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaundryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LaundryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaundryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LaundryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LaundryDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaundryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaundryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaundryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaundryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaundryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaundryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaundryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaundryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaundryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaundryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaundryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaundryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaundryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaundryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaundryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaundryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaundryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaundryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaundryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaundryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaundryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaundryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaundryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaundryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LaundryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LaundryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaundryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaundryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaundryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaundryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LaundryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LaundryDB', N'ON'
GO
ALTER DATABASE [LaundryDB] SET QUERY_STORE = OFF
GO
USE [LaundryDB]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 10.06.2022 11:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.06.2022 11:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10.06.2022 11:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[NameSurname] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[Phone] [char](11) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10.06.2022 11:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[CustomerId] [int] NULL,
	[Date] [varchar](50) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([AdminId], [userName], [password]) VALUES (1, N'm@gmail.com', N'mehtap')
INSERT [dbo].[Admins] ([AdminId], [userName], [password]) VALUES (4, N'mehtap', N'123')
INSERT [dbo].[Admins] ([AdminId], [userName], [password]) VALUES (5, N'admin', N'admin')
INSERT [dbo].[Admins] ([AdminId], [userName], [password]) VALUES (6, N'm', N'm')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (1, N'Gelinlik', 2000)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (2, N'Mont', 500)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (3, N'Kaban', 750)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (4, N'Abiye', 1000)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (5, N'Gömlek', 150)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (6, N'Pantolon', 275)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (7, N'Damatlık', 2500)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Price]) VALUES (8, N'Takım Elbise', 2000)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Adress], [Phone], [Password]) VALUES (4, N'İrem Karslı', N'irem@mail.com', N'Ümraniye/İst', N'11111111112', NULL)
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Adress], [Phone], [Password]) VALUES (26, N'Sinan çetin', N'sdf@gmail', N'Şişli', N'45776464   ', NULL)
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Adress], [Phone], [Password]) VALUES (27, N'Zeynel Günsu', N'asdas', N'd', N'24223      ', NULL)
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Adress], [Phone], [Password]) VALUES (28, N'mehtap', N'me@hotmail.com', N'İkitelli', N'32425235235', NULL)
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Adress], [Phone], [Password]) VALUES (40, N'Arda Tokgöz', N'ardatok@gmail.com', N'Üsküdar', N'02121212111', NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceId], [CategoryId], [CustomerId], [Date]) VALUES (5, 2, 26, N'15.05.2022')
INSERT [dbo].[Services] ([ServiceId], [CategoryId], [CustomerId], [Date]) VALUES (6, 3, 26, N'10.04.2022')
INSERT [dbo].[Services] ([ServiceId], [CategoryId], [CustomerId], [Date]) VALUES (7, 4, 27, N'19.06.2022')
INSERT [dbo].[Services] ([ServiceId], [CategoryId], [CustomerId], [Date]) VALUES (11, 5, 28, N'22.12.2022')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Categories]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Customers]
GO
USE [master]
GO
ALTER DATABASE [LaundryDB] SET  READ_WRITE 
GO
