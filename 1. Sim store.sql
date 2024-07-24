create database QUANLY_SIMDIENTHOAI
use QUANLY_SIMDIENTHOAI
set dateformat DMY;

create table Loaihang
(
	Ma_LoaiHang NChar(10) not null primary key,
	Ten_LoaiHang Nvarchar(100),
	SoluongLH bigint,
	GhiChu Nvarchar(100),
);

create table Nhacungcap
(
	Ma_NCC NChar(10) not null primary key,
	Ten_NCC Nvarchar(100),
	DiaChi_NCC Nvarchar(100),
	SDT_NCC Bigint,
	Email_NCC nvarchar(100)
);

create table Kho
(
	Ma_Kho NChar(10) not null primary key,
	Ten_Kho Nvarchar(100),
	Diachi_Kho nvarchar(100),
);

create table Hanghoa
(
	Ma_SIM NChar(10) not null primary key,
	Ten_SIM Nvarchar(100),
	SoThueBao Char(10),
	NhaMang Nvarchar(100),
	Loai Nchar (10),
	Vitri Nchar(10),
	foreign key(loai) references Loaihang(Ma_Loaihang),
	foreign key(Vitri) references Kho(Ma_Kho)
);

create table hanghoa_loaihang
(
	ma_sim nchar(10),
	ma_loaihang nchar(10),
	ghichu nvarchar (100)
	primary key (ma_sim, ma_loaihang),
	foreign key (ma_sim) references hanghoa(Ma_sim),
	foreign key (ma_loaihang) references loaihang(Ma_loaihang)
);

create table Khachhang
(
	Ma_KH NChar(10) not null primary key,
	HoTen_KH Nvarchar(100),
	NgaySinh_KH Date,
	Diachi_KH Nvarchar(100),
	Email_KH Nvarchar(100),
	Phai_KH Char(3),
);

create table Nhanvien
(
	Ma_NV NChar(10) not null primary key,
	HoTen_NV Nvarchar(100),
	NgaySinh_NV Date,
	DiaChi_NV Nvarchar(100),
	SDT_NV Char(10),
	Phai_NV Char(3)
);

create table Phieunhap
(
	So_PN NChar(10) not null primary key,
	NgayNhap Date,
	HinhThucThanhToan Nvarchar(100),
	Nhanviennhap Nchar(10),
	NCC Nchar(10),
	foreign key (NCC) references Nhacungcap(Ma_NCC),
	foreign key (Nhanviennhap) references NhanVien(Ma_NV)
);

create table ChitietPhieunhap
(
	So_PN Nchar(10),
	Ma_SIM Nchar(10),
	DonGia Float,
	GiamGia Float,
	foreign key (So_PN) references Phieunhap(So_PN),
	foreign key (Ma_SIM) references Hanghoa(Ma_SIM),
);

create table Phieuxuat 
(
	So_PX NChar(10) not null primary key,
	NgayXuat Date,
	HinhThucThanhToan Nvarchar(100),
	Ma_NV Nchar(10),
	Ma_KH Nchar(10),
	foreign key (Ma_KH) references KhachHang(Ma_KH),
	foreign key (Ma_NV) references NhanVien(Ma_NV)
);

create table ChitietPhieuxuat
(
	So_PX Nchar(10),
	Ma_SIM Nchar(10),
	DonGia Float,
	GiamGia float,
	foreign key (So_PX) references Phieuxuat(So_PX),
	foreign key (Ma_SIM) references Hanghoa(Ma_SIM)
);

create table Phieunhaplai
(
	So_PNL NChar(10) not null primary key,
	Ngaynhaplai Date,
	HinhThucThanhToan Nvarchar(100),
	Ma_NV Nchar(10),
	Ma_KH Nchar(10),
	foreign key (Ma_KH) references KhachHang(Ma_KH),
	foreign key (Ma_NV) references NhanVien(Ma_NV)
);

create table ChitietPhieunhaplai
(
	So_PNL Nchar(10),
	Ma_SIM Nchar(10),
	DonGia Float,
	foreign key (Ma_SIM) references Hanghoa(Ma_SIM),
	foreign key (So_PNL) references Phieunhaplai(So_PNL)
);

create table Phieutrahang 
(
	So_PTH NChar(10) not null primary key,
	NgayTH Date,
	HinhThucThanhToan Nvarchar(100),
	Ma_NV Nchar(10),
	Ma_NCC Nchar(10),
	foreign key (Ma_NCC) references nhacungcap(Ma_NCC),
	foreign key (Ma_NV) references NhanVien(Ma_NV)
);

create table ChitietPhieutrahang
(
	So_PTH Nchar(10),
	Ma_SIM Nchar(10),
	Dongia int,
	foreign key (So_PTH) references Phieutrahang(So_PTH),
	foreign key (Ma_sim) references Hanghoa(Ma_sim)
);

--Thêm mới dữ liệu vào bảng Loaihang
insert into Loaihang values(N'0001',N'Sim3G','10',' ');
insert into Loaihang values(N'0002',N'Sim4G','15',' ');
insert into Loaihang values(N'0003',N'Sim5G','10',' ');
--Xem lại dữ liệu
select * from Loaihang


--Thêm dữ liệu bảng Nhacungcap

insert into Nhacungcap values(N'00001',N'Nhà mạng Viettel',N'Số 1 Trần Hữu Dực, phường Mỹ Đình 2, quận Từ Liêm, Hà Nội',null,'Viettel@gmail.com');
insert into Nhacungcap values(N'00002',N'Nhà mạng MobiFone',N'Lô VP1, Phường Yên Hòa, Quận Cầu Giấy, Hà Nội',null,'MobiFone@gmail.com');
insert into Nhacungcap values(N'00003',N'Nhà mạng Vinaphone',N'216 Trần Duy Hưng, Cầu Giấy, Hà Nội',null,'Vinaphone@gmail.com');
insert into Nhacungcap values(N'00004',N'Nhà mạng Vietnamobile',N'Tầng 5, King Building, 7, Chùa Bộc, P. Trung Tự, Q. Đống Đa, Tp. Hà Nội',null,'nxbkhkt@gmail.com')

--Xem lại dữ liệu
select * from Nhacungcap

UPDATE Nhacungcap SET SDT_NCC=18008098 WHERE MA_NCC='00001'
UPDATE Nhacungcap SET SDT_NCC=18001090 WHERE MA_NCC='00002'
UPDATE Nhacungcap SET SDT_NCC=18001091 WHERE MA_NCC='00003'
UPDATE Nhacungcap SET SDT_NCC=0922789789 WHERE MA_NCC='00004'



--insert Kho
insert into Kho (Ma_Kho,Ten_Kho) values(N'001',N'Kho Hải Phong');
insert into Kho(Ma_Kho,Ten_Kho) values(N'002',N'Kho Hồ Chí Minh');
insert into Kho(Ma_Kho,Ten_Kho) values(N'003',N'Kho Đồng Nai');
insert into Kho(Ma_Kho,Ten_Kho) values(N'004',N'Kho Cần Thơ');

select * from kho

UPDATE Kho SET Diachi_Kho=N'1 Trần Phú,Xương Huân, Nha Trang, Khánh Hòa' WHERE Ma_Kho='001'
UPDATE Kho SET Diachi_Kho=N'59 Hồ Thành Biên, Phường 4, Quận 8, TP Hồ Chí Minh' WHERE Ma_Kho='002'
UPDATE Kho SET Diachi_Kho=N'2 Nguyễn Văn Trị, Thanh Bình, Biên hòa, Đồng Nai' WHERE Ma_Kho='003'
UPDATE Kho SET Diachi_Kho=N'2 đại lộ Hòa Bình, Tân An, Ninh Kiều, Cần Thơ' WHERE Ma_Kho='004'


----Insert Hanghoa 
insert into Hanghoa
	values(N'123456789',N'SIMthuong.Vinaphone','0977355555','Vinaphone','0001','001' );
insert into Hanghoa
	values(N'234567891',N'MicroSIM.vinaphone','0975422368',N'Vinaphone','0002','002');
insert into Hanghoa 
	values(N'345678912',N'NanoSIM.vinaphone','0962251225','Vinaphone','0002','002' );
insert into Hanghoa 
	values(N'456789123',N'eSIM.Viettel','0376502502','Viettel','0002','001' );
insert into Hanghoa 
	values(N'567891234',N'Simthuong.Viettel','0366778421','Viettel','0002','002 ');
insert into Hanghoa 
	values(N'678912345',N'NanaSim.vinaphone','0972759339','Vinaphone','0003','001' );
insert into Hanghoa 
	values(N'789123456',N'Simthuong.Vinaphone','0916350168','Vinaphone','0003','002' );
insert into Hanghoa 
	values(N'124356789',N'Simthuong.Vinaphone','0969222124','Vinaphone','0002','003' );
insert into Hanghoa 
	values(N'234667891',N'NanoSim.Mobifone','0767666585',N'Mobifone','0001','002');
insert into Hanghoa 
	values(N'125456789',N'Simthuong.Vietnamobile','0562251225','Vietnamobile','0002','004' );
insert into Hanghoa 
	values(N'133456789',N'NanoSim.Viettel','0376502502','Viettel','0002','004' );
insert into Hanghoa 
	values(N'143456789',N'MicroSim.Mobifone','0766778421','Mobifone','0003','003' );
insert into Hanghoa 
	values(N'163456789',N'NanoSim.Vietnamobile','0572759339','Vietnamobile','0002','002' );
insert into Hanghoa 
	values(N'183456789',N'eSim.Vietnamobile','0516350168','Vietnamobile','0001','004' );
select * from Hanghoa

--Thêm mới dữ liệu vào bảng Hanghoa_Loaihang
insert into Hanghoa_Loaihang values(N'143456789',N'0001',' ');
insert into Hanghoa_Loaihang values(N'163456789',N'0002',' ');
insert into Hanghoa_Loaihang values(N'183456789',N'0003',' ');

----Insert Nhanvien
insert into nhanvien values ('123456789','DINH BA TIEN', '01/09/1955','731 TRAN HUNG DAO, Q1, TPHCM',null, 'NAM')
insert into nhanvien values ('333445555','NGUYEN THANH TUNG', '12/08/1945', '638 NGUYEN VAN CU, Q5, TPHCM',null, 'NAM')
insert into nhanvien values ('999887777','BUI THUY VU', '1958/07/19', '332 NGUYEN THAI HOC, Q1, TPHCM',null, 'NAM')
insert into nhanvien values ('987654321','LE THI NHAN', '1931/06/20', '291 HO VAN HUE, QPN, TPHCM',null, 'NU')
insert into nhanvien values ('666884444','NGUYEN MANH HUNG', '1952/09/15', '975 BA RIA, VUNG TAU',null, 'NAM')
insert into nhanvien values ('453453453','TRAN THANH TAM', '1962/07/31', '543 MAI THI LUU, Q1, TPHCM',null, 'NAM')
insert into nhanvien values ('987987987','TRAN HONG QUANG', '1959/03/29', '980 LE HONG PHONG, Q10, TPHCM',null,'NAM')
insert into nhanvien values ('888665555','VUONG NGOC QUYEN', '1927/10/10', '450 TRUNG VUONG, HA NOI', null, 'NU')

select * from nhanvien



--insert dữ liệu vào Khachhang--
insert into Khachhang values ('1000000001',N'Nguyễn Ngọc Anh Thư',N'01/09/1955',N'64 Phạm Hùng, Phường 4, Quận 8, TP Hồ Chí Minh',null,N'Nu')
insert into Khachhang values ('1000000002',N'Nguyễn Thanh Lan',N'19/04/1960',N'71 Nguyễn Tri Phương, Phường 4, Quận 10, TP Hồ Chí Minh',null,N'Nu')
insert into Khachhang values ('1000000003',N'Lê Huỳnh Minh Thư',N'19/10/1961',N'279 Nguyễn Tri Phương, Phường 5, Quận 10, TP Hồ Chí Minh',null,N'Nu')
insert into Khachhang values ('1000000004',N'Nguyễn Xuân Quỳnh',N'30/01/1967',N'Tam Lang, Phước Nam, Thuận Nam, Ninh Thuận',null,N'Nu')

select * from Khachhang;

--insert dữ liệu vào Phieuxuat 
insert into Phieuxuat(So_PX,NgayXuat,Hinhthucthanhtoan,Ma_NV,Ma_KH) values (N'001','2022-10-20','CK','123456789','1000000001');
insert into Phieuxuat(So_PX,NgayXuat,Hinhthucthanhtoan,Ma_NV,Ma_KH) values (N'002','2022-11-20','COD','987987987','1000000002');
insert into Phieuxuat(So_PX,NgayXuat,Hinhthucthanhtoan,Ma_NV,Ma_KH) values (N'003','2022-11-20','CK','453453453','1000000003');
insert into Phieuxuat(So_PX,NgayXuat,Hinhthucthanhtoan,Ma_NV,Ma_KH) values (N'004','2022-10-20','COD','666884444','1000000004');


select * from phieuxuat 

--issert dữ liệu vào ChiTietPhieuxuat
insert into ChiTietPhieuxuat values('001','123456789','30000','0.1');
insert into ChiTietPhieuxuat values('001','133456789','20000','0.2');
insert into ChiTietPhieuxuat values('002','234567891','40000','0.5');
insert into ChiTietPhieuxuat values('002','143456789','35000','0.4');
insert into ChiTietPhieuxuat values('002','125456789','35000','0.4');
insert into ChiTietPhieuxuat values('003','163456789','35000','0.3');
insert into ChiTietPhieuxuat values('004','183456789','35000','0.6');
insert into ChiTietPhieuxuat values('001','143456789','-20000','0.2');


select * from chitietphieuxuat


--insert dữ liệu vào Phieunhap--
insert into Phieunhap(So_PN,NgayNhap,Hinhthucthanhtoan,Nhanviennhap,NCC) values (N'001','2022-07-01','CK','123456789','00001');
insert into Phieunhap(So_PN,NgayNhap,Hinhthucthanhtoan,Nhanviennhap,NCC) values (N'002','2022-07-01','CK','987987987','00002');
insert into Phieunhap(So_PN,NgayNhap,Hinhthucthanhtoan,Nhanviennhap,NCC) values (N'003','2022-07-01','CK','888665555','00003');
insert into Phieunhap(So_PN,NgayNhap,Hinhthucthanhtoan,Nhanviennhap,NCC) values (N'004','2022-07-01','CK','666884444','00004');
insert into Phieunhap(So_PN,NgayNhap,Hinhthucthanhtoan,Nhanviennhap,NCC) values (N'005','2022-08-01','CK','888665555','00003');

SELECT * FROM Phieunhap

--insert dữ liệu vào ChitietPhieunhap--
-- đang có---
--viettel--
insert into ChitietPhieunhap values('001','133456789','30000','0.1');
insert into ChitietPhieunhap values('001','456789123','20000','0.2');
insert into ChitietPhieunhap values('001','567891234','40000','0.5');
--mobi--
insert into ChitietPhieunhap values('002','143456789','35000','0.4');
insert into ChitietPhieunhap values('002','234667891','35000','0.4');
--vina--
insert into ChitietPhieunhap values('003','123456789','35000','0.3');
insert into ChitietPhieunhap values('003','124356789','35000','0.6');
insert into ChitietPhieunhap values('003','234567891','-20000','0.2');
insert into ChitietPhieunhap values('005','345678912','30000','0.1');
insert into ChitietPhieunhap values('005','678912345','30000','0.1');
insert into ChitietPhieunhap values('005','789123456','20000','0.2');
--vietnam--
insert into ChitietPhieunhap values('004','125456789','40000','0.5');
insert into ChitietPhieunhap values('004','163456789','35000','0.4');
insert into ChitietPhieunhap values('004','183456789','35000','0.4');

select * from ChitietPhieunhap

--insert dữ liệu vào bảng Phieunhaplai--
insert into Phieunhaplai(So_PNL,Ngaynhaplai,Hinhthucthanhtoan,Ma_NV,Ma_KH) values (N'001','2022-12-01','COD','123456789','1000000001');

select * from Phieunhaplai

--insert dữ liệu vào bảng ChitietPhieunhaplai--
insert into ChitietPhieunhaplai values('001','123456789','30000');

--insert dữ liệu vào bảng Phieutrahang--
insert into Phieutrahang(So_PTH,NgayTH,Hinhthucthanhtoan,Ma_NV,Ma_NCC) values (N'001','2022-08-01','CK','888665555','00003');

--insert dữ liệu vào bảng ChitietPhieutrahang--
insert into ChitietPhieutrahang values('001','345678912','30000');


-----------TRUY VẤN
--truy vấn dữ liệu
/*a. Truy vấn 1 bảng*/
	--Câu 1:Cho biết tên, địa chỉ tất cả các nhân viên đang làm việc tại cửa hàng
	select HoTen_NV, DiaChi_NV
	from NhanVien

	--Câu 2: Cho biết danh sách nhân viên có tuổi lớn hơn 40t và là nữ*/
	select MA_NV,Hoten_NV,year(getdate())-year(NgaySinh_NV) as 'Tuổi'
	from nhanvien
	where year(getdate())-year(NgaySinh_NV)>40 and phai_NV=N'nu';

	--Câu 3: Cho biết tuổi của nhân viên gồm các thông tin sau: mã nhân viên, họ tên nhân viên, tuổi
	select Ma_NV,Hoten_NV,2022-year(NgaySinh_NV) as 'Tuổi'
	from nhanvien;



/*b. Truy vấn nhiều bảng (Phép kết)*/
	--Câu 1:Cho biết tên, địa chỉ tất cả các nhân viên đã xuất hàng
	select HoTen_NV, DiaChi_NV
	from NhanVien nv inner join Phieuxuat px on nv.Ma_NV=Px.Ma_NV

	--Câu 2: Cho biết danh sách vị trí của các hàng hóa thuộc loại 0001
	select Ma_Sim, ten_SIm, vitri
	from hanghoa hh full outer join kho k on hh.vitri=k.ten_kho
	where hh.vitri= 001;

	--Câu 3: Cho biết thông tin Mã sim, đơn giá, ngày lập phiếu của phiếu xuất 001
	select Ma_sim,Dongia, Ngayxuat
	from Phieuxuat px inner join ChitietPhieuxuat ctpx on px.so_px=ctpx.so_px
	where px.so_px=001;



/*c. Truy vấn có điều kiện (and, or, like, between,….)*/
	--Câu 1: Cho biết mã, họ tên, ngày sinh của nhân viên nào có họ tên tận cùng là chữ g
	select ma_nv,hoten_nv, NgaySinh_NV
	from nhanvien
	where hoten_nv like N'%g';

	--Câu 2: Cho biết mã, họ tên, ngày sinh của tất cả nhân viên có chữ cái đầu tiền trong họ tên là D or T
	select ma_nv,hoten_nv, NgaySinh_NV
	from nhanvien
	where hoten_nv like 'D%' or hoten_nv like 'T%';

	--Câu 3: Cho biết mã, họ tên, ngày sinh của tất cả  nhân viên có chữ cái đầu tiên trong họ tên là T và phải không bé hơn 10 kí tự và không lớn hơn 20 kí tự
	select ma_nv,hoten_nv, NgaySinh_NV
	from nhanvien
	where hoten_nv like 'T%' and (len(hoten_nv) between 10 and 20);



--d. Truy vấn tính toán
	--Câu 1: Cho biết trung bình tỉ lệ chiết khấu của các hàng hóa đã xuất
	SELECT avg(Giamgia) as 'Trung bình tỉ lệ chiết khấu'
	 FROM Chitietphieuxuat

	--Câu 2: Cho biết tổng số sản phẩm
	select sum(soluonglh) as 'Tổng số lượng'
	from Loaihang
	
	--Câu 3: Cho biết tổng giá trị hàng hóa của phiếu xuất 001
	select sum(dongia) as 'Tổng giá trị phiếu xuất'
	from chitietphieuxuat
	where so_px='001';



--e. Truy vấn có gom nhóm (group by)
	--Câu 1: Cho biết giới tính nhân viên, đếm số lượng nhân viên nữ và nam
	SELECT phai_nv, COUNT(ma_nv) as 'Số lượng'
	FROM nhanvien
	group by phai_nv

	--Câu 2: Cho biết số lượng sim của nhà mạng viettel tại cửa hàng
	SELECT nhamang, COUNT(ma_sim) as 'Số lượng'
	FROM hanghoa
	where nhamang= 'viettel'
	group by nhamang
	
	--Câu 3: Cho biết mỗi loại hàng có bao nhiêu sim
	SELECT lh.ten_loaihang, COUNT(hh.ma_sim) as 'Số lượng sản phẩm đang có'
	FROM loaihang lh, hanghoa hh
	where lh.ma_loaihang=hh.loai
	group by lh.ten_loaihang



--f. Truy vấn gom nhóm có điều kiện (having)
	--Câu 1: Cho biết loại hàng nào có số lượng không nhỏ hơn 3
	SELECT lh.ten_loaihang, COUNT(hh.ma_sim) as 'Số lượng sản phẩm đang có'
	FROM loaihang lh, hanghoa hh
	where lh.ma_loaihang=hh.loai
	group by lh.ten_loaihang
	having count(hh.ma_sim) >=3

	--Câu 2: Cho biết phiếu xuất nào có giá trị lớn hơn 50000
	select so_px,sum(dongia) as 'Tổng giá trị phiếu xuất'
	from chitietphieuxuat
	group by so_px
	having sum(dongia)>50000;
	
	--Câu 3: Cho biết phiếu xuất nào có tổng tiền chiết khấu nhỏ hơn 50000
	SELECT so_px,sum(dongia)*avg(Giamgia) as 'Tổng tiền chiết khấu'
	from chitietphieuxuat
	group by so_px
	having sum(dongia)*avg(Giamgia)<30000;



/*g. Truy vấn có sử dụng phép giao, hội, trừ*/
	--Câu 1: liệt kê những mã sim, tên sim, tên loại hàng mà thuộc loại hàng có mã số 0001 và 0002.
	select hh.ma_sim, hh.ten_sim, lh.ten_loaihang 
	from hanghoa hh, loaihang lh
	where hh.loai=lh.Ma_LoaiHang and hh.loai in
	(select lh.ma_loaihang
	from loaihang lh where Ma_LoaiHang='0001'
	union
	select lh.ma_loaihang
	from loaihang lh where Ma_LoaiHang='0002');
	
	--Câu 2: Cho biết nhân viên nào có lập phiếu xuất
	SELECT        nv.ma_nv, nv.hoten_nv, px.so_px
	FROM            nhanvien nv inner join phieuxuat px on nv.ma_nv=px.ma_nv
	where nv.ma_nv in(select ma_nv
	from nhanvien
	intersect
	select ma_nv
	from phieuxuat);
	
	--Câu 3: Cho biết nhân viên nào không có lập phiếu xuất
	SELECT        nv.ma_nv, nv.hoten_nv
	FROM            nhanvien nv
	where nv.ma_nv in(select ma_nv
	from nhanvien
	except
	select ma_nv
	from phieuxuat);



/*h. Truy vấn con*/
	--Câu1: Kiểm tra xem hàng hóa có mã sim 789 có phải thuộc loại sim 3G hay không?
	SELECT ma_sim, loai
	from hanghoa
	WHERE Ma_sim LIKE '123%' and 
	loai in (select loai from hanghoa )


	--Câu 2: Kể ra mã sim của các nhà cung cấp
	select distinct nhacungcap.ten_NCC, ma_sim
	FROM nhacungcap ,( select * from hanghoa) as sim

	--Câu 3: Cho biết những hàng hóa được bán đầu tiên
	ALTER TABLE phieuxuat 
	ALTER COLUMN ngayxuat date

	select top 1 WITH TIES hh.ma_sim, px.so_px, px.ngayxuat, (select top 1 DATEDIFF(day,NgayXuat, getdate()) from phieuxuat order by DATEDIFF(month,NgayXuat, getdate()) desc) as N'Lập cách đây'
	from hanghoa hh inner join chitietphieuxuat ctpx on hh.ma_sim=ctpx.ma_sim
					inner join phieuxuat px on ctpx.so_px=px.so_px
	order by px.ngayxuat asc




/*i. Truy vấn chéo*/
	--Câu 1: Thống kê số sim của mỗi nhà mạng còn trong Hanghoa
	select N'Tổng trong kho' N'Tên nhà mạng', [Vinaphone],[Vietnamobile],[Viettel],[Mobifone]
	from
	(select NhaMang
	from Hanghoa
	) as BangNguon
	pivot
	(
	count(NhaMang)
	for NhaMang in ([Vinaphone],[Vietnamobile],[Viettel],[Mobifone])
	)as BangChuyen


	--Câu 2: Cho biết doanh thu bán sim trong 2 ngày 20/10 và 20/11*/

	select N'Tổng thu trong ngày', [2022-10-20], [2022-11-20]
	from
	( 
		select  Ngayxuat, Dongia
		from Phieuxuat px inner join ChitietPhieuxuat ctpx on px.so_px=ctpx.so_px 
	) as BangNguon
	pivot
	(
	sum(Dongia) 
	for Ngayxuat in ([2022-10-20], [2022-11-20])
	) as BangChuyen


	--Câu 3: Thống kê loại sim có trong kho hàng*/

	select N'số lương'  N'Loại' , [Sim3G],[Sim4G],[Sim5G]
		from
	(SELECT Ten_LoaiHang
	FROM loaihang lh JOIN hanghoa hh  on lh.ma_loaihang=hh.loai
		) as BangNguon
		pivot
		(
		count(Ten_LoaiHang)
		for Ten_LoaiHang in ([Sim3G],[Sim4G],[Sim5G])
		)as BangChuyen


--Viết store procedure và function
	create function check_malh(@ma_loaihang nchar(10))
	returns VARCHAR(5)
	as
	begin
		if exists(select * from loaihang where Ma_LoaiHang = @ma_loaihang )
			return 'True'
		return 'False'
	end



	create procedure insertloaihangcheckmaa (@ma_loaihang nchar(10),@ten_loaihang nvarchar(100), @ghichu nvarchar(100))
	as
	begin
		if (dbo.check_malh(@ma_loaihang) = 'True')
		begin
			print N'mã loại hàng'+rtrim(convert(nchar,@ma_loaihang,10))+N' đã tồn tại'
		end
		else
		begin try
			insert into loaihang(Ma_LoaiHang, Ten_LoaiHang, ghichu)
			values (@ma_loaihang,@ten_loaihang,@ghichu)
			print N'Thêm loại hàng '+RTRIM(convert(nchar,@ma_loaihang,10))+N' thành công'
		end try
		begin catch
			print N'Thêm loại hàng '+rtrim(convert(nchar,@ma_loaihang,10))+N' không thành công. Vui lòng thử lại.'
		end catch
	end

	exec insertloaihangcheckmaa '0009',N'sim mới',' '
	select* from loaihang

--Cho biết tổng doanh thu của tất cả các phieuxuat  = giảm giá * giá tiền 

	create function dbo.calShowTongdoanhthupx(@giamgia float, @Dongia float)
	returns float
	as
	begin
	return (@giamgia*@Dongia);
	end;

	select sum(dbo.calShowTongdoanhthupx(giamgia, Dongia)) as 'Tổng Doanh Thu'
	from ChiTietphieuxuat CTPX
/*10. Viết trigger ràng buộc dữ liệu cho các bảng*/
	--Câu 1: Kiểm tra bảng sinh viên không có dữ liệu thì thông báo
	CREATE TRIGGER Trigger_Hanghoa_CapNhatLOAIHANGhh ON HANGHOA FOR  UPDATE
	AS
	BEGIN
		If(@@ROWCOUNT =0)
		BEGIN
			Print N'Table HANGHOA Không có dữ liệu'
			Return
		END

		IF EXISTS(SELECT t1.MA_SIM FROM HANGHOA_LOAIHANG t1,DELETED t2 WHERE t1.MA_SIM = t2.MA_SIM AND t1.GHICHU IS NOT NULL)
		BEGIN
			Print N'Hàng Hóa Này Đã Tồn Tại Không Thể update Ma_SIM'
			ROllBack Tran
		END

		UPDATE t1 SET t1.MA_SIM = t3.MA_SIM
		FROM HANGHOA_LOAIHANG t1, DELETED t2, INSERTED t3
		WHERE t1.MA_SIM = t2.MA_SIM
	END
			--kiểm tra
	UPDATE HANGHOA SET MA_SIM ='163456789' WHERE MA_SIM ='143456779';
	UPDATE HANGHOA SET loai ='0001' WHERE MA_SIM ='143456789'
	SELECT * FROM HANGHOA
	SELECT * FROM HANGHOA_LOAIHANG

	--Câu 2: Ràng buộc cập nhật nhân viên thì không được cập nhật nhân viên ở phái nam
	create trigger trg_checkupdateonphai on nhanvien for update 
	as
	if exists (select phai_nv from nhanvien where phai_nv like N'NAM')
	begin
	print N'Không thể cập nhật nhân viên ở phái nam';
	rollback tran;
	end;
			--Kiểm tra
	UPDATE nhanvien SET phai_nv ='nam' WHERE phai_nv ='nu'

	--Câu 3: Ràng buộc khi thêm mới nhân viên thì độ tuổi phải trong khoảng từ 18t đến 65t
	create trigger trg_checkvaliageeee
	on nhanvien
	for insert 
	as
	declare @age int;
	select @age=datediff(year, NgaySinh_NV, getdate())+1 from inserted;
	if @age<18 or @age>65
	begin
	print N'Tuổi của nhân viên không hợp lệ';
	rollback transaction;
	end;
			--Kiểm tra
	insert into nhanvien(ma_nv, NgaySinh_NV) values ('111111116','20-10-2008')




/*11. Phân quyền*/
	create login LANandTHU with password = 'abcd'
	create user PHANQUYEN for login LANandTHU
	/*TRUY VẤN PH N QUYỀN */
	grant select, insert, update, delete on hanghoa to PHANQUYEN
	grant select, insert, update, delete on khachhang to PHANQUYEN
	grant select, insert, update, delete on Kho to PHANQUYEN
	grant select, insert, update, delete on hanghoa_loaihang to PHANQUYEN
	grant select, insert, update, delete on Loaihang to PHANQUYEN
	grant select, insert, update, delete on Nhacungcap to PHANQUYEN
	grant select, insert, update, delete on Nhanvien to PHANQUYEN
	grant select, insert, update, delete on Phieunhap to PHANQUYEN
	grant select, insert, update, delete on phieunhaplai to PHANQUYEN
	grant select, insert, update, delete on phieutrahang to PHANQUYEN
	grant select, insert, update, delete on phieuxuat to PHANQUYEN
	grant select, insert, update, delete on chitietPhieunhap to PHANQUYEN
	grant select, insert, update, delete on chitietphieunhaplai to PHANQUYEN
	grant select, insert, update, delete on chitietphieutrahang to PHANQUYEN
	grant select, insert, update, delete on chitietphieuxuat to PHANQUYEN
	/* XÓA Ph N QUYỀN */
	revoke select, insert, update, delete on hanghoa to PHANQUYEN
	revoke select, insert, update, delete on khachhang to PHANQUYEN
	revoke select, insert, update, delete on Kho to PHANQUYEN
	revoke select, insert, update, delete on hanghoa_loaihang to PHANQUYEN
	revoke select, insert, update, delete on Loaihang to PHANQUYEN
	revoke select, insert, update, delete on Nhacungcap to PHANQUYEN
	revoke select, insert, update, delete on Nhanvien to PHANQUYEN
	revoke select, insert, update, delete on Phieunhap to PHANQUYEN
	revoke select, insert, update, delete on phieunhaplai to PHANQUYEN
	revoke select, insert, update, delete on phieutrahang to PHANQUYEN
	revoke select, insert, update, delete on phieuxuat to PHANQUYEN
	revoke select, insert, update, delete on chitietPhieunhap to PHANQUYEN
	revoke select, insert, update, delete on chitietphieunhaplai to PHANQUYEN
	revoke select, insert, update, delete on chitietphieutrahang to PHANQUYEN
	revoke select, insert, update, delete on chitietphieuxuat to PHANQUYEN



--12. Sao lưu dữ liệu
	backup database QUANLY_SIMDIENTHOAI to disk = 'E:\DAQLSIMDT'



