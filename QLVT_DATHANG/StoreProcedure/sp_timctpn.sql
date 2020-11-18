create proc sp_timctpn
@mapn nchar(8),
@mavt nchar(4)
as
begin
	IF EXISTS (SELECT * FROM dbo.CTPN WHERE MAPN = @mapn and MAVT = @mavt)
		SELECT * FROM dbo.CTPN WHERE MAPN = @mapn and MAVT = @mavt
	ELSE
		IF EXISTS (SELECT * FROM LINK1.QLVT_DATHANG.dbo.CTPN WHERE MAPN = @mapn and MAVT = @mavt)
			SELECT * FROM LINK1.QLVT_DATHANG.dbo.CTPN WHERE MAPN = @mapn and MAVT = @mavt
		ELSE
			RAISERROR(N'Chi tiết phiếu nhập bạn tìm không tồn tại',16,1)
end