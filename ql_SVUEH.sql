CREATE DATABASE SINH_VIENUEH
USE SINH_VIENUEH


CREATE TABLE SINHVIEN
(
MASV INT PRIMARY KEY,
HOTEN VARCHAR(30),
NAMSINH INT,
MACN INT REFERENCES CHUYENNGANH(MACN)
)


CREATE TABLE CHUYENNGANH
(
MACN INT PRIMARY KEY,
TENCN VARCHAR(30)
)


CREATE TABLE DANGKY
(
MASV INT REFERENCES SINHVIEN(MASV),
MAMON VARCHAR(20) REFERENCES MON(MAMON),
NAMHOC INT,
HOCKY INT
)


CREATE TABLE MON
(
MAMON VARCHAR(20) PRIMARY KEY,
TENMON VARCHAR(30),
SOTINCHI INT
)


--C�u 2a


INSERT INTO SINHVIEN(MASV, HOTEN, NAMSINH, MACN) VALUES (001, N'NGUY?N V?N A', 2003, 01);
INSERT INTO SINHVIEN(MASV, HOTEN, NAMSINH, MACN) VALUES (002, N'NGUY?N V?N B', 2003, 02);
INSERT INTO SINHVIEN(MASV, HOTEN, NAMSINH, MACN) VALUES (003, N'NGUY?N V?N C', 2003, 01);
SELECT * FROM SINHVIEN;


INSERT INTO CHUYENNGANH(MACN, TENCN) VALUES (01, 'HE THONG THONG TIN');
INSERT INTO CHUYENNGANH(MACN, TENCN) VALUES (02, 'AN TOAN THONG TIN');
SELECT * FROM CHUYENNGANH;


INSERT INTO DANGKY(MASV, MAMON, NAMHOC, HOCKY) VALUES (001, 'PTTKHTTT', 2024, 1);
INSERT INTO DANGKY(MASV, MAMON, NAMHOC, HOCKY) VALUES (002, 'CSDL', 2024, 1);
INSERT INTO DANGKY(MASV, MAMON, NAMHOC, HOCKY) VALUES (003, 'CSDL', 2024, 1);
INSERT INTO DANGKY(MASV, MAMON, NAMHOC, HOCKY) VALUES (001, 'CSDL', 2024, 1);
INSERT INTO DANGKY(MASV, MAMON, NAMHOC, HOCKY) VALUES (002, 'PTTKHTTT', 2024, 1);
SELECT * FROM DANGKY;


INSERT INTO MON(MAMON, TENMON, SOTINCHI) VALUES ('PTTKHTTT', N'PH N T�CH THI?T K?', 3);
INSERT INTO MON(MAMON, TENMON, SOTINCHI) VALUES ('CSDL', N'C? S? D? LI?U', 3);
SELECT * FROM MON;


-- R�NG BU?C S? T�N CH? C?A M?T M�N H?C PH?I N?M TRONG KHO?NG T? 2 ??N 4 
ALTER TABLE MON
ADD CONSTRAINT CheckSTC
CHECK(SOTINCHI BETWEEN 2 AND 4);


INSERT INTO MON(MAMON, TENMON, SOTINCHI) VALUES ('TOANCAOCAP', N'TO�N CAO C?P', 5);
INSERT INTO MON(MAMON, TENMON, SOTINCHI) VALUES ('TOANROIRAC', N'TO�N R?I R?C', 1);


--C�u 2b
CREATE FUNCTION CheckNamDK()
RETURNS INT
AS
BEGIN
	DECLARE @KtraNam INT;
	SELECT @KtraNam = COUNT(*)
	FROM SINHVIEN s
	JOIN DANGKY d ON s.MASV = d.MASV
	WHERE NAMHOC < NAMSINH;
	RETURN @KtraNam;
END;


ALTER TABLE DANGKY
ADD CONSTRAINT Namdk CHECK (dbo.CheckNamDK() = 0);


INSERT INTO DANGKY(MASV, MAMON, NAMHOC, HOCKY) VALUES (004, 'CSDL', 2002, 1);


--C�u 3a
SELECT s.MASV, s.HOTEN, c.TENCN
FROM SINHVIEN s
JOIN CHUYENNGANH c ON s.MACN = c.MACN
WHERE c.TENCN = 'HE THONG THONG TIN';


--C�u 3b
SELECT s.MASV, s.HOTEN, c.TENCN, d.MAMON
FROM SINHVIEN s
JOIN CHUYENNGANH c ON s.MACN = c.MACN
JOIN DANGKY d ON s.MASV = d.MASV
WHERE c.TENCN = 'HE THONG THONG TIN' AND MAMON <> 'PTTKHTTT';


--C�u 3c
CREATE TABLE MON_CHUYENNGANH
(
MAMON VARCHAR(20) REFERENCES MON(MAMON),
MACN INT REFERENCES CHUYENNGANH(MACN),
PRIMARY KEY (MAMON, MACN)
)


INSERT INTO MON_CHUYENNGANH(MACN, MAMON) VALUES (01,'PTTKHTTT');
INSERT INTO MON_CHUYENNGANH(MACN, MAMON) VALUES (01,'CSDL');
SELECT * FROM MON_CHUYENNGANH;


SELECT DISTINCT D.MASV, S.HOTEN, M.MACN, COUNT(DISTINCT D.MAMON) AS SOLUONGMON
FROM SINHVIEN S
JOIN DANGKY D ON S.MASV = D.MASV
JOIN MON_CHUYENNGANH M ON S.MACN=M.MACN
WHERE M.MACN = 01
GROUP BY D.MASV,S.HOTEN, M.MACN
HAVING COUNT(DISTINCT D.MAMON) = (SELECT COUNT(*) FROM MON_CHUYENNGANH);
