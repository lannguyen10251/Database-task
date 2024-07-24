create database QLNV_ontap
use QLNV_ontap
go
 
CREATE TABLE nvien
   	(
   	MaNV INT primary key, -- khóa chính
   	TenNv nvarchar(30),
   	MaVT INT references vtri(MaVT), -- khóa ngoại
   	MaPB INT references pban(MaPB),
   	Luong INT,
   	NgayVL smalldatetime
   	)
CREATE TABLE pban
   	(
   	MaPB INT primary key, -- khóa chính
   	TenPB char(10),
   	Diachi varchar(40),
   	NgayTL smalldatetime,
   	MaNV INT
   	)
CREATE TABLE vtri
   	(
   	MaVT INT primary key,
   	Mota varchar(30)
   	)
CREATE TABLE mluong
   	(
   	MaML INT primary key,
   	Mucthap INT,
   	Muccao INT
   	)
go
 
--Thêm dữ liệu vào bảng
 
INSERT INTO pban (MaPB, TenPB, Diachi, NgayTL, MaNV) VALUES
(1, 'KT', N'HCM', '2023-01-01', 001),
(2, 'IT', N'HN', '2023-01-01', 002),
(3, 'BA', N'ĐN', '2023-01-01', 003);-
INSERT INTO pban (MaPB, TenPB, Diachi, NgayTL, MaNV) VALUES
(4, 'NC', N'HCM', '2023-01-01', 004);
 
INSERT INTO mluong (MaML, Mucthap, Muccao) VALUES
(1, 2600000, 3100000),
(2, 9000000, 10000000),
(3, 7000000, 7800000);
 
INSERT INTO vtri (MaVT, Mota) VALUES
(01, N'Trưởng phòng'),
(02, N'Phó phòng'),
(03, N'Nhân viên');
 
INSERT INTO nvien (MaNV, TenNv, MaVT, MaPB, Luong, NgayVL) VALUES
(001, 'Nguyễn Văn A', 01, 1, 9500000, '2023-02-01'),
(002, 'Nguyễn Văn B', 02, 1, 7500000, '2023-02-01'),
(003, 'Nguyễn Văn C', 03, 1, 3100000, '2023-02-01');
go


--ràng buộc nhân viên phòng KT phải có mức lương > 3000000
CREATE FUNCTION CheckLuongKT()
RETURNS INT
AS
BEGIN
	DECLARE @LuongKT INT;
	SELECT @LuongKT = COUNT(*)
	FROM nvien n
	JOIN pban p ON n.MaPB = p.MaP
	WHERE p.TenPB = 'KT' AND n.Luong <= 3000000; 
	RETURN @LuongKT;
END;
 
ALTER TABLE nvien
ADD CONSTRAINT KT_Luong_PhongKT CHECK (dbo.CheckLuongKT() = 0);
go
 
INSERT INTO nvien (MaNV, TenNv, MaVT, MaPB, Luong, NgayVL) VALUES
(005, 'Nguyễn Văn D', 03, 1, 2000000, '2023-02-01');  
go


-- Mỗi mã mức lương đều có mức thấp bé hơn mức cao từ 500000 tới 1000000
ALTER TABLE mluong
ADD CONSTRAINT MucLuong_ktra CHECK (Mucthap < Muccao AND Muccao - Mucthap BETWEEN 500000 AND 1000000);
 
INSERT INTO mluong (MaML, Mucthap, Muccao) VALUES
(4, 6000006, 7000000);
-- Lương của mỗi nhân viên phải nằm trong khoảng giá trị (từ mức thấp tới mức cao) của một mã mức lương nào đó
CREATE FUNCTION Ktraluongnv(@Luong INT)
RETURNS BIT
AS
BEGIN
	DECLARE @Luongkt BIT;
	IF EXISTS (SELECT 1 FROM mluong WHERE @Luong BETWEEN Mucthap AND Muccao)
    	SET @Luongkt = 1;
	ELSE
    	SET @Luongkt = 0;
 
	RETURN @Luongkt;
END;
GO
 
ALTER TABLE nvien
ADD CONSTRAINT Ktra_luong
CHECK (dbo.Ktraluongnv(Luong) = 1);
 
 –Kiểm tra ràng buộc
INSERT INTO nvien (MaNV, TenNv, MaVT, MaPB, Luong, NgayVL) VALUES
(007, 'Nguyễn Văn F', 02, 1, 9600000, '2023-02-01');
go


 
--In ra danh sách nhân viên (mã nhân viên, họ tên) của phòng NC
Select n.MaNV, n.TenNV, p.TenPB
from nvien n
join pban p on n.MaPB = p.MaPB
where p.TenPB = 'NC'
 
--Tìm trưởng phòng của phòng kế toán
Select n.MaNV, n.TenNV, p.TenPB, v.Mota
from nvien n
join pban p on n.MaPB = p.MaPB
join vtri v on n.MaVT = v.MaVT
where v.MaVT = '01'
--Tìm phòng ban có 5 nhân viên có lương 2tr trở lên
Select p.TenPB, n.TenNV, n.Luong
from nvien n
join pban p on n.MaPB = p.MaPB
where n.Luong >= '2000000' 	//sao biết phòng ban nào có 5 nhân viên đc v chị
go
* Trigger: Tạo bảng lương nhân viên. Tạo trigger khi tăng lương (update luong) trong bảng nhân viên thì nó tự cập nhật vào bảng LUONGNV
CREATE TABLE LUONGNV (
    MANV INT,
    THOIGIAN DATETIME DEFAULT CURRENT_TIMESTAMP,
    old_salary DECIMAL(8 , 2 ),
    new_salary DECIMAL(8 , 2 ),
    PRIMARY KEY (MANV , THOIGIAN) 
);
--Trigger khi tăng lương (update luong) trong bảng nhân viên thì nó tự cập nhật vào bảng LUONGNV
CREATE TABLE LUONGNV (
	MANV INT,
	THOIGIAN DATETIME DEFAULT CURRENT_TIMESTAMP,
	old_salary DECIMAL(9 , 2 ),
	new_salary DECIMAL(9 , 2 ),
	PRIMARY KEY (MANV , THOIGIAN)
);
 
 
CREATE TRIGGER UpdateLUONGNV5
ON LUONGNV
AFTER INSERT
AS
BEGIN
   	UPDATE n
   	SET Luong = i.new_salary
   	FROM nvien n
   	INNER JOIN inserted i ON n.MaNV = i.MaNV
END;
