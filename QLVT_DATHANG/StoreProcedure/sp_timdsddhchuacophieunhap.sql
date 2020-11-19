ALTER PROCEDURE sp_dsddhchuacophieunhap
 AS
BEGIN
  SELECT DH.MasoDDH AS 'Mã số DDH', DH.NGAY AS 'Ngày Đặt', DH.NhaCC AS 'Nhà Cung Cấp',
      NV.HO + ' ' + NV.TEN AS 'Họ và Tên', VT.TENVT AS 'Tên vật tư', CT.SOLUONG as 'Số lượng', CT.DONGIA as 'Đơn giá'
  FROM
  (
    SELECT * FROM DatHang
  ) DH
  LEFT JOIN DBO.PhieuNhap PN ON PN.MasoDDH = DH.MasoDDH
  INNER JOIN DBO.NhanVien NV ON NV.MANV = DH.MANV
  INNER JOIN DBO.CTDDH CT ON DH.MasoDDH = CT.MasoDDH
  INNER JOIN DBO.Vattu VT ON CT.MAVT = VT.MAVT
  WHERE PN.MAPN IS NULL
END