CREATE DATABASE QLy_BANHANG
USE QLy_BANHANG
GO


CREATE TABLE KHACHHANG
(
   	MAKH CHAR(4) PRIMARY KEY,
   	HOTEN VARCHAR(40),
   	DCHI  VARCHAR(50),
   	SODT VARCHAR (20),
   	NGSINH SMALLDATETIME,
   	NGDK SMALLDATETIME,
   	DOANHSO MONEY
);
 
CREATE TABLE NHANVIEN
(
   	MANV CHAR(4) PRIMARY KEY,
   	HOTEN VARCHAR(40),
   	SODT VARCHAR(20),
   	NGVL SMALLDATETIME
);
 
CREATE TABLE SANPHAM
(
   	MASP CHAR(4) PRIMARY KEY,
   	TENSP VARCHAR(40),
   	DVT VARCHAR (20),
   	NUOCSX VARCHAR(40),
   	GIA MONEY
);
 
CREATE TABLE HOADON
(
   	SOHD INT PRIMARY KEY,
   	NGHD SMALLDATETIME,
   	MAKH CHAR(4) REFERENCES KHACHHANG(MAKH),
   	MANV CHAR(4) REFERENCES NHANVIEN(MANV),
   	TRIGIA MONEY
);
 
CREATE TABLE CTHD
(
   	SOHD INT,
   	MASP CHAR(4),
   	SL INT,
   	PRIMARY KEY (SOHD, MASP)
);
GO
 
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL)VALUES
('NV01', 'NGUYEN NHU NHUT', '0927345678', 13/4/2006),
('NV02', 'LE THI PHI YEN', '0927345678', 13/4/2006),
('NV03', 'NGUYEN VAN B', '0927345678', 13/4/2006),
('NV04', 'NGO THANH TUAN', '0927345678', 13/4/2006),
('NV05', 'NGUYEN THI TRUC THANH', '0927345678', 13/4/2006);
 
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES
('KH01', 'NGUYEN VAN A', '731 TRAN HUNG DAO, Q5, TPHCM','08823451', 22/01/1960, '13060000', 22/07/2006),
('KH02', 'TRAN NGOC HAN', '23/5 Nguyen Trai, Q5, TPHCM','08823451', 3/4/1974, '280000', 30/07/2006),
('KH03', 'TRAN NGOC LINH', '45 Nguyen Canh Chan, Q1, TPHCM','08823451', 12/6/1980, '3860000', 5/8/2006),
('KH04', 'TRAN MINH LONG', '50/34 Le Dai Hanh, Q10, TPHCM','08823451', 9/3/1965, '250000', 2/10/2006),
('KH05', 'LE NHAT MINH', '34 Truong Dinh, Q3, TPHCM','08823451', 10/3/1950, '21000', 28/10/2006),
('KH06', 'LE HOAI THUONG', '227 Nguyen Van Cu, Q5, TPHCM','08823451', 31/12/1981, '915000', 24/11/2006),
('KH07', 'NGUYEN VAN TAM', '32/3 Tran Binh Trong, Q5, TPHCM','08823451', 6/4/1971, '12500', 1/12/2006),
('KH08', 'PHAM THI THANH', '45/2 An Duong vuong, Q5, TPHCM','08823451', 10/1/1971, '365000', 13/12/2006),
('KH09', 'LE HA VINH', '873 Le Hong Phong, Q5, TPHCM','08823451', 3/9/1979, '70000', 14/1/2006),
('KH10', 'HA DUY LAP', '34/34B Nguyen Trai, Q1, TPHCM','08823451', 2/5/1983, '67500', 16/1/2006);
 
 
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES
('BC01','BUT CHI', 'CAY', 'SINGAPORE', '3000'),
('BC02','BUT CHI', 'CAY', 'SINGAPORE', '5000'),
('BC03','BUT CHI', 'CAY', 'VIET NAM', '3500'),
('BC04','BUT CHI', 'HOP', 'VIET NAM', '30000'),
('BB01','BUI BI', 'CAY', 'VIET NAM', '5000'),
('BB02','BUI BI', 'CAY', 'TRUNG QUOC', '7000'),
('BB03','BUI BI', 'HOP', 'THAI LAN', '100000'),
('TV01','TAP 100 GIAY MONG', 'QUYEN', 'TRUNG QUOC', '2500'),
('TV02','TAP 200 GIAY MONG', 'QUYEN', 'TRUNG QUOC', '4500'),
('TV03','TAP 100 GIAY TOT', 'QUYEN', 'VIET NAM', '3000'),
('TV04','TAP 200 GIAY TOT', 'QUYEN', 'VIET NAM', '5500'),
('TV05','TAP 100 TRANG', 'CHUC', 'VIET NAM', '23000'),
('TV06','TAP 200 TRANG', 'CHUC', 'VIET NAM', '53000'),
('TV07','TAP 100 TRANG', 'CHUC', 'TRUNG QUOC', '34000'),
('ST01','SO TAY 500 TRANG', 'QUYEN', 'TRUNG QUOC', '40000'),
('ST02','SO TAY LOAI 1', 'QUYEN', 'VIET NAM', '55000'),
('ST03','SO TAY LOAI 2', 'QUYEN', 'VIET NAM', '51000'),
('ST04','SO TAY', 'QUYEN', 'THAI LAN', '55000'),
('ST05','SO TAY MONG', 'QUYEN', 'THAI LAN', '20000'),
('ST06','PHAN VIET BANG', 'HOP', 'VIET NAM', '5000'),
('ST07','PHAN KHONG BUI', 'HOP', 'VIET NAM', '7000'),
('ST08','BONG BANG', 'CAI', 'VIET NAM', '1000'),
('ST09','BUT LONG', 'CAY', 'VIET NAM', '5000'),
('ST10','BUT LONG', 'CAY', 'TRUNG QUOC', '7000');
 
 
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
(' 1001', 23/07/2006, 'KH01', 'NV01', '320000'),
(' 1002', 12/08/2006, 'KH01', 'NV01', '840000'),
(' 1003', 23/08/2006, 'KH01', 'NV01', '100000'),
(' 1004', 01/09/2006, 'KH01', 'NV01', '180000'),
(' 1005', 20/10/2006, 'KH01', 'NV01', '3800000'),
(' 1006', 16/10/2006, 'KH01', 'NV01', '320000'),
(' 1007', 28/10/2006, 'KH01', 'NV01', '320000'),
(' 1008', 28/10/2006, 'KH01', 'NV01', '320000'),
(' 1009', 28/10/2006, 'KH01', 'NV01', '320000'),
(' 1010', 1/11/2006, 'KH01', 'NV01', '320000'),
(' 1011', 4/11/2006, 'KH01', 'NV01', '320000'),
(' 1012', 30/11/2006, 'KH01', 'NV01', '320000'),
(' 1013', 12/12/2006, 'KH01', 'NV01', '320000'),
(' 1014', 31/12/2006, 'KH01', 'NV01', '320000'),
(' 1015', 1/1/2006, 'KH01', 'NV01', '320000'),
(' 1016', 1/1/2006, 'KH01', 'NV01', '320000'),
(' 1017', 2/1/2006, 'KH01', 'NV01', '320000'),
(' 1018',13/1/2006, 'KH01', 'NV01', '320000'),
(' 1019', 13/1/2006, 'KH01', 'NV01', '320000'),
(' 1020', 14/1/2006, 'KH01', 'NV01', '320000'),
(' 1021', 16/1/2006, 'KH01', 'NV01', '320000'),
(' 1022', 16/1/2006, 'KH01', 'NV01', '320000'),
(' 1023', 17/1/2006, 'KH01', 'NV01', '320000');
 
INSERT INTO CTHD (SOHD, MASP, SL) VALUES
('1001', 'TV02', '10'),
('1001', 'ST01', '5'),
('1001', 'BC01', '5'),
('1001', 'BC02', '10'),
('1001', 'ST08', '10'),
('1002', 'BC04', '20'),
('1002', 'BB01', '20'),
('1002', 'BB02', '20'),
('1003', 'BB03', '10'),
('1004', 'TV01', '20'),
('1004', 'TV02', '10'),
('1004', 'TV03', '10'),
('1004', 'TV04', '10'),
('1005', 'TV05', '50'),
('1005', 'TV06', '20'),
('1006', 'TV07', '20'),
('1006', 'ST01', 30),
('1006', 'ST02', 10),
('1007', 'ST03', 10),
('1008', 'ST04', 8),
('1009', 'ST05', 10),
('1010', 'TV07', 50),
('1010', 'ST07', 50),
('1010', 'ST08', 100),
('1010', 'ST04', 50),
('1010', 'TV03', 100),
('1011', 'ST06', 50),
('1012', 'ST07', 3),
('1013', 'ST08', 5),
('1014', 'BC02', 80),
('1014', 'BB02', 100),
('1014', 'BC04', 60),
('1014', 'BB01', 50),
('1015', 'BB02', 30),
('1015', 'BB03', 7),
('1016', 'TV01', 5),
('1017', 'TV02', 1),
('1017', 'TV03', 1),
('1017', 'TV04', 5),
('1018', 'ST04', 6),
('1019', 'ST05', 1),
('1019', 'ST06', 2),
('1020', 'ST07', 10),
('1021', 'ST08', 5),
('1021', 'TV01', 7),
('1021', 'TV02', 10),
('1022', 'ST07', 1),
('1023', 'ST04', 6);
1. C�c y�u c?u t?o d? li?u
T?o c�c quan h? v� khai b�o c�c kh�a ch�nh, kh�a ngo?i c?a quan h?.
Th�m v�o thu?c t�nh GHICHU c� ki?u d? li?u varchar(20) cho quan h? SANPHAM.
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20);
Th�m v�o thu?c t�nh LOAIKH c� ki?u d? li?u l� tinyint cho quan h? KHACHHANG.
ALTER TABLE KHACHHANG ADD LOAIKH tinyint
S?a ki?u d? li?u c?a thu?c t�nh GHICHU trong quan h? SANPHAM th�nh varchar(100).
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(100);
X�a thu?c t�nh GHICHU trong quan h? SANPHAM.
ALTER TABLE SANPHAM
DROP COLUMN GHICHU
L�m th? n�o ?? thu?c t�nh LOAIKH trong quan h? KHACHHANG c� th? l?u c�c gi� tr? l�: �Vang lai�, �Thuong xuyen�, �Vip�, �
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH NVARCHAR(100);
ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_LOAIKH CHECK (LOAIKH IN ('Vang lai', 'Thuong xuyen', 'Vip'));
??n v? t�nh c?a s?n ph?m ch? c� th? l� (�cay�,�hop�,�cai�,�quyen�,�chuc�)
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_DVT CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'));
Gi� b�n c?a s?n ph?m t? 500 ??ng tr? l�n.
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_GIA CHECK (GIA > 500);
M?i l?n mua h�ng, kh�ch h�ng ph?i mua �t nh?t 1 s?n ph?m.
ALTER TABLE CTHD
ADD CONSTRAINT CK_SL_MIN CHECK (SL >= 1);
Ng�y kh�ch h�ng ??ng k� l� kh�ch h�ng th�nh vi�n ph?i l?n h?n ng�y sinh c?a ng??i ?�.
ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_NGDK CHECK (NGDK > NGSINH);
Ng�y mua h�ng (NGHD) c?a m?t kh�ch h�ng th�nh vi�n s? l?n h?n ho?c b?ng ng�y kh�ch h�ng ?� ??ng k� th�nh vi�n (NGDK).
CREATE FUNCTION dbo.GetNGDK (@MAKH CHAR(4))
RETURNS SMALLDATETIME
AS
BEGIN
	DECLARE @NGDK SMALLDATETIME;
	SELECT @NGDK = NGDK FROM KHACHHANG WHERE MAKH = @MAKH;
	RETURN @NGDK;
END;
 
ALTER TABLE HOADON
ADD CONSTRAINT CK_NGHD_NGDK CHECK (NGHD >= dbo.GetNGDK(MAKH));
Ng�y b�n h�ng (NGHD) c?a m?t nh�n vi�n ph?i l?n h?n ho?c b?ng ng�y nh�n vi�n ?� v�o l�m.
CREATE FUNCTION dbo.GetNGVL (@MANV CHAR(4))
RETURNS SMALLDATETIME
AS
BEGIN
	DECLARE @NGVL SMALLDATETIME;
	SELECT @NGVL = NGVL FROM NHANVIEN WHERE MANV = @MANV;
	RETURN @NGVL;
END;
 
ALTER TABLE HOADON
ADD CONSTRAINT CK_NGHD_NGVL CHECK (NGHD >= dbo.GetNGVL(MANV));
M?i m?t h�a ??n ph?i c� �t nh?t m?t chi ti?t h�a ??n.
CREATE FUNCTION dbo.CountChiTietHoaDon(@SOHD INT)
RETURNS INT
AS
BEGIN
	DECLARE @Count INT;
	SELECT @Count = COUNT(*) FROM CHITIETHOADON WHERE SOHD = @SOHD;
	RETURN @Count;
END;
 
ALTER TABLE HOADON
ADD CONSTRAINT CK_ChiTietHoaDon CHECK (dbo.CountChiTietHoaDon(SOHD) > 0);
Tr? gi� c?a m?t h�a ??n l� t?ng th�nh ti?n (s? l??ng*??n gi�) c?a c�c chi ti?t thu?c h�a ??n ?�.
Kh�ng hi?u sao trong b?ng ho� ??n ?� c� c?t tr? gi� m� n� c�n k�u m�nh t?o c�tj tr? gi� ? ?�y n?a ? c� v? l� ?? c� nh?m l?n. Nh?ng m� m�nh gi? d? ch?a c� c?t tr? gi�  v� b�y gi? m�nh s? t?o 1 c?t t�n l� t?ng th�nh ti?n = s? l??ng*??n gi� v� update gi� tr? v�o ntn:
ALTER TABLE HOADON
ADD TONG_THANH_TIEN MONEY;
 
UPDATE HOADON
SET TONG_THANH_TIEN = (
	SELECT SUM(CTHD.SL * SANPHAM.GIA)
	FROM CTHD
	JOIN SANPHAM ON CTHD.MASP = SANPHAM.MASP
	WHERE CTHD.SOHD = HOADON.SOHD
	GROUP BY CTHD.SOHD
);
Doanh s? c?a m?t kh�ch h�ng l� t?ng tr? gi� c�c h�a ??n m� kh�ch h�ng th�nh vi�n ?� ?� mua.
T??ng t? c�u tr�n, ?? c?ng ?� cho data doanh s?
ALTER TABLE KHACHHANG
ADD TONGGIATRI MONEY;
 
UPDATE KHACHHANG
SET TONGGIATRI = (
	SELECT SUM(HOADON.TRIGIA)
	FROM HOADON
	WHERE HOADON.MAKH = KHACHHANG.MAKH
);
2. C�c y�u c?u truy v?n d? li?u
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� s?n xu?t.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
SELECT * FROM SANPHAM
--In ra danh s�ch c�c s?n ph?m (MASP, TENSP) c� ??n v? t�nh l� �cay�, �quyen�.
SELECT MASP, TENSP, DVT
FROM SANPHAM
WHERE DVT IN ('CAY', 'QUYEN');
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) c� m� s?n ph?m b?t ??u l� �B� v� k?t th�c l� �01�.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01';
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Qu?c� s?n xu?t c� gi� t? 30.000 ??n 40.000.
SELECT MASP, TENSP, GIA
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA BETWEEN 30000 AND 40000
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� ho?c �Thai Lan� s?n xu?t c� gi� t? 30.000 ??n 40.000.
SELECT MASP, TENSP, GIA
FROM SANPHAM
WHERE (NUOCSX = 'TRUNG QUOC' OR NUOCSX = 'THAI LAN') AND GIA BETWEEN 30000 AND 40000
--In ra c�c s? h�a ??n, tr? gi� h�a ??n b�n ra trong ng�y 1/1/2007 v� ng�y 2/1/2007.
SELECT * FROM HOADON
SELECT SOHD, TRIGIA, NGHD
FROM HOADON
WHERE NGHD = '2007-01-01' OR NGHD= '2007-01-02'
--In ra c�c s? h�a ??n, tr? gi� h�a ??n trong th�ng 1/2007, s?p x?p theo ng�y (t?ng d?n) v� tr? gi� c?a h�a ??n (gi?m d?n).
SELECT SOHD, TRIGIA, NGHD
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC;
--In ra danh s�ch c�c kh�ch h�ng (MAKH, HOTEN) ?� mua h�ng trong ng�y 1/1/2007.
SELECT DISTINCT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
JOIN HOADON HD ON HD.MAKH = KH.MAKH
WHERE NGHD = '2007-01-01'
--In ra s? h�a ??n, tr? gi� c�c h�a ??n do nh�n vi�n c� t�n �Nguyen Van B� l?p trong ng�y 28/10/2006.
SELECT HD.SOHD, HD.TRIGIA, NV.HOTEN, NGHD
FROM HOADON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
WHERE HD.NGHD = '2006-10-28' AND NV.HOTEN = 'NGUYEN VAN B'
---In ra danh s�ch c�c s?n ph?m (MASP,TENSP) ???c kh�ch h�ng c� t�n �Nguyen Van A� mua trong th�ng 10/2006.
SELECT SP.MASP, SP.TENSP, KH.HOTEN, HD.NGHD
FROM SANPHAM SP
JOIN CTHD CT ON SP.MASP = CT. MASP
JOIN HOADON HD  ON CT.SOHD = HD.SOHD
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE KH.HOTEN = 'NGUYEN VAN A' AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
--T�m c�c s? h�a ??n ?� mua s?n ph?m c� m� s? �BB01� ho?c �BB02�.
SELECT HD.SOHD, CT.MASP
FROM HOADON HD
JOIN CTHD CT ON HD.SOHD=CT.SOHD
WHERE CT.MASP IN ('BB01', 'BB02');
--T�m c�c s? h�a ??n ?� mua s?n ph?m c� m� s? �BB01� ho?c �BB02�, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.
SELECT HD.SOHD, CT.MASP, CT.SL
FROM HOADON HD
JOIN CTHD CT ON HD.SOHD=CT.SOHD
WHERE CT.MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20;
--T�m c�c s? h�a ??n mua c�ng l�c 2 s?n ph?m c� m� s? �BB01� v� �BB02�, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.
SELECT HD.SOHD, CT.MASP, CT.SL
FROM HOADON HD
JOIN CTHD CT ON HD.SOHD=CT.SOHD
WHERE CT.MASP ='BB01'AND CT.MASP = 'BB02' AND SL BETWEEN 10 AND 20;
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� s?n xu?t ho?c c�c s?n ph?m ???c b�n ra trong ng�y 1/1/2007.
SELECT SP.MASP, SP.TENSP, SP.NUOCSX, HD.NGHD
FROM SANPHAM SP
JOIN CTHD CT ON SP.MASP  = CT.MASP
JOIN HOADON HD ON CT.SOHD = CT.SOHD
WHERE SP.NUOCSX = 'TRUNG QUOC' OR HD.NGHD = '2007-01-01'
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) kh�ng b�n ???c.
SELECT SANPHAM.MASP, SANPHAM.TENSP, CTHD.MASP
FROM SANPHAM
LEFT JOIN CTHD ON SANPHAM.MASP = CTHD.MASP
WHERE CTHD.MASP IS NULL;
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) kh�ng b�n ???c trong n?m 2006.
SELECT SANPHAM.MASP, SANPHAM.TENSP, CTHD.MASP, HD.NGHD
FROM SANPHAM
LEFT JOIN CTHD ON SANPHAM.MASP = CTHD.MASP
LEFT JOIN HOADON HD ON CTHD.SOHD = HD.SOHD
WHERE CTHD.MASP IS NULL AND C�I WTF ?� KH�NG B�N ???C M� N?M 2006???;
--In ra danh s�ch c�c s?n ph?m (MASP,TENSP) do �Trung Quoc� s?n xu?t kh�ng b�n ???c trong n?m 2006.
????
--T�m s? h�a ??n ?� mua t?t c? c�c s?n ph?m do Singapore s?n xu?t.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) = (
	SELECT COUNT(*)
	FROM SANPHAM
	WHERE NUOCSX = 'SINGAPORE')
--C� bao nhi�u h�a ??n kh�ng ph?i c?a kh�ch h�ng ??ng k� th�nh vi�n mua?
SELECT COUNT(*) AS SoHoaDonKhongThanhVien
FROM HOADON
WHERE MAKH IS NULL;
--C� bao nhi�u s?n ph?m kh�c nhau ???c b�n ra trong n?m 2006.
SELECT COUNT(DISTINCT SP.MASP) AS SoSanPhamKhacNhau
FROM SANPHAM SP
RIGHT JOIN CTHD CT ON SP.MASP= CT.MASP
JOIN HOADON HD  ON CT.SOHD  = HD.SOHD
WHERE YEAR(HD.NGHD) = 2006;
--Cho bi?t tr? gi� h�a ??n cao nh?t, th?p nh?t l� bao nhi�u ?
SELECT MAX(TRIGIA) AS TriGiaCaoNhat, MIN(TRIGIA) AS TriGiaThapNhat
FROM HOADON;
--Tr? gi� trung b�nh c?a t?t c? c�c h�a ??n ???c b�n ra trong n?m 2006 l� bao nhi�u?
SELECT AVG(TRIGIA) AS TrungBinhTriGia
FROM HOADON
WHERE YEAR(NGHD) = 2006;
--T�nh doanh thu b�n h�ng trong n?m 2006.
SELECT SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006;
--T�m s? h�a ??n c� tr? gi� cao nh?t trong n?m 2006.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE TRIGIA = (
	SELECT MAX(TRIGIA)
	FROM HOADON) AND YEAR(NGHD) = 2006;
--T�m h? t�n kh�ch h�ng ?� mua h�a ??n c� tr? gi� cao nh?t trong n?m 2006.
SELECT KHACHHANG.HOTEN, HD.SOHD, HD.TRIGIA
FROM HOADON HD
JOIN KHACHHANG ON HD.MAKH = KHACHHANG.MAKH
WHERE TRIGIA = (
	SELECT MAX(TRIGIA)
	FROM HOADON
 )AND YEAR(NGHD) = 2006;
--In ra danh s�ch 3 kh�ch h�ng (MAKH, HOTEN) c� doanh s? cao nh?t.
SELECT TOP 3 MAKH, HOTEN, DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC
--In ra danh s�ch c�c s?n ph?m (MASP, TENSP) c� gi� b�n b?ng 1 trong 3 m?c gi� cao nh?t.
SELECT TOP 3 MASP, TENSP, GIA
FROM SANPHAM
ORDER BY GIA DESC;
--In ra danh s�ch c�c s?n ph?m (MASP, TENSP) do �Thai Lan� s?n xu?t c� gi� b?ng 1 trong 3 m?c gi� cao nh?t (c?a t?t c? c�c s?n ph?m).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (
	SELECT DISTINCT TOP 3 GIA
	FROM SANPHAM
	ORDER BY GIA DESC
);
--In ra danh s�ch c�c s?n ph?m (MASP, TENSP) do �Trung Quoc� s?n xu?t c� gi� b?ng 1 trong 3 m?c gi� cao nh?t (c?a s?n ph?m do �Trung Quoc� s?n xu?t).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (
	SELECT DISTINCT TOP 3 GIA
	FROM SANPHAM
	WHERE NUOCSX = 'TRUNG QUOC'
	ORDER BY GIA DESC
);
--* In ra danh s�ch 3 kh�ch h�ng c� doanh s? cao nh?t (s?p x?p theo ki?u x?p h?ng).
SELECT TOP 3 MAKH, HOTEN, DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC
--T�nh t?ng s? s?n ph?m do �Trung Quoc� s?n xu?t.
SELECT COUNT(*) AS TongSoSanPham
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC';
--T�nh t?ng s? s?n ph?m c?a t?ng n??c s?n xu?t.
SELECT NUOCSX, COUNT(*) AS TongSoSanPham
FROM SANPHAM
GROUP BY NUOCSX;
--V?i t?ng n??c s?n xu?t, t�m gi� b�n cao nh?t, th?p nh?t, trung b�nh c?a c�c s?n ph?m.
SELECT NUOCSX, MAX(GIA) AS GiaCaoNhat, MIN(GIA) AS GiaThapNhat, AVG(GIA) AS GiaTrungBinh
FROM SANPHAM
GROUP BY NUOCSX;
--T�nh doanh thu b�n h�ng m?i ng�y.
SELECT NGHD, SUM(TRIGIA) AS DoanhThu
FROM HOADON
GROUP BY NGHD;
--T�nh t?ng s? l??ng c?a t?ng s?n ph?m b�n ra trong th�ng 10/2006.
SELECT MASP, SUM(SL) AS TongSoLuong
FROM CTHD
WHERE SOHD IN (
	SELECT SOHD
	FROM HOADON
	WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
)
GROUP BY MASP;
--T�nh doanh thu b�n h�ng c?a t?ng th�ng trong n?m 2006.
SELECT MONTH(NGHD) AS Thang, SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD);
--T�m h�a ??n c� mua �t nh?t 4 s?n ph?m kh�c nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4
ORDER BY SOHD ASC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
--T�m h�a ??n c� mua 3 s?n ph?m do �Viet Nam� s?n xu?t (3 s?n ph?m kh�c nhau).
SELECT SOHD
FROM CTHD
JOIN SANPHAM ON CTHD.MASP = SANPHAM.MASP
WHERE NUOCSX = 'VIET NAM'
GROUP BY SOHD
HAVING COUNT(DISTINCT CTHD.MASP) = 3
ORDER BY SOHD ASC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
--T�m kh�ch h�ng (MAKH, HOTEN) c� s? l?n mua h�ng nhi?u nh?t.
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH = (
	SELECT TOP 1 MAKH
	FROM HOADON
	GROUP BY MAKH
	ORDER BY COUNT(*) DESC
);
--Th�ng m?y trong n?m 2006, doanh s? b�n h�ng cao nh?t ?
SELECT TOP 1 MONTH(NGHD) AS Thang, SUM(TRIGIA) AS DoanhSo
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC;
--T�m s?n ph?m (MASP, TENSP) c� t?ng s? l??ng b�n ra th?p nh?t trong n?m 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP = (
	SELECT TOP 1 MASP
	FROM CTHD
	JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
	WHERE YEAR(HOADON.NGHD) = 2006
	GROUP BY MASP
	ORDER BY SUM(SL) ASC
);
--*M?i n??c s?n xu?t, t�m s?n ph?m (MASP,TENSP) c� gi� b�n cao nh?t.
WITH GIACAOONHAT_THEONUOC AS (
	SELECT NUOCSX, MAX(GIA) AS MaxPrice
	FROM SANPHAM
	GROUP BY NUOCSX
)
SELECT S.NUOCSX, S.MASP,S.TENSP, G.MaxPrice
FROM SANPHAM S
INNER JOIN GIACAOONHAT_THEONUOC G ON S.NUOCSX = G.NUOCSX AND S.GIA = G.MaxPrice;
--T�m n??c s?n xu?t s?n xu?t �t nh?t 3 s?n ph?m c� gi� b�n kh�c nhau.
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3;
--*Trong 10 kh�ch h�ng c� doanh s? cao nh?t, t�m kh�ch h�ng c� s? l?n mua h�ng nhi?u nh?t.
WITH RankedKH AS (
	SELECT HOADON.MAKH, COUNT(*) AS SoLanMua,
       	ROW_NUMBER() OVER (ORDER BY SUM(TRIGIA) DESC) AS RowNum
	FROM HOADON
	GROUP BY HOADON.MAKH
)
SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN, RankedKH.SoLanMua
FROM RankedKH
JOIN KHACHHANG ON KHACHHANG.MAKH = RankedKH.MAKH
WHERE RowNum <= 10
ORDER BY RankedKH.SoLanMua DESC;
