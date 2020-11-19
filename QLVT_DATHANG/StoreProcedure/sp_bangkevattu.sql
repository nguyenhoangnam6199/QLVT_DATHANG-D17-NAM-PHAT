﻿CREATE PROCEDURE sp_rep_bangkectvt
@MODE CHAR,
@LOAI CHAR,
@BEGIN CHAR(10),
@END CHAR(10)
AS
BEGIN
  IF @MODE = 'C'
    IF @LOAI = 'N'
    SELECT SUBSTRING(CONVERT(VARCHAR(8), PN.NGAY, 3), 4, 5) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
    FROM 
    (
      SELECT MAPN, NGAY
      FROM dbo.PhieuNhap
      WHERE NGAY BETWEEN CONVERT(DATETIME, @BEGIN, 102) and CONVERT(DATETIME, @END, 102)
    ) PN
    INNER JOIN dbo.CTPN CT ON CT.MAPN = PN.MAPN
    INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
    GROUP BY SUBSTRING(CONVERT(VARCHAR(8), PN.NGAY, 3), 4, 5), VT.TENVT
    ELSE
    IF @LOAI = 'X'
      SELECT SUBSTRING(CONVERT(VARCHAR(8), PX.NGAY, 3), 4, 5) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
      FROM 
      (
      SELECT MAPX, NGAY
      FROM dbo.PhieuXuat
      WHERE NGAY BETWEEN CONVERT(DATETIME, @BEGIN, 102) and CONVERT(DATETIME, @END, 102)
      ) PX
      INNER JOIN dbo.CTPX CT ON CT.MAPX = PX.MAPX
      INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
      GROUP BY SUBSTRING(CONVERT(VARCHAR(8), PX.NGAY, 3), 4, 5), VT.TENVT
  IF @MODE = 'F'	--quyền công ty
    IF @LOAI = 'N'
    SELECT SUBSTRING(CONVERT(VARCHAR(8), PN.NGAY, 3), 4, 5) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
    FROM 
    (
      SELECT MAPN, NGAY
      FROM LINK3.QLVT_DATHANG.dbo.PhieuNhap
      WHERE NGAY BETWEEN CONVERT(DATETIME, @BEGIN, 102) and CONVERT(DATETIME, @END, 102)
    ) PN
	--LINK 3 là kết nối từ site phân mảnh về site chủ để lấy dữ liệu
    INNER JOIN LINK3.QLVT_DATHANG.dbo.CTPN CT ON CT.MAPN = PN.MAPN
    INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
    GROUP BY SUBSTRING(CONVERT(VARCHAR(8), PN.NGAY, 3), 4, 5), VT.TENVT
    ELSE
    IF @LOAI = 'X'
      SELECT SUBSTRING(CONVERT(VARCHAR(8), PX.NGAY, 3), 4, 5) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
      FROM 
      (
      SELECT MAPX, NGAY
      FROM LINK3.QLVT_DATHANG.dbo.PhieuXuat
      WHERE NGAY BETWEEN CONVERT(DATETIME, @BEGIN, 102) and CONVERT(DATETIME, @END, 102)
      ) PX
      INNER JOIN LINK3.QLVT_DATHANG.dbo.CTPX CT ON CT.MAPX = PX.MAPX
      INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
      GROUP BY SUBSTRING(CONVERT(VARCHAR(8), PX.NGAY, 3), 4, 5), VT.TENVT
END