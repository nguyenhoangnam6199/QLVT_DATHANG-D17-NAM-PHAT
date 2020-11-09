create proc sp_kiemtratrungtenlogin
@tenlogin nvarchar(50)
as
begin
	SELECT name FROM master.sys.sql_logins where name = @tenlogin
end