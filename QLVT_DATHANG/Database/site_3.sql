USE [master]
GO
/****** Object:  Database [QLVT_DATHANG]    Script Date: 11/30/2020 8:57:37 PM ******/
CREATE DATABASE [QLVT_DATHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLVT_DATHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SERVER3\MSSQL\DATA\QLVT_DATHANG.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLVT_DATHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SERVER3\MSSQL\DATA\QLVT_DATHANG_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [HTKN]    Script Date: 11/30/2020 8:57:37 PM ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 11/30/2020 8:57:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MAKHO] [nchar](4) NOT NULL,
	[TENKHO] [nvarchar](30) NOT NULL,
	[MACN] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_56C5D0BE3E544C2CB18331016F906490]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/30/2020 8:57:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [int] NOT NULL,
	[HO] [nvarchar](40) NULL,
	[TEN] [nvarchar](10) NULL,
	[MACN] [nchar](10) NULL,
	[TrangThaiXoa] [int] NULL CONSTRAINT [DF_NhanVien_TrangThaiXoa]  DEFAULT ((0)),
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_6AC5D6B73ECC402BAD2B5B4DEE2F4B35]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K1N1', N'KHO A', N'CN1       ', N'59dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K1N2', N'LONG PHU', N'CN2       ', N'5edd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K2N1', N'KHO B', N'CN1       ', N'5add0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K2N2', N'KHO VT', N'CN2       ', N'5cdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K3N1', N'CONG NGHIEP', N'CN1       ', N'58dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K3N2', N'KHO XD', N'CN2       ', N'5ddd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [MACN], [rowguid]) VALUES (N'K4N1', N'KHO HH', N'CN1       ', N'5bdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (1, N'Lương', N'Trang', N'CN1       ', 0, N'5fdd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (2, N'Nguyễn', N'Hà', N'CN2       ', 0, N'60dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (3, N'Trần', N'Thanh', N'CN1       ', 0, N'61dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (4, N'Thái', N'Hà', N'CN1       ', 1, N'62dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (5, N'Hồ', N'Thái', N'CN2       ', 0, N'63dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (6, N'Hà', N'An', N'CN1       ', 0, N'64dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (7, N'Lê', N'Trà', N'CN2       ', 0, N'65dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (8, N'Nguyễn', N'Hợp', N'CN1       ', 1, N'66dd0f36-490d-eb11-b98d-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (9, N'Nguyễn', N'Nam', N'CN1       ', 0, N'b77bc006-3920-eb11-b994-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (10, N'Dương', N'Phát', N'CN1       ', 1, N'c2fe67ca-8422-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (12, N'Kiều', N'Phan', N'CN2       ', 0, N'14306e2b-4d23-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (13, N'Mỹ', N'Ngọc', N'CN2       ', 0, N'0681a43c-4d23-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (14, N'Kiều', N'Nguyên', N'CN2       ', 0, N'd959ad53-4d23-eb11-b995-54e1ad7deed1')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (15, N'Dương', N'Phát', N'CN2       ', 0, N'c8eb7d96-392d-eb11-b996-865584f597a0')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (16, N'r', N'r', N'CN1       ', 1, N'094fa5e2-de32-eb11-b996-865584f597a0')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [MACN], [TrangThaiXoa], [rowguid]) VALUES (17, N'r', N'r', N'CN2       ', 0, N'dc31528b-ed32-eb11-b996-865584f597a0')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_TENKHO]    Script Date: 11/30/2020 8:57:37 PM ******/
ALTER TABLE [dbo].[Kho] ADD  CONSTRAINT [UK_TENKHO] UNIQUE NONCLUSTERED 
(
	[TENKHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_373576369]    Script Date: 11/30/2020 8:57:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_373576369] ON [dbo].[Kho]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_341576255]    Script Date: 11/30/2020 8:57:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_341576255] ON [dbo].[NhanVien]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [QLVT_DATHANG] SET  READ_WRITE 
GO
