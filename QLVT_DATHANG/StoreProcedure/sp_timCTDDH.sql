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