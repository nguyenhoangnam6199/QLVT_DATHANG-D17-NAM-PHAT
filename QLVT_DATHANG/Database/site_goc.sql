USE [master]
GO
/****** Object:  Database [QLVT_DATHANG]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE DATABASE [QLVT_DATHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLVT_DATHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLVT_DATHANG.mdf' , SIZE = 38912KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLVT_DATHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLVT_DATHANG_log.ldf' , SIZE = 39296KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLVT_DATHANG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLVT_DATHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLVT_DATHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLVT_DATHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLVT_DATHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLVT_DATHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET RECOVERY FULL 
GO
ALTER DATABASE [QLVT_DATHANG] SET  MULTI_USER 
GO
ALTER DATABASE [QLVT_DATHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLVT_DATHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLVT_DATHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLVT_DATHANG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLVT_DATHANG] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLVT_DATHANG', N'ON'
GO
USE [QLVT_DATHANG]
GO
/****** Object:  User [TGKN]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE USER [TGKN] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HTKN]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE ROLE [MSmerge_PAL_role]
GO
/****** Object:  DatabaseRole [MSmerge_AEE199673AEB4BC6B6392924A91C0D72]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE ROLE [MSmerge_AEE199673AEB4BC6B6392924A91C0D72]
GO
/****** Object:  DatabaseRole [MSmerge_795C5D1C53994948A9C14104016A0E80]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE ROLE [MSmerge_795C5D1C53994948A9C14104016A0E80]
GO
/****** Object:  DatabaseRole [MSmerge_0B64D9170AE14BAA92515583E5D8F0B8]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE ROLE [MSmerge_0B64D9170AE14BAA92515583E5D8F0B8]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_AEE199673AEB4BC6B6392924A91C0D72]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_795C5D1C53994948A9C14104016A0E80]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_0B64D9170AE14BAA92515583E5D8F0B8]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MACN] [nchar](10) NOT NULL,
	[ChiNhanh] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_A2764362A06744E29C830C67712974DC]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDDH]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDDH](
	[MasoDDH] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_715F2C67640644C389C16A50305698D2]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CTDDH] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MAPN] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_16FB5C3B42B44AFABF75B5141C6FF3AD]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPX]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPX](
	[MAPX] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_4AB3CD34B49A464BA1A22A204B7F3911]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CTPX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[MasoDDH] [nchar](8) NOT NULL CONSTRAINT [DF_DatHang_MasoDDH]  DEFAULT (getdate()),
	[NGAY] [date] NOT NULL CONSTRAINT [DF_DatHang_NGAY]  DEFAULT (getdate()),
	[NhaCC] [nvarchar](100) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_BF954F01838D4363865785A54A973597]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kho]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MAKHO] [nchar](4) NOT NULL,
	[TENKHO] [nvarchar](30) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[MACN] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_56C5D0BE3E544C2CB18331016F906490]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [int] NOT NULL,
	[HO] [nvarchar](40) NULL,
	[TEN] [nvarchar](10) NULL,
	[DIACHI] [nvarchar](100) NULL,
	[NGAYSINH] [datetime] NULL,
	[LUONG] [float] NULL,
	[MACN] [nchar](10) NULL,
	[TrangThaiXoa] [int] NULL CONSTRAINT [DF_NhanVien_TrangThaiXoa]  DEFAULT ((0)),
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_6AC5D6B73ECC402BAD2B5B4DEE2F4B35]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MAPN] [nchar](8) NOT NULL CONSTRAINT [DF_PhieuNhap_MAPN]  DEFAULT (getdate()),
	[NGAY] [date] NOT NULL CONSTRAINT [DF_PhieuNhap_NGAY]  DEFAULT (getdate()),
	[MasoDDH] [nchar](8) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_26DA9A52985B4D17A7A574C976C8140E]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MAPX] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL CONSTRAINT [DF_PX_NGAY]  DEFAULT (getdate()),
	[HOTENKH] [nvarchar](100) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_6C198B41EA354768BC9F3E1E12740C07]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_PX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vattu]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vattu](
	[MAVT] [nchar](4) NOT NULL,
	[TENVT] [nvarchar](30) NOT NULL,
	[DVT] [nvarchar](15) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_FA6B5FB094054A43BFC981ED4BF81996]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[MAVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_DS_PHANMANH]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DS_PHANMANH]
AS
SELECT TOP 2  TENCN=PUBS.description, TENSERVER= subscriber_server
   FROM dbo.sysmergepublications PUBS,  dbo.sysmergesubscriptions SUBS
   WHERE PUBS.pubid= SUBS.PUBID  AND PUBS.publisher <> SUBS.subscriber_server
GO
INSERT [dbo].[ChiNhanh] ([MACN], [ChiNhanh], [DIACHI], [SoDT], [rowguid]) VALUES (N'CN1       ', N'Chi nhánh 1 TP HCM', N'35 Trần Hưng Đạo P1 Q1', N'999111888', N'51dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[ChiNhanh] ([MACN], [ChiNhanh], [DIACHI], [SoDT], [rowguid]) VALUES (N'CN2       ', N'Chi nhánh 2 TP Cần Thơ', N'27 Nguyễn Huệ', N'333222111', N'52dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'DH1     ', N'M02 ', 10, 2, N'193a41e9-a12b-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH01  ', N'M02 ', 50, 5000, N'bcfd4ddf-3024-eb11-b995-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH02  ', N'MU01', 6, 5000, N'70dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH04  ', N'M01 ', 10, 4000, N'6fdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH05  ', N'M01 ', 1, 1000, N'2672d5df-442a-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH05  ', N'M02 ', 14, 1000, N'9c9a721b-442a-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH05  ', N'MX02', 1, 1000, N'573dfb90-452a-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH05  ', N'MX07', 50, 1000, N'008b820f-432a-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH05  ', N'TV02', 20, 1000, N'9b01c097-3b2a-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH06  ', N'M01 ', 100, 1500, N'6c04d768-7329-eb11-b996-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH06  ', N'M02 ', 50, 2000, N'7250a490-7629-eb11-b996-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH06  ', N'MU01', 20, 2300, N'89c0e6d1-292e-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH06  ', N'MX02', 120, 7000, N'a91f8f60-7a29-eb11-b996-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH06  ', N'TV02', 50, 6500, N'4cbe84fa-7929-eb11-b996-54e1ad7deed1')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH07  ', N'M02 ', 50, 1500, N'd0ef17c2-2b2e-eb11-b996-865584f597a0')
INSERT [dbo].[CTDDH] ([MasoDDH], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'MDDH07  ', N'MX02', 50, 2500, N'a5f53e54-4e2e-eb11-b996-865584f597a0')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN      ', N'M02 ', 1, 2, N'1c9836f2-a12b-eb11-b996-865584f597a0')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN01    ', N'M01 ', 10, 500, N'74dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN04    ', N'M02 ', 10, 1000, N'ae7ec02a-462a-eb11-b996-865584f597a0')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN04    ', N'MX07', 1, 1, N'64523c73-472a-eb11-b996-865584f597a0')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN05    ', N'TV02', 20, 500, N'9161e9ff-9c29-eb11-b996-54e1ad7deed1')
INSERT [dbo].[CTPN] ([MAPN], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PN06    ', N'MX02', 25, 2500, N'311d7177-4e2e-eb11-b996-865584f597a0')
INSERT [dbo].[CTPX] ([MAPX], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PX01    ', N'MX02', 4, 5600, N'72dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[CTPX] ([MAPX], [MAVT], [SOLUONG], [DONGIA], [rowguid]) VALUES (N'PX02    ', N'MU01', 50, 1000, N'004f4b26-a629-eb11-b996-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'a       ', CAST(N'2020-11-02' AS Date), N'a', 3, NULL, N'02b07ed6-0733-eb11-b996-865584f597a0')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'DH1     ', CAST(N'2020-11-11' AS Date), N'Điện Máy Xanh', 5, N'K1N2', N'c617e890-a12b-eb11-b996-865584f597a0')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH01  ', CAST(N'2017-09-15' AS Date), N'CTY Điện máy xanh', 1, N'K2N1', N'67dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH02  ', CAST(N'2017-09-15' AS Date), N'CTY Panasonic', 1, N'K2N1', N'68dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH03  ', CAST(N'2017-09-15' AS Date), N'CTY Samsung', 9, N'K2N1', N'69dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH04  ', CAST(N'2020-11-09' AS Date), N'CTY FPT', 6, N'K2N1', N'7bedcd7c-2624-eb11-b995-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH05  ', CAST(N'2020-11-17' AS Date), N' CTY NAM', 3, N'K3N1', N'dd12e885-6929-eb11-b996-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH06  ', CAST(N'2020-11-17' AS Date), N'CTY KIEU', 3, N'K2N1', N'2f9bf360-6e29-eb11-b996-54e1ad7deed1')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'MDDH07  ', CAST(N'2020-11-23' AS Date), N'CTY PHAT', 3, N'K3N1', N'41d91dac-292e-eb11-b996-865584f597a0')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO], [rowguid]) VALUES (N'r       ', CAST(N'2020-11-10' AS Date), N'r', 3, N'K2N1', N'7148128b-e432-eb11-b996-865584f597a0')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K1N1', N'KHO A', N'28-30 Ngô Quyền P1 Q5', N'CN1       ', N'59dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K1N2', N'LONG PHU', N'127 Ngô Thì Nhậm', N'CN2       ', N'5edd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K2N1', N'KHO B', N'78 Nguyen Trai, TPHCM', N'CN1       ', N'5add0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K2N2', N'KHO VT', N'23,Hoàng Diệu 2', N'CN2       ', N'5cdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K3N1', N'CONG NGHIEP', N'555 Trần Hưng đạo', N'CN1       ', N'58dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K3N2', N'KHO XD', N'34,Quang Trung THủ Đức TPHCM', N'CN2       ', N'5ddd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN], [rowguid]) VALUES (N'K4N1', N'KHO HH', N'134 Đình Phong Phú ,Quận 9,TPHCM', N'CN1       ', N'5bdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (1, N'Lương', N'Trang', N'Thủ Đức', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 7000000, N'CN1       ', 0, N'5fdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (2, N'Nguyễn', N'Hà', N'Quận 9', CAST(N'2001-03-05 00:00:00.000' AS DateTime), 4000000, N'CN2       ', 0, N'60dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (3, N'Trần', N'Thanh', N'Quận 10', CAST(N'1994-07-04 00:00:00.000' AS DateTime), 5000000, N'CN1       ', 0, N'61dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (4, N'Thái', N'Hà', N'Quận 6', CAST(N'2001-07-06 00:00:00.000' AS DateTime), 7000000, N'CN1       ', 1, N'62dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (5, N'Hồ', N'Thái', N'Bình Thạnh', CAST(N'2001-02-05 00:00:00.000' AS DateTime), 6000000, N'CN2       ', 0, N'63dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (6, N'Hà', N'An', N'Gò Vấp', CAST(N'1996-04-06 00:00:00.000' AS DateTime), 5000000, N'CN1       ', 0, N'64dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (7, N'Lê', N'Trà', N'Phú Nhuận', CAST(N'1996-03-07 00:00:00.000' AS DateTime), 7000000, N'CN2       ', 0, N'65dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (8, N'Nguyễn', N'Hợp', N'Thủ Đức', CAST(N'1997-07-06 00:00:00.000' AS DateTime), 8000000, N'CN1       ', 1, N'66dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (9, N'Nguyễn', N'Nam', N'Bình Dương', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 5555555, N'CN1       ', 0, N'b77bc006-3920-eb11-b994-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (10, N'Dương', N'Phát', N'Bình Thuận', CAST(N'2020-11-01 00:00:00.000' AS DateTime), 5000000, N'CN1       ', 1, N'c2fe67ca-8422-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (12, N'Kiều', N'Phan', N'Đồng Nai', CAST(N'1999-05-11 00:00:00.000' AS DateTime), 4000000, N'CN2       ', 0, N'14306e2b-4d23-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (13, N'Mỹ', N'Ngọc', N'Biên Hòa', CAST(N'1998-06-28 00:00:00.000' AS DateTime), 5000000, N'CN2       ', 0, N'0681a43c-4d23-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (14, N'Kiều', N'Nguyên', N'Đắc Lắc', CAST(N'1998-04-15 00:00:00.000' AS DateTime), 4000000, N'CN2       ', 0, N'd959ad53-4d23-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (15, N'Dương', N'Phát', N'Bình Thuận', CAST(N'2020-11-01 00:00:00.000' AS DateTime), 5000000, N'CN2       ', 0, N'c8eb7d96-392d-eb11-b996-865584f597a0')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (16, N'r', N'r', N'r', CAST(N'2020-11-18 00:00:00.000' AS DateTime), 6666666, N'CN1       ', 1, N'094fa5e2-de32-eb11-b996-865584f597a0')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN], [TrangThaiXoa], [rowguid]) VALUES (17, N'r', N'r', N'r', CAST(N'2020-11-18 00:00:00.000' AS DateTime), 6666666, N'CN2       ', 0, N'dc31528b-ed32-eb11-b996-865584f597a0')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN      ', CAST(N'2020-11-25' AS Date), N'DH1     ', 5, N'K2N2', N'f8f23ad5-a12b-eb11-b996-865584f597a0')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN01    ', CAST(N'2017-09-15' AS Date), N'MDDH01  ', 1, N'K1N1', N'6ddd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN02    ', CAST(N'2020-11-04' AS Date), N'MDDH02  ', 3, NULL, N'b2fc84c0-ea28-eb11-b995-54e1ad7deed1')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN03    ', CAST(N'2017-09-15' AS Date), N'MDDH03  ', 9, N'K1N1', N'6edd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN04    ', CAST(N'2020-11-16' AS Date), N'MDDH04  ', 3, NULL, N'c72cf6d8-eb28-eb11-b995-54e1ad7deed1')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN05    ', CAST(N'2020-11-16' AS Date), N'MDDH06  ', 3, N'K1N1', N'6c065371-8629-eb11-b996-54e1ad7deed1')
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO], [rowguid]) VALUES (N'PN06    ', CAST(N'2020-11-23' AS Date), N'MDDH07  ', 3, N'K2N1', N'8e548134-4e2e-eb11-b996-865584f597a0')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MANV], [MAKHO], [rowguid]) VALUES (N'PX01    ', CAST(N'2017-09-15' AS Date), N'Nguyễn Thị Ánh Hồng', 1, N'K1N1', N'6add0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MANV], [MAKHO], [rowguid]) VALUES (N'PX02    ', CAST(N'2017-09-15' AS Date), N'Trần Thị Mỹ Hà', 3, N'K2N1', N'6bdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[PhieuXuat] ([MAPX], [NGAY], [HOTENKH], [MANV], [MAKHO], [rowguid]) VALUES (N'PX04    ', CAST(N'2017-09-16' AS Date), N'Nguyễn Hoàng Nam', 3, N'K1N1', N'd805baee-0d33-eb11-b996-865584f597a0')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [rowguid]) VALUES (N'M01 ', N'Máy giặt tự động cửa trước', N'Cái', N'53dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [rowguid]) VALUES (N'M02 ', N'Laptop Gaming', N'Chiếc', N'9e6b1105-9e22-eb11-b995-54e1ad7deed1')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [rowguid]) VALUES (N'MU01', N'Máy uốn tóc', N'Cái', N'56dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [rowguid]) VALUES (N'MX02', N'Máy sấy', N'Cái', N'55dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [rowguid]) VALUES (N'MX07', N'Máy lạnh LG', N'Cái', N'54dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [rowguid]) VALUES (N'TV02', N'Ti vi Sam Sung', N'Cái', N'57dd0f36-490d-eb11-b98d-54e1ad7deed1')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_ChiNhanh]    Script Date: 11/30/2020 8:55:27 PM ******/
ALTER TABLE [dbo].[ChiNhanh] ADD  CONSTRAINT [UK_ChiNhanh] UNIQUE NONCLUSTERED 
(
	[ChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_245575913]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_245575913] ON [dbo].[ChiNhanh]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_485576768]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_485576768] ON [dbo].[CTDDH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_597577167]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_597577167] ON [dbo].[CTPN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_565577053]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_565577053] ON [dbo].[CTPX]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_421576540]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_421576540] ON [dbo].[DatHang]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TENKHO]    Script Date: 11/30/2020 8:55:27 PM ******/
ALTER TABLE [dbo].[Kho] ADD  CONSTRAINT [UK_TENKHO] UNIQUE NONCLUSTERED 
(
	[TENKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_373576369]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_373576369] ON [dbo].[Kho]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_341576255]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_341576255] ON [dbo].[NhanVien]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_MaSoDDH]    Script Date: 11/30/2020 8:55:27 PM ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [UK_MaSoDDH] UNIQUE NONCLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_517576882]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_517576882] ON [dbo].[PhieuNhap]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_453576654]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_453576654] ON [dbo].[PhieuXuat]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TENVT]    Script Date: 11/30/2020 8:55:27 PM ******/
ALTER TABLE [dbo].[Vattu] ADD  CONSTRAINT [UK_TENVT] UNIQUE NONCLUSTERED 
(
	[TENVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_293576084]    Script Date: 11/30/2020 8:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_293576084] ON [dbo].[Vattu]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_DatHang]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_VatTu]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PhieuNhap] ([MAPN])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_VatTu]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_PX] FOREIGN KEY([MAPX])
REFERENCES [dbo].[PhieuXuat] ([MAPX])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_PX]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_VatTu]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_Kho]
GO
ALTER TABLE [dbo].[DatHang]  WITH NOCHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
ALTER TABLE [dbo].[Kho]  WITH NOCHECK ADD  CONSTRAINT [FK_Kho_Kho] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Kho]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_DatHang]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Kho]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_Kho]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH NOCHECK ADD  CONSTRAINT [FK_PX_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PX_NhanVien]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIA] CHECK NOT FOR REPLICATION (([DONGIA]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_DONGIA]
GO
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONG] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_SOLUONG]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPN] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_DONGIACTPN]
GO
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPN] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_SOLUONGCTPN]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPX] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_DONGIACTPX]
GO
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPX] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_SOLUONGCTPX]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [CK_LUONG] CHECK NOT FOR REPLICATION (([LUONG]>=(4000000)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_LUONG]
GO
/****** Object:  StoredProcedure [dbo].[sp_chuyenchinhanh]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_chuyenchinhanh]
@manv int,
@mamoi int
as
begin
	declare @ttx int
	--declare @a int
	--declare @b int
	select @ttx=TrangThaiXoa from NhanVien where MANV = @manv
	if(@ttx=0)
		begin
			declare @macn nchar(10)
			select @macn = MACN from LINK1.QLVT_DATHANG.DBO.ChiNhanh
			--select @a =MAX(MANV) from NhanVien
			--select @b =MAX(MANV) from LINK1.QLVT_DATHANG.DBO.NhanVien
			--if(@a > @b)
			--	begin 
			--		set @mamoi = @a + 1
			--	end
			--else
			--	begin
			--		set @mamoi = @b + 1
			--	end
		
			insert into LINK1.QLVT_DATHANG.DBO.NhanVien (MANV, HO, TEN, DIACHI, NGAYSINH, LUONG, MACN, TrangThaiXoa)
			select MANV=@mamoi,HO,TEN,DIACHI,NGAYSINH,LUONG,MACN=@macn,TrangThaiXoa = 0
			from NhanVien
			where MANV = @manv

			update NhanVien set TrangThaiXoa = 1
			where MANV = @manv
		end
	else
	raiserror(50001, 18, 1, N'Nhân viên đã chuyển chi nhánh')
end
GO
/****** Object:  StoredProcedure [dbo].[SP_TAOTAIKHOAN]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TAOTAIKHOAN]
	@LGNAME VARCHAR(50),
	@PASS VARCHAR(50),
	@USERNAME VARCHAR(50),
	@ROLE VARCHAR(50)
AS
BEGIN
	DECLARE @RET INT
		EXEC @RET = sp_addlogin @LGNAME, @PASS, 'QLVT_DATHANG'
			IF (@RET =1) --LOGINNAME BI TRUNG
				RETURN 1
		EXEC @RET = sp_grantdbaccess @LGNAME, @USERNAME
		IF(@RET =1) --USER NAME BI TRUNG
		BEGIN
			EXEC sp_droplogin @LGNAME
			RETURN 2
		END
		EXEC sp_addrolemember @ROLE, @USERNAME
		IF @ROLE='CONGTY' OR @ROLE='CHINHANH'
			EXEC sp_addsrvrolemember @LGNAME, 'securityAdmin'
			EXEC sp_addsrvrolemember @LGNAME, 'sysadmin' -- thuc hien bat ky hoat dong nao tren server
			EXEC sp_addsrvrolemember @LGNAME, 'processadmin' -- quyenthao tac tren db
			RETURN 0 -- THANH CONG

		IF @ROLE='USER'
			EXEC sp_addsrvrolemember @LGNAME, 'processadmin' -- quyenthao tac tren db
		COMMIT
		RETURN 0 -- THANH CONG
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THONGTINDANGNHAP]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THONGTINDANGNHAP]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50), @UserId int
SELECT @UserId= UId ,@TENUSER=NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT HO+ ' '+ TEN FROM dbo.NhanVien WHERE MANV = @TENUSER ),
   NAME
   FROM sys.sysusers 
   WHERE UID = (SELECT GROUPUID 
                 FROM SYS.SYSMEMBERS 
                   WHERE MEMBERUID= @UserId
               )
GO
/****** Object:  StoredProcedure [dbo].[sp_timctddh]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_timctddh]
@maddh NCHAR(8),
@mavt NCHAR(4)
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.CTDDH WHERE MasoDDH = @maddh and MAVT = @mavt)
		SELECT * FROM dbo.CTDDH WHERE MasoDDH = @maddh and MAVT = @mavt
	ELSE
		IF EXISTS (SELECT * FROM LINK1.QLVT_DATHANG.dbo.CTDDH WHERE MasoDDH = @maddh and MAVT = @mavt)
			SELECT * FROM LINK1.QLVT_DATHANG.dbo.CTDDH WHERE MasoDDH = @maddh and MAVT = @mavt
		ELSE
			RAISERROR(N'Chi tiết đơn đặt hàng bạn tìm không tồn tại',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_timddh]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_timddh]
@maddh NCHAR(8)
AS
BEGIN
	IF EXISTS (SELECT MasoDDH FROM dbo.DatHang WHERE MasoDDH = @maddh)
		SELECT * FROM dbo.DatHang WHERE MasoDDH = @maddh
	ELSE
		IF EXISTS (SELECT MasoDDH FROM LINK1.QLVT_DATHANG.dbo.DatHang WHERE MasoDDH = @maddh)
			SELECT * FROM LINK1.QLVT_DATHANG.dbo.DatHang WHERE MasoDDH = @maddh
		ELSE
			RAISERROR(N'Đơn đặt hàng bạn tìm không tồn tại',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_timkho]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_timkho]
@makho NCHAR(4)
AS
BEGIN
	IF EXISTS (SELECT MAKHO FROM dbo.Kho WHERE MAKHO = @makho)
		SELECT * FROM dbo.Kho WHERE MAKHO = @makho
	ELSE
		IF EXISTS (SELECT MAKHO FROM LINK1.QLVT_DATHANG.dbo.Kho WHERE MAKHO = @makho)
			SELECT * FROM LINK1.QLVT_DATHANG.dbo.Kho WHERE MAKHO = @makho
		ELSE
			RAISERROR(N'Kho bạn tìm không tồn tại',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_timnhanvien]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_timnhanvien]
@manv INT
AS
BEGIN
	IF EXISTS (SELECT MANV FROM dbo.NhanVien WHERE MANV = @manv)
		SELECT MANV, HO, TEN, DIACHI, NGAYSINH, LUONG, MACN, TrangThaiXoa FROM dbo.NhanVien WHERE MANV = @manv
	ELSE
		IF EXISTS (SELECT MANV FROM LINK1.QLVT_DATHANG.dbo.NhanVien WHERE MANV = @manv)
			SELECT MANV, HO, TEN, DIACHI, NGAYSINH, LUONG, MACN, TrangThaiXoa FROM LINK1.QLVT_DATHANG.dbo.NhanVien WHERE MANV = @manv
		ELSE
			RAISERROR(N'Nhân viên bạn tìm không tồn tại',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_timvattu]    Script Date: 11/30/2020 8:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_timvattu]
@mavt NCHAR(4)
AS
BEGIN
	IF EXISTS (SELECT MAVT FROM dbo.Vattu WHERE MAVT = @mavt)
		SELECT MAVT, TENVT, DVT FROM dbo.Vattu WHERE MAVT = @mavt
	ELSE
		--RAISERROR(50001, 18, 1, N'Mã vật tư bạn tìm không tồn tại.')
		RAISERROR(N'Vật tư bạn tìm không tồn tại',16,1)
END
GO
USE [master]
GO
ALTER DATABASE [QLVT_DATHANG] SET  READ_WRITE 
GO
