CREATE DATABASE QLTV
USE QLTV

CREATE TABLE sach
(
masosach int,
tensach nvarchar(255),
namXB int,
tacgia nvarchar(255),
ISBN nvarchar(15),
tinhtrangsach nvarchar(50),
ngonngu nvarchar(50),
tomtat nvarchar(50),
PRIMARY KEY (masosach, tinhtrangsach),
)

CREATE TABLE docgia
(
mathedocgia nvarchar(15) PRIMARY KEY,
hoten nvarchar(255),
ngaylapthe date,
ngayhethan date
)

CREATE TABLE muonsach
(
mathedocgia nvarchar(15) REFERENCES docgia(mathedocgia),
masosach int,
tinhtrangsach nvarchar(50) CONSTRAINT chk_tinhtrang CHECK (tinhtrangsach <> '?ã m??n'),
ngaymuon date,
ngaytra date
PRIMARY KEY (mathedocgia, masosach, tinhtrangsach),
FOREIGN KEY (masosach, tinhtrangsach) REFERENCES sach(masosach, tinhtrangsach)
)

INSERT INTO sach(masosach, tensach, namXB, tacgia, ISBN, tinhtrangsach, ngonngu, tomtat) VALUES ('1', N'??nh lu?t MURPHY', '2003', N'T? Tính Phong', '9786043920956', N'ch?a m??n', N'Ti?ng Vi?t', N'Thao túng tâm lý');
INSERT INTO sach(masosach, tensach, namXB, tacgia, ISBN, tinhtrangsach, ngonngu, tomtat) VALUES ('2', N'Tu?i tr? ?ang giá bao nhiêu', '2002', N'Rosie Nguy?n', '9786043912067', N'?ã m??n', N'Ti?ng Vi?t', N'Tìm hi?u v? tu?i tr?');
INSERT INTO sach(masosach, tensach, namXB, tacgia, ISBN, tinhtrangsach, ngonngu, tomtat) VALUES ('3', N'Gi?i giao ti?p d? thành công', '2000', N'Shirlay Taylor & Alison Lester', '9786043925913', N'ch?a m??n', N'Ti?ng Vi?t', N'T?p cách giao ti?p');
INSERT INTO sach(masosach, tensach, namXB, tacgia, ISBN, tinhtrangsach, ngonngu, tomtat) VALUES ('4', N'Thiên tài bên trái, K? ?iên bên ph?i', '2003', N'T? Tính Phong', '9786043920932', N'ch?a m??n', N'Ti?ng Vi?t', N'Góc nhìn khác nhau');
INSERT INTO sach(masosach, tensach, namXB, tacgia, ISBN, tinhtrangsach, ngonngu, tomtat) VALUES ('5', N'Cho tôi xin m?t vé ?i tu?i th?', '2005', N'Nguy?n Nh?t Ánh', '9786041004757', N'?ã m??n', N'Ti?ng Vi?t', N'Nhìn l?i tu?i th?');

SELECT * FROM sach;

UPDATE sach SET tacgia = 'Cao Minh' WHERE masosach = '4';

INSERT INTO docgia(mathedocgia, hoten, ngaylapthe, ngayhethan) VALUES ('DG0001', N'?inh M?nh ??c', '2022-10-06', '2024-10-06');
INSERT INTO docgia(mathedocgia, hoten, ngaylapthe, ngayhethan) VALUES ('DG0002', N'Nguy?n D??ng Phong', '2022-11-20', '2024-12-20');
INSERT INTO docgia(mathedocgia, hoten, ngaylapthe, ngayhethan) VALUES ('DG0003', N'Nguy?n Vi?t Quang', '2022-05-18', '2024-05-18');
INSERT INTO docgia(mathedocgia, hoten, ngaylapthe, ngayhethan) VALUES ('DG0004', N'Tr?n M?nh Qu?nh', '2022-09-01', '2024-09-01');
INSERT INTO docgia(mathedocgia, hoten, ngaylapthe, ngayhethan) VALUES ('DG0005', N'Nguy?n Công Danh', '2022-07-25', '2024-07-25');

SELECT * FROM docgia;

INSERT INTO muonsach(mathedocgia, masosach, tinhtrangsach, ngaymuon, ngaytra) VALUES ('DG0001', '1',N'ch?a m??n', '2022-02-10', '2022-02-20');
INSERT INTO muonsach(mathedocgia, masosach, tinhtrangsach, ngaymuon, ngaytra) VALUES ('DG0002', '1', N'ch?a m??n', '2022-01-05', '2022-01-15');
INSERT INTO muonsach(mathedocgia, masosach, tinhtrangsach, ngaymuon, ngaytra) VALUES ('DG0001', '3',N'ch?a m??n', '2022-02-10', '2022-02-20');
INSERT INTO muonsach(mathedocgia, masosach, tinhtrangsach, ngaymuon, ngaytra) VALUES ('DG0004', '1',N'ch?a m??n', '2023-10-10', '2023-10-20');
INSERT INTO muonsach(mathedocgia, masosach, tinhtrangsach, ngaymuon, ngaytra) VALUES ('DG0005', '4',N'ch?a m??n', '2022-01-12', '2022-01-12');
delete from muonsach where mathedocgia= 'DG0003'
SELECT * FROM muonsach;

--SELECT COUNT(*) AS soluongcuonsach FROM sach;
--Cho bi?t v?i m?i sách có bao nhiêu cu?n sách
SELECT masosach,tensach, COUNT(masosach) AS soluongcuonsach
FROM sach
GROUP BY masosach, tensach;
INSERT INTO sach(masosach, tensach, namXB, tacgia, ISBN, tinhtrangsach, ngonngu, tomtat) 
VALUES ('1', N'??nh lu?t MURPHY', '2003', N'T? Tính Phong', '9786043920956', N'?ã m??n', N'Ti?ng Vi?t', N'Thao túng tâm lý');

--Cho bi?t ??c gi? có mã th? ??c gi? = ‘DG0001’ ?ã m??n nh?ng cu?n sách có t?a là gì.
SELECT muonsach. mathedocgia, sach.tensach FROM sach JOIN muonsach ON sach.masosach = muonsach.masosach WHERE mathedocgia = 'DG0001';

--Cho bi?t trong n?m 2022 m?i ??c gi? ?ã m??n bao nhiêu cu?n sách
SELECT docgia.mathedocgia, docgia.hoten, muonsach.ngaymuon, COUNT(*) AS soluongdamuon FROM docgia 
JOIN muonsach ON docgia.mathedocgia = muonsach.mathedocgia 
WHERE YEAR(muonsach.ngaymuon) = 2022 
GROUP BY docgia.mathedocgia, docgia.hoten, muonsach.ngaymuon;
