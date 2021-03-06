USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 6/8/2020 2:27:13 AM ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnlie', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopOnlie.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopOnlie_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopOnlie_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShopOnline]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 6/8/2020 2:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nchar](10) NOT NULL,
	[MaSP] [nvarchar](100) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/8/2020 2:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nchar](10) NOT NULL,
	[NgayLap] [nvarchar](50) NULL,
	[NgayGiao] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
	[DiaChiGiao] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHangOnline]    Script Date: 6/8/2020 2:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangOnline](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHangOnline] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 6/8/2020 2:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [nvarchar](10) NOT NULL,
	[TenLoaiSP] [nvarchar](max) NULL,
	[HinhLoai] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/8/2020 2:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](100) NOT NULL,
	[MaLoaiSP] [nvarchar](10) NULL,
	[TenSP] [nvarchar](50) NULL,
	[DonViTinh] [nvarchar](10) NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[GiaVon] [int] NULL,
	[GiaNhapCuoi] [int] NULL,
	[MucTon] [int] NULL,
	[TrangThai] [int] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/8/2020 2:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDN] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD01      ', N'SP0001', 1, 300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD0113304 ', N'SP0038', 2, 4800000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD0139540 ', N'SP0015', 1, 500000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD0170270 ', N'SP0016', 1, 300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD0170270 ', N'SP0038', 2, 4800000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD0181376 ', N'SP0038', 2, 4800000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD0195221 ', N'SP0035', 5, 15000000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD02      ', N'SP0002', 2, 300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD02      ', N'SP0003', 21, 300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD03      ', N'SP0003', 3, 300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD04      ', N'SP0001', 1, 300000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD01      ', N'2020-02-02', N'2020-02-03', 2, N'34 Đỗ Nhuận, Sơn Kỳ, Tân Phú, TP. Hồ Chí Minh', 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD0113304 ', N'2020-08-06 02:00:57', N'2020-08-06 02:00:57', 4, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD0139540 ', N'2020-08-06 02:12:44', N'2020-08-06 02:12:44', 4, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD0170270 ', N'2020-08-05 23:56:27', N'2020-08-05 23:56:27', 4, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD0181376 ', N'2020-08-06 02:00:59', N'2020-08-06 02:00:59', 4, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD0195221 ', N'2020-08-06 02:13:30', N'2020-08-06 02:13:30', 4, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD02      ', N'2020-05-05', N'2020-05-06', 1, N'Số 4 Đường D11 Tây Thạnh', 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD03      ', N'2020-06-09', N'2020-06-11', 3, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú, TP. Hồ Chí Minh', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [NgayGiao], [MaKH], [DiaChiGiao], [TrangThai]) VALUES (N'HD04      ', N'2020-06-09', N'2020-06-11', 1, N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú, TP. Hồ Chí Minh', 0)
SET IDENTITY_INSERT [dbo].[KhachHangOnline] ON 

INSERT [dbo].[KhachHangOnline] ([MaKH], [Email], [MatKhau], [HoTen], [DiaChi], [SDT]) VALUES (1, N'ngocrong193@gmail.com', N'123', N'Nguyen Chi Sanh', N'4 duong D11 Tay Thanh', N'0343399929')
INSERT [dbo].[KhachHangOnline] ([MaKH], [Email], [MatKhau], [HoTen], [DiaChi], [SDT]) VALUES (2, N'huynhngockhanh0568@gmail.com', N'123', N'Huynh Ngoc Khanh', N'34 Do Nhuan, Son ky, Tan Phu', N'0935275255')
INSERT [dbo].[KhachHangOnline] ([MaKH], [Email], [MatKhau], [HoTen], [DiaChi], [SDT]) VALUES (3, N'kwx7968', N'123', N'Khanh Huynh Ngoc', N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', N'0935275255')
INSERT [dbo].[KhachHangOnline] ([MaKH], [Email], [MatKhau], [HoTen], [DiaChi], [SDT]) VALUES (4, N'1.1.1', N'123', N'nguyen chi sanh', N'30/5 Đỗ Nhuận, Sơn Kỳ, Tân Phú', N'0935275255')
SET IDENTITY_INSERT [dbo].[KhachHangOnline] OFF
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [HinhLoai]) VALUES (N'TL0000', N'Giày ', N'https://vn-test-11.slatic.net/p/a300cc57e0991f26d4b8642dd39a7421.jpg')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [HinhLoai]) VALUES (N'TL0001', N'Mũ', N'https://vn-test-11.slatic.net/p/1b39022717ba5d7509f1a73ef98a2fa1.jpg')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [HinhLoai]) VALUES (N'TL0002', N'Mũ xịn', N'https://vn-test-11.slatic.net/p/b74de5cdc6ca8d1dd0fa4ee891aa4d18.jpg')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP], [HinhLoai]) VALUES (N'TL0003', N'Giày xịn', N'https://vn-test-11.slatic.net/p/70d4cda1eb153847c082e78d1fce696f.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0000', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 97, 450000, 350000, 350000, 10, 1, N'https://vn-test-11.slatic.net/p/ff131e0abb12df767ea70a551beeb728.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0001', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 55, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/66f5394359a4d70018577f80b58259d6.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0002', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 71, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/43dbdafeebd4e91cc49f47098e8b35d2.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0003', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 71, 450000, 350000, 350000, 10, 1, N'https://vn-test-11.slatic.net/p/60e40b1c7f37ab79b7f7564988f2ac33.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0004', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 41, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/255c6925682e9ba0cbe340d08a5dd45b.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0005', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 91, 400000, 300000, 300000, 10, 1, N'https://vn-test-11.slatic.net/p/c67df4e4df1fa5fbdb95bfe6a2a8e3ca.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0006', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 98, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/aa5733cbb4cc235a3fdf5c7bce697973.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0007', N'TL0000', N'Áo Sơ mi JoHn-Beck', N'Chiếc', 98, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/811b212b34cf8878f9037d2fabb76006.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0008', N'TL0000', N'Áo sơ mi nam Hàn Quốc kiểu dáng trẻ trung', N'Chiếc', 100, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/5aea22d40e081e69d7b737dcae67f0d6.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0009', N'TL0000', N'Áó Sơmi Nam Thêu Lôgo', N'Chiếc', 98, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/429486e3e8519661026ef485365f6d68.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0010', N'TL0000', N'Áo sơ mi nam ngắn tay', N'Chiếc', 100, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/aa913cdef614061a120fbfb09bd5174c.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0011', N'TL0000', N'Áo Sơ mi Lev-Roman', N'Chiếc', 98, 400000, 300000, 300000, 10, 1, N'https://vn-test-11.slatic.net/p/95884551622635f6fc8e5d8f4fc97049.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0012', N'TL0000', N'Giày converse', N'Chiếc', 90, 600000, 500000, 500000, 10, 1, N'https://vn-live-01.slatic.net/original/21f00c4ee3d0a41e4c6d08ed9861fbb9.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0013', N'TL0000', N'Giày thể thao nam', N'Chiếc', 99, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/34a3c71af671099a18fcd601b2d39b77.png', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0014', N'TL0000', N'Giày hoodier', N'Chiếc', 85, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/6281b1532987b056efd8d255f4bb4002.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0015', N'TL0000', N'Giày balenciga', N'Chiếc', 83, 500000, 400000, 400000, 10, 1, N'https://vn-test-11.slatic.net/p/f4c77f1b1347be6a08b25c8cfee60aa6.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0016', N'TL0000', N'Giày converse real', N'Chiếc', 80, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/c137a9fa1611174bc7c73c160e36815f.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0017', N'TL0000', N'Giày tây', N'Chiếc', 88, 400000, 300000, 300000, 10, 1, N'https://vn-test-11.slatic.net/p/15d1845d939f059d10efc0d5020c1693.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0018', N'TL0000', N'Giày converse cổ thấp', N'Chiếc', 77, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/867883b3606479181a1f4bea77f42036.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0019', N'TL0000', N'Giày trắng xịn', N'Chiếc', 61, 300000, 200000, 200000, 10, 1, N'https://vn-test-11.slatic.net/p/f8c7894f97926d3c4981370fe2489bef.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0020', N'TL0000', N'Giày trắng xin xò', N'Chiếc', 84, 750000, 650000, 650000, 10, 1, N'https://vn-test-11.slatic.net/p/70d4cda1eb153847c082e78d1fce696f.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0021', N'TL0001', N'Giày converse cổ thấp', N'Chiếc', 135, 1190000, 990000, 990000, 10, 1, N'https://vn-test-11.slatic.net/p/62b8f9a1b6e1e4f0557bb8c94d1f7c26.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0022', N'TL0001', N'Giày converse cổ thấp', N'Chiếc', 108, 1400000, 1200000, 1200000, 10, 1, N'https://vn-test-11.slatic.net/p/a300cc57e0991f26d4b8642dd39a7421.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0023', N'TL0003', N'Giày sneakers', N'Chiếc', 137, 1900000, 1700000, 1700000, 10, 1, N'https://vn-test-11.slatic.net/p/628671429ab401f64d88d78380737537.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0024', N'TL0003', N'Giày YZ', N'Chiếc', 124, 900000, 700000, 700000, 10, 1, N'https://vn-test-11.slatic.net/p/d048ac8e3b4b7c0161e97615f8a52e6b.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0025', N'TL0003', N'Bộ giày khuyến mãi', N'Chiếc', 112, 1400000, 1200000, 1200000, 10, 1, N'https://vn-live-01.slatic.net/original/54bdb1e34f69045618341b78968c5bcd.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0026', N'TL0003', N'Mũ xịn', N'Chiếc', 119, 1450000, 1350000, 1350000, 10, 1, N'https://vn-test-11.slatic.net/p/aec0b3c5d1ad098176d604db69db927f.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0027', N'TL0001', N'Mũ cực xịn', N'Chiếc', 150, 1700000, 1200000, 1200000, 10, 1, N'https://vn-test-11.slatic.net/p/c57cf0a959f95c26d87d15f6a8a09b3b.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0028', N'TL0001', N'Mũ xanh', N'Chiếc', 153, 1300000, 800000, 800000, 10, 1, N'https://vn-test-11.slatic.net/p/838d6a815affaab73db071648bdf4880.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0029', N'TL0003', N'Mũ lưỡi trai', N'Chiếc', 143, 1000000, 900000, 900000, 10, 1, N'https://vn-test-11.slatic.net/p/1b39022717ba5d7509f1a73ef98a2fa1.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0030', N'TL0001', N'Mũ mới gucci', N'Chiếc', 30, 2000000, 1500000, 1500000, 10, 1, N'https://vn-test-11.slatic.net/p/5e5266d154c170157b30c15800c5fce7.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0031', N'TL0001', N'Mũ mới balenciga', N'Chiếc', 19, 1800000, 1300000, 1300000, 10, 1, N'https://vn-test-11.slatic.net/p/84c5a738c973d8ea38bc92007c18b396.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0032', N'TL0001', N'Mũ jack đóm', N'Chiếc', 31, 2000000, 1500000, 1500000, 10, 1, N'https://vn-test-11.slatic.net/p/56453f9fe47b1cb078117522e5cd7304.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0033', N'TL0001', N'Mũ Kolintin', N'Chiếc', 20, 2800000, 2300000, 2300000, 10, 1, N'https://vn-test-11.slatic.net/p/3e383d6b51cc2845dc4f88f651c46bf0.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0034', N'TL0001', N'Mũ cam mới', N'Chiếc', 35, 2800000, 2300000, 2300000, 10, 1, N'https://vn-test-11.slatic.net/p/b74de5cdc6ca8d1dd0fa4ee891aa4d18.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0035', N'TL0001', N'Mũ cho bé', N'Chiếc', 40, 3000000, 2500000, 2500000, 10, 1, N'https://vn-test-11.slatic.net/p/c6283b3fc79742e3ffc458ea5424b203.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0036', N'TL0001', N'Mũ chống dịch covid', N'Chiếc', 28, 3800000, 3300000, 3300000, 10, 1, N'https://vn-test-11.slatic.net/p/309570cb430796bcfe60c3e444d7ecc9.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0037', N'TL0001', N'Mũ cho em bé', N'Chiếc', 33, 1800000, 1300000, 1300000, 10, 1, N'https://vn-test-11.slatic.net/p/mdc/ae6612aa23b848f375041ea6ad8c958f.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [DonViTinh], [SoLuong], [GiaBan], [GiaVon], [GiaNhapCuoi], [MucTon], [TrangThai], [HinhAnh], [MoTa]) VALUES (N'SP0038', N'TL0001', N'Mũ idol hàn', N'Chiếc', 38, 2400000, 2300000, 2300000, 10, 1, N'https://vn-test-11.slatic.net/p/8f936742ec3cc5f4923f8781f0acfc07.jpg', N'Thiết kế tối giản, vượt thời gian của đồng hồ Kashmir kết hợp với dây da trở thành biểu tượng cho vẻ ngoài lịch lãm, sang trọng.')
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'admin', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'khanh', N'123456', 0)
INSERT [dbo].[TaiKhoan] ([TenDN], [MatKhau], [Quyen]) VALUES (N'sanh', N'123456', 0)
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHangOnline] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHangOnline] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHangOnline]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO
