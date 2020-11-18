create proc sp_timphieunhap
@mapn nchar(8)
as
begin
	IF EXISTS (SELECT MAPN FROM dbo.PhieuNhap WHERE MAPN = @mapn)
		SELECT * FROM dbo.PhieuNhap WHERE MAPN = @mapn
	ELSE
		IF EXISTS (SELECT MAPN FROM LINK1.QLVT_DATHANG.dbo.PhieuNhap WHERE MAPN = @mapn)
			SELECT * FROM LINK1.QLVT_DATHANG.dbo.PhieuNhap WHERE MAPN = @mapn
		ELSE
			RAISERROR(N'Phiếu nhập bạn tìm không tồn tại',16,1)
end