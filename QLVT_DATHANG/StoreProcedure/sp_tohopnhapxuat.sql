USE [QLVT_DATHANG]
GO
/****** Object:  StoredProcedure [dbo].[sp_tonghop]    Script Date: 11/20/2020 10:42:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[sp_tonghop]
@begin char(10),
@end char(10),
@mode char
as
begin
	IF(@mode = 'C')	--quyền chi nhánh
	begin
		select NGAY=tohopnhap.NGAY, TONGTIENNHAP=ISNULL(tohopnhap.TONGTIEN,0),
				TONGTIENXUAT=ISNULL(tohopxuat.TONGTIEN,0), TYLENHAP=(ISNULL(tohopnhap.TONGTIEN,0)/(ISNULL(tohopnhap.TONGTIEN,0)+ISNULL(tohopxuat.TONGTIEN,0))),
				TYLEXUAT=(ISNULL(tohopxuat.TONGTIEN,0)/(ISNULL(tohopnhap.TONGTIEN,0)+ISNULL(tohopxuat.TONGTIEN,0)))
		from
		(
			(
				SELECT pxfilter.NGAY, ISNULL(SUM(ctpx.SOLUONG * ctpx.DONGIA),0) AS 'TONGTIEN'
				FROM (SELECT MAPX, NGAY FROM dbo.PhieuXuat WHERE NGAY BETWEEN CONVERT(DATETIME, @begin, 102) AND CONVERT(DATETIME, @end, 102)) pxfilter
				INNER JOIN dbo.CTPX ctpx ON ctpx.MAPX = pxfilter.MAPX
				GROUP BY pxfilter.NGAY
			) tohopxuat
			 full outer join
			(
				SELECT pnfilter.NGAY, ISNULL(SUM(ctpn.SOLUONG * ctpn.DONGIA),0) AS 'TONGTIEN'
				FROM (SELECT MAPN, NGAY FROM dbo.PhieuNhap WHERE NGAY BETWEEN CONVERT(DATETIME, @begin, 102) AND CONVERT(DATETIME, @end, 102)) pnfilter
				INNER JOIN dbo.CTPN ctpn ON ctpn.MAPN = pnfilter.MAPN
				GROUP BY pnfilter.NGAY
			) tohopnhap
			on tohopxuat.NGAY = tohopnhap.NGAY
		)
	end
	else
	begin
		select NGAY=tohopnhap.NGAY, TONGTIENNHAP=ISNULL(tohopnhap.TONGTIEN,0),
				TONGTIENXUAT=ISNULL(tohopxuat.TONGTIEN,0), TYLENHAP=(ISNULL(tohopnhap.TONGTIEN,0)/(ISNULL(tohopnhap.TONGTIEN,0)+ISNULL(tohopxuat.TONGTIEN,0))),
				TYLEXUAT=(ISNULL(tohopxuat.TONGTIEN,0)/(ISNULL(tohopnhap.TONGTIEN,0)+ISNULL(tohopxuat.TONGTIEN,0)))
		from
		(
			(SELECT pxfilter.NGAY, ISNULL(SUM(ctpx.SOLUONG * ctpx.DONGIA),0) AS 'TONGTIEN'
			FROM (SELECT MAPX, NGAY FROM LINK3.QLVT_DATHANG.dbo.PhieuXuat WHERE NGAY BETWEEN CONVERT(DATETIME, @begin, 102) AND CONVERT(DATETIME, @end, 102)) pxfilter
			INNER JOIN LINK3.QLVT_DATHANG.dbo.CTPX ctpx ON ctpx.MAPX = pxfilter.MAPX
			GROUP BY pxfilter.NGAY) tohopxuat
			 full outer join
			(SELECT pnfilter.NGAY, ISNULL(SUM(ctpn.SOLUONG * ctpn.DONGIA),0) AS 'TONGTIEN'
			FROM (SELECT MAPN, NGAY FROM LINK3.QLVT_DATHANG.dbo.PhieuNhap WHERE NGAY BETWEEN CONVERT(DATETIME, @begin, 102) AND CONVERT(DATETIME, @end, 102)) pnfilter
			INNER JOIN LINK3.QLVT_DATHANG.dbo.CTPN ctpn ON ctpn.MAPN = pnfilter.MAPN
			GROUP BY pnfilter.NGAY) tohopnhap
			on tohopxuat.NGAY = tohopnhap.NGAY
		)
	end
end
