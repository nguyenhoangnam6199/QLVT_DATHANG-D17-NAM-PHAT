USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_rep_hdnv]    Script Date: 11/20/2020 3:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_rep_hdnv]
@MANV INT,
@LOAI NCHAR,
@BEGIN NCHAR(10),
@END NCHAR(10)
AS
BEGIN
  IF @LOAI = 'N'
    SELECT  PN.NGAY AS 'Ngày',
		PN.MAPN AS 'Mã Phiếu', PN.HOTENKH AS 'Họ và Tên', VT.TENVT AS 'Tên Vật Tư', 
		KHO.TENKHO AS 'Tên Kho',CT.SOLUONG AS 'Số Lượng',
		DONGIA AS 'Đơn Giá', CT.SOLUONG * CT.DONGIA AS 'Trị Giá',
		PN.MANV as 'Mã nhân viên', HO+' '+TEN as 'Họ Tên Nhân Viên'
    FROM 
    (
		SELECT MAPN, NGAY, MAKHO, HOTENKH = '', MANV 
		FROM PhieuNhap
		WHERE MANV = @MANV AND NGAY BETWEEN @BEGIN and  @END
    ) PN
    INNER JOIN dbo.CTPN CT ON CT.MAPN = PN.MAPN
    INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
	INNER JOIN DBO.KHO KHO ON KHO.MAKHO = PN.MAKHO
	INNER JOIN DBO.NhanVien NV ON PN.MANV = NV.MANV
  ELSE
    IF @LOAI = 'X'
      SELECT PX.NGAY AS 'Ngày',
		PX.MAPX AS 'Mã Phiếu', PX.HOTENKH AS 'Họ và Tên', VT.TENVT AS 'Tên Vật Tư', 
		KHO.TENKHO AS 'Tên Kho',CT.SOLUONG AS 'Số Lượng',
		DONGIA AS 'Đơn Giá', CT.SOLUONG * CT.DONGIA AS 'Trị Giá',
		PX.MANV as 'Mã nhân viên', HO+' '+TEN as 'Họ Tên Nhân Viên'
    FROM 
    (
		SELECT MAPX, NGAY, MAKHO, HOTENKH, MANV
		FROM PhieuXuat
		WHERE MANV = @MANV AND NGAY BETWEEN @BEGIN and  @END
    ) PX
    INNER JOIN dbo.CTPX CT ON CT.MAPX = PX.MAPX
    INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
	INNER JOIN DBO.KHO KHO ON KHO.MAKHO = PX.MAKHO
	INNER JOIN DBO.NhanVien NV ON PX.MANV = NV.MANV
END