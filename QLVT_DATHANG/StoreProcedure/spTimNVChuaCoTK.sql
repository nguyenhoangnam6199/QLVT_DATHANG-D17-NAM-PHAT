select * from sys.sysusers

select MANV,HO,TEN from NhanVien where convert(varchar,MANV) not in (select name from sys.sysusers) and TrangThaiXoa = 0

select * from sysmergepublications

select * from sysmergesubscriptions

select MANV,HOTEN=HO+' '+TEN from NhanVien where convert(varchar,MANV) not in (select name from sys.sysusers) and TrangThaiXoa = 0