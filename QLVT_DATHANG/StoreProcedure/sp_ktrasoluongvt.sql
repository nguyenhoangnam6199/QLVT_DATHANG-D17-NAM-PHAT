create proc sp_ktrasoluongvattu
@maphieu nchar(8),
@mavt nchar(4),
@soluong int
as
begin
	if(@soluong <= (SELECT SOLUONG FROM CTDDH WHERE MasoDDH=@maphieu and MAVT=@mavt ))
		SELECT SOLUONG FROM CTDDH WHERE MasoDDH=@maphieu and MAVT=@mavt 
	else
		RAISERROR(N'Số lượng vật tư không hợp lệ !',16,1)
end
