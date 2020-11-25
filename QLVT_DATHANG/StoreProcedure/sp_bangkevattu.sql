﻿ALTER PROCEDURE [dbo].[sp_rep_bangkectvt]
@MODE NCHAR,
@LOAI NCHAR,
@BEGIN NCHAR(10),
@END NCHAR(10)
AS
BEGIN
  IF @MODE = 'C'
    IF @LOAI = 'N'
    SELECT SUBSTRING(CONVERT(VARCHAR, PN.NGAY, 103),4,7) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
    FROM 
    (
      SELECT MAPN, NGAY
      FROM dbo.PhieuNhap
      WHERE NGAY BETWEEN @BEGIN and  @END
    ) PN
    INNER JOIN dbo.CTPN CT ON CT.MAPN = PN.MAPN
    INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
    GROUP BY SUBSTRING(CONVERT(VARCHAR, PN.NGAY, 103),4,7), VT.TENVT
	ORDER BY SUBSTRING(CONVERT(VARCHAR, PN.NGAY, 103),4,7)
    ELSE
    IF @LOAI = 'X'
      SELECT SUBSTRING(CONVERT(VARCHAR, PX.NGAY, 103),4,7) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
      FROM 
      (
      SELECT MAPX, NGAY
      FROM dbo.PhieuXuat
      WHERE NGAY BETWEEN @BEGIN and  @END
      ) PX
      INNER JOIN dbo.CTPX CT ON CT.MAPX = PX.MAPX
      INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
      GROUP BY SUBSTRING(CONVERT(VARCHAR, PX.NGAY, 103),4,7), VT.TENVT
	  ORDER BY SUBSTRING(CONVERT(VARCHAR, PX.NGAY, 103),4,7)
  IF @MODE = 'F'	--quyền công ty
    IF @LOAI = 'N'
    SELECT SUBSTRING(CONVERT(VARCHAR, PN.NGAY, 103),4,7) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
    FROM 
    (
      SELECT MAPN, NGAY
      FROM LINK3.QLVT_DATHANG.dbo.PhieuNhap
      WHERE NGAY BETWEEN @BEGIN and  @END
    ) PN
    INNER JOIN LINK3.QLVT_DATHANG.dbo.CTPN CT ON CT.MAPN = PN.MAPN
    INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
    GROUP BY SUBSTRING(CONVERT(VARCHAR, PN.NGAY, 103),4,7), VT.TENVT
	ORDER BY SUBSTRING(CONVERT(VARCHAR, PN.NGAY, 103),4,7)
    ELSE
    IF @LOAI = 'X'
      SELECT SUBSTRING(CONVERT(VARCHAR, PX.NGAY, 103),4,7) AS [THOIGIAN], VT.TENVT, SUM(CT.SOLUONG) AS 'SOLUONG', SUM(CT.SOLUONG * CT.DONGIA) AS 'TRIGIA'
      FROM 
      (
      SELECT MAPX, NGAY
      FROM LINK3.QLVT_DATHANG.dbo.PhieuXuat
      WHERE NGAY BETWEEN @BEGIN and  @END
      ) PX
      INNER JOIN LINK3.QLVT_DATHANG.dbo.CTPX CT ON CT.MAPX = PX.MAPX
      INNER JOIN dbo.Vattu VT ON VT.MAVT = CT.MAVT
      GROUP BY  SUBSTRING(CONVERT(VARCHAR, PX.NGAY, 103),4,7), VT.TENVT
	  ORDER BY SUBSTRING(CONVERT(VARCHAR, PX.NGAY, 103),4,7)
END