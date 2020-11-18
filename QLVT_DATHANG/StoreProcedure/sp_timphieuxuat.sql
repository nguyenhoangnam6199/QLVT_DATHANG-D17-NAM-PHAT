create proc sp_timphieuxuat
@mapx nchar(8)
as
begin
	IF EXISTS (SELECT MAPX FROM dbo.PhieuXuat WHERE MAPX = @mapx)
		SELECT * FROM dbo.PhieuXuat WHERE MAPX = @mapx
	ELSE
		IF EXISTS (SELECT MAPX FROM LINK1.QLVT_DATHANG.dbo.PhieuXuat WHERE MAPX = @mapx)
			SELECT * FROM LINK1.QLVT_DATHANG.dbo.PhieuXuat WHERE MAPX = @mapx
		ELSE
			RAISERROR(N'Phiếu xuất bạn tìm không tồn tại',16,1)
end