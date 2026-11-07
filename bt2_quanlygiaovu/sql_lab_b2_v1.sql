CREATE TABLE KHOA (
	MAKHOA VARCHAR(4) PRIMARY KEY,
	TENKHOA VARCHAR(40),
	NGTLAP DATE,
	TRGKHOA CHAR(4)
);

CREATE TABLE MONHOC (
	MAMH VARCHAR(10) PRIMARY KEY,
	TENMH VARCHAR(40),
	TCLT SMALLINT,
	TCTH SMALLINT,
	MAKHOA VARCHAR(4),
	
	CONSTRAINT FK_MONHOC_KHOA 
		FOREIGN KEY (MAKHOA) 
		REFERENCES KHOA(MAKHOA)
);

CREATE TABLE DIEUKIEN (
    MAMH VARCHAR(10),
    MAMH_TRUOC VARCHAR(10),

    PRIMARY KEY (MAMH, MAMH_TRUOC),

    CONSTRAINT FK_DIEUKIEN_MONHOC
        FOREIGN KEY (MAMH)
        REFERENCES MONHOC(MAMH),

    CONSTRAINT FK_DIEUKIEN_MONHOC_TRUOC
        FOREIGN KEY (MAMH_TRUOC)
        REFERENCES MONHOC(MAMH)
);

CREATE TABLE GIAOVIEN (
    MAGV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    HOCVI VARCHAR(10),
    HOCHAM VARCHAR(10),
    GIOITINH VARCHAR(3),
    NGSINH DATE,
    NGVL DATE,
    HESO NUMERIC(4,2),
    MUCLUONG NUMERIC(19,4),
    MAKHOA VARCHAR(4),

    CONSTRAINT FK_GIAOVIEN_KHOA
        FOREIGN KEY (MAKHOA)
        REFERENCES KHOA(MAKHOA)
);

ALTER TABLE KHOA
ADD CONSTRAINT FK_KHOA_GIAOVIEN
FOREIGN KEY (TRGKHOA)
REFERENCES GIAOVIEN(MAGV);

CREATE TABLE LOP (
    MALOP CHAR(3) PRIMARY KEY,
    TENLOP VARCHAR(40),
    TRGLOP CHAR(5),
    SISO SMALLINT CHECK (SISO BETWEEN 0 AND 255),
    MAGVCN CHAR(4),

    CONSTRAINT FK_LOP_GIAOVIEN
        FOREIGN KEY (MAGVCN)
        REFERENCES GIAOVIEN(MAGV)
);

CREATE TABLE HOCVIEN (
    MAHV CHAR(5) PRIMARY KEY,
    HO VARCHAR(40),
    TEN VARCHAR(10),
    NGSINH DATE,
    GIOITINH VARCHAR(3),
    NOISINH VARCHAR(40),
    MALOP CHAR(3),

    CONSTRAINT FK_HOCVIEN_LOP
        FOREIGN KEY (MALOP)
        REFERENCES LOP(MALOP)
);

ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_HOCVIEN
FOREIGN KEY (TRGLOP)
REFERENCES HOCVIEN(MAHV);

CREATE TABLE GIANGDAY (
    MALOP CHAR(3),
    MAMH VARCHAR(10),
    MAGV CHAR(4),
    HOCKY SMALLINT CHECK (HOCKY BETWEEN 0 AND 255),
    NAM SMALLINT,
    TUNGAY DATE,
    DENNGAY DATE,

    PRIMARY KEY (MALOP, MAMH, HOCKY, NAM),

    CONSTRAINT FK_GIANGDAY_LOP
        FOREIGN KEY (MALOP)
        REFERENCES LOP(MALOP),

    CONSTRAINT FK_GIANGDAY_MONHOC
        FOREIGN KEY (MAMH)
        REFERENCES MONHOC(MAMH),

    CONSTRAINT FK_GIANGDAY_GIAOVIEN
        FOREIGN KEY (MAGV)
        REFERENCES GIAOVIEN(MAGV),

    CONSTRAINT CHK_GIANGDAY_DATE
        CHECK (DENNGAY IS NULL OR TUNGAY IS NULL OR DENNGAY >= TUNGAY)
);


CREATE TABLE KETQUATHI (
    MAHV CHAR(5),
    MAMH VARCHAR(10),
    LANTHI SMALLINT CHECK (LANTHI BETWEEN 0 AND 255),
    NGTHI DATE,
    DIEM NUMERIC(4,2),
    KQUA VARCHAR(10),

    PRIMARY KEY (MAHV, MAMH, LANTHI),

    CONSTRAINT FK_KETQUATHI_HOCVIEN
        FOREIGN KEY (MAHV)
        REFERENCES HOCVIEN(MAHV),

    CONSTRAINT FK_KETQUATHI_MONHOC
        FOREIGN KEY (MAMH)
        REFERENCES MONHOC(MAMH),

    CONSTRAINT CHK_KETQUATHI_DIEM
        CHECK (DIEM BETWEEN 0 AND 10)
);


--- INSERT DATA

ALTER TABLE KHOA
DROP CONSTRAINT fk_khoa_giaovien;


INSERT INTO KHOA (
	MAKHOA,
	TENKHOA,
	NGTLAP,
	TRGKHOA
)
VALUES 
	('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
	('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
	('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
	('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
	('KTMT', 'Ky thuat may tinh', '2005-12-20', null);


INSERT INTO GIAOVIEN (
    MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH,
    NGSINH, NGVL, HESO, MUCLUONG, MAKHOA
)
VALUES
    ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam',
     '1950-05-02', '2004-01-11', 5.00, 2250000, 'KHMT'),

    ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam',
     '1965-12-17', '2004-04-20', 4.50, 2025000, 'HTTT'),

    ('GV03', 'Do Nghiem Thuong', 'TS', 'GS', 'Nu',
     '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),

    ('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam',
     '1961-02-22', '2005-12-01', 4.50, 2025000, 'KTMT'),

    ('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam',
     '1958-12-12', '2005-12-01', 3.00, 1350000, 'HTTT'),

    ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam',
     '1953-11-11', '2005-12-01', 4.50, 2025000, 'KHMT'),

    ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam',
     '1971-11-23', '2005-01-03', 4.00, 1800000, 'KHMT'),

    ('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu',
     '1974-03-26', '2005-01-03', 1.69, 760500, 'KHMT'),

    ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu',
     '1966-12-31', '2005-01-03', 4.00, 1800000, 'HTTT'),

    ('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu',
     '1972-07-17', '2005-01-03', 1.86, 837000, 'CNPM'),

    ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam',
     '1980-12-12', '2005-05-15', 2.67, 1201500, 'MTT'),

    ('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu',
     '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),

    ('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu',
     '1980-05-23', '2005-05-15', 1.69, 760500, 'KTMT'),

    ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu',
     '1976-11-30', '2005-05-15', 3.00, 1350000, 'MTT'),

    ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam',
     '1978-05-04', '2005-05-15', 3.00, 1350000, 'KHMT');


ALTER TABLE KHOA
ADD CONSTRAINT FK_KHOA_GIAOVIEN
FOREIGN KEY (TRGKHOA)
REFERENCES GIAOVIEN(MAGV);


ALTER TABLE LOP
DROP CONSTRAINT IF EXISTS fk_lop_hocvien;


INSERT INTO LOP (
    MALOP,
    TENLOP,
    TRGLOP,
    SISO,
    MAGVCN
)
VALUES
    ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
    ('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
    ('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');



INSERT INTO HOCVIEN (
    MAHV,
    HO,
    TEN,
    NGSINH,
    GIOITINH,
    NOISINH,
    MALOP
)
VALUES
    ('K1101', 'Nguyen Van', 'A', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
    ('K1102', 'Tran Ngoc', 'Han', '1986-03-14', 'Nu', 'Kien Giang', 'K11'),
    ('K1103', 'Ha Duy', 'Lap', '1986-04-18', 'Nam', 'Nghe An', 'K11'),
    ('K1104', 'Tran Ngoc', 'Linh', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
    ('K1105', 'Tran Minh', 'Long', '1986-02-27', 'Nam', 'TpHCM', 'K11'),
    ('K1106', 'Le Nhat', 'Minh', '1986-01-24', 'Nam', 'TpHCM', 'K11'),
    ('K1107', 'Nguyen Nhu', 'Nhut', '1986-01-27', 'Nam', 'Ha Noi', 'K11'),
    ('K1108', 'Nguyen Manh', 'Tam', '1986-02-27', 'Nam', 'Kien Giang', 'K11'),
    ('K1109', 'Phan Thi Thanh', 'Tam', '1986-01-27', 'Nu', 'Vinh Long', 'K11'),
    ('K1110', 'Le Hoai', 'Thuong', '1986-02-05', 'Nu', 'Can Tho', 'K11'),
    ('K1111', 'Le Ha', 'Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),

    ('K1201', 'Nguyen Van', 'B', '1986-02-11', 'Nam', 'TpHCM', 'K12'),
    ('K1202', 'Nguyen Thi Kim', 'Duyen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
    ('K1203', 'Tran Thi Kim', 'Duyen', '1986-09-17', 'Nu', 'TpHCM', 'K12'),
    ('K1204', 'Truong My', 'Hanh', '1986-05-19', 'Nu', 'Dong Nai', 'K12'),
    ('K1205', 'Nguyen Thanh', 'Nam', '1986-04-17', 'Nam', 'TpHCM', 'K12'),
    ('K1206', 'Nguyen Thi Truc', 'Thanh', '1986-03-04', 'Nu', 'Kien Giang', 'K12'),
    ('K1207', 'Tran Thi Bich', 'Thuy', '1986-02-08', 'Nu', 'Nghe An', 'K12'),
    ('K1208', 'Huynh Thi Kim', 'Trieu', '1986-04-08', 'Nu', 'Tay Ninh', 'K12'),
    ('K1209', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
    ('K1210', 'Ngo Thanh', 'Tuan', '1986-02-14', 'Nam', 'TpHCM', 'K12'),
    ('K1211', 'Do Thi', 'Xuan', '1986-03-09', 'Nu', 'Ha Noi', 'K12'),
    ('K1212', 'Le Thi Phi', 'Yen', '1986-03-12', 'Nu', 'TpHCM', 'K12'),

    ('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-06-09', 'Nu', 'Kien Giang', 'K13'),
    ('K1302', 'Truong Thi My', 'Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
    ('K1303', 'Le Duc', 'Hien', '1986-03-21', 'Nam', 'Tay Ninh', 'K13'),
    ('K1304', 'Le Quang', 'Hien', '1986-04-18', 'Nam', 'TpHCM', 'K13'),
    ('K1305', 'Le Thi', 'Huong', '1986-03-27', 'Nu', 'TpHCM', 'K13'),
    ('K1306', 'Nguyen Thai', 'Huu', '1986-03-30', 'Nam', 'Ha Noi', 'K13'),
    ('K1307', 'Tran Minh', 'Man', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
    ('K1308', 'Nguyen Hieu', 'Nghia', '1986-04-08', 'Nam', 'Kien Giang', 'K13'),
    ('K1309', 'Nguyen Trung', 'Nghia', '1987-01-18', 'Nam', 'Nghe An', 'K13'),
    ('K1310', 'Tran Thi Hong', 'Tham', '1986-04-22', 'Nu', 'Tay Ninh', 'K13'),
    ('K1311', 'Tran Minh', 'Thuc', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
    ('K1312', 'Nguyen Thi Kim', 'Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13');



ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_HOCVIEN
FOREIGN KEY (TRGLOP)
REFERENCES HOCVIEN(MAHV);




INSERT INTO MONHOC (
    MAMH,
    TENMH,
    TCLT,
    TCTH,
    MAKHOA
)
VALUES
    ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
    ('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
    ('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
    ('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
    ('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
    ('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
    ('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
    ('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
    ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
    ('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
    ('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
    ('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
    ('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');



INSERT INTO DIEUKIEN (
    MAMH,
    MAMH_TRUOC
)
VALUES
    ('CSDL', 'CTRR'),
    ('CSDL', 'CTDLGT'),
    ('CTDLGT', 'THDC'),
    ('PTTKTT', 'THDC'),
    ('PTTKTT', 'CTDLGT'),
    ('DHMT', 'THDC'),
    ('LTHDT', 'THDC'),
    ('PTTKHTTT', 'CSDL');



INSERT INTO GIANGDAY (
    MALOP,
    MAMH,
    MAGV,
    HOCKY,
    NAM,
    TUNGAY,
    DENNGAY
)
VALUES
    ('K11', 'THDC', 'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
    ('K12', 'THDC', 'GV06', 1, 2006, '2006-01-02', '2006-05-12'),
    ('K13', 'THDC', 'GV15', 1, 2006, '2006-01-02', '2006-05-12'),

    ('K11', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
    ('K12', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
    ('K13', 'CTRR', 'GV08', 1, 2006, '2006-01-09', '2006-05-17'),

    ('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),

    ('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),

    ('K13', 'CSDL', 'GV05', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),

    ('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),

    ('K11', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-02-18'),
    ('K12', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-03-20'),

    ('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');



INSERT INTO KETQUATHI (
    MAHV,
    MAMH,
    LANTHI,
    NGTHI,
    DIEM,
    KQUA
)
VALUES
    ('K1101', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
    ('K1101', 'CTDLGT', 1, '2006-12-28', 9.00, 'Dat'),
    ('K1101', 'THDC', 1, '2006-05-20', 9.00, 'Dat'),
    ('K1101', 'CTRR', 1, '2006-05-13', 9.50, 'Dat'),

    ('K1102', 'CSDL', 1, '2006-07-20', 4.00, 'Khong Dat'),
    ('K1102', 'CSDL', 2, '2006-07-27', 4.25, 'Khong Dat'),
    ('K1102', 'CSDL', 3, '2006-08-10', 4.50, 'Khong Dat'),
    ('K1102', 'CTDLGT', 1, '2006-12-28', 4.50, 'Khong Dat'),
    ('K1102', 'CTDLGT', 2, '2007-01-05', 4.00, 'Khong Dat'),
    ('K1102', 'CTDLGT', 3, '2007-01-15', 6.00, 'Dat'),
    ('K1102', 'THDC', 1, '2006-05-20', 5.00, 'Dat'),
    ('K1102', 'CTRR', 1, '2006-05-13', 7.00, 'Dat'),

    ('K1103', 'CSDL', 1, '2006-07-20', 3.50, 'Khong Dat'),
    ('K1103', 'CSDL', 2, '2006-07-27', 8.25, 'Dat'),
    ('K1103', 'CTDLGT', 1, '2006-12-28', 7.00, 'Dat'),
    ('K1103', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
    ('K1103', 'CTRR', 1, '2006-05-13', 6.50, 'Dat'),

    ('K1104', 'CSDL', 1, '2006-07-20', 3.75, 'Khong Dat'),
    ('K1104', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
    ('K1104', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
    ('K1104', 'CTRR', 1, '2006-05-13', 4.00, 'Khong Dat'),
    ('K1104', 'CTRR', 2, '2006-05-20', 3.50, 'Khong Dat'),
    ('K1104', 'CTRR', 3, '2006-06-30', 4.00, 'Khong Dat'),

    ('K1201', 'CSDL', 1, '2006-07-20', 6.00, 'Dat'),
    ('K1201', 'CTDLGT', 1, '2006-12-28', 5.00, 'Dat'),
    ('K1201', 'THDC', 1, '2006-05-20', 8.50, 'Dat'),
    ('K1201', 'CTRR', 1, '2006-05-13', 9.00, 'Dat'),

    ('K1202', 'CSDL', 1, '2006-07-20', 8.00, 'Dat'),
    ('K1202', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
    ('K1202', 'CTDLGT', 2, '2007-01-05', 5.00, 'Dat'),
    ('K1202', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
    ('K1202', 'THDC', 2, '2006-05-27', 4.00, 'Khong Dat'),
    ('K1202', 'CTRR', 1, '2006-05-13', 3.00, 'Khong Dat'),
    ('K1202', 'CTRR', 2, '2006-05-20', 4.00, 'Khong Dat'),
    ('K1202', 'CTRR', 3, '2006-06-30', 6.25, 'Dat'),

    ('K1203', 'CSDL', 1, '2006-07-20', 9.25, 'Dat'),
    ('K1203', 'CTDLGT', 1, '2006-12-28', 9.50, 'Dat'),
    ('K1203', 'THDC', 1, '2006-05-20', 10.00, 'Dat'),
    ('K1203', 'CTRR', 1, '2006-05-13', 10.00, 'Dat'),

    ('K1204', 'CSDL', 1, '2006-07-20', 8.50, 'Dat'),
    ('K1204', 'CTDLGT', 1, '2006-12-28', 6.75, 'Dat'),
    ('K1204', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
    ('K1204', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),

    ('K1301', 'CSDL', 1, '2006-12-20', 4.25, 'Khong Dat'),
    ('K1301', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
    ('K1301', 'THDC', 1, '2006-05-20', 7.75, 'Dat'),
    ('K1301', 'CTRR', 1, '2006-05-13', 8.00, 'Dat'),

    ('K1302', 'CSDL', 1, '2006-12-20', 6.75, 'Dat'),
    ('K1302', 'CTDLGT', 1, '2006-07-25', 5.00, 'Dat'),
    ('K1302', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
    ('K1302', 'CTRR', 1, '2006-05-13', 8.50, 'Dat'),

    ('K1303', 'CSDL', 1, '2006-12-20', 4.00, 'Khong Dat'),
    ('K1303', 'CTDLGT', 1, '2006-07-25', 4.50, 'Khong Dat'),
    ('K1303', 'CTDLGT', 2, '2006-08-07', 4.00, 'Khong Dat'),
    ('K1303', 'CTDLGT', 3, '2006-08-15', 4.25, 'Khong Dat'),
    ('K1303', 'THDC', 1, '2006-05-20', 4.50, 'Khong Dat'),
    ('K1303', 'CTRR', 1, '2006-05-13', 3.25, 'Khong Dat'),
    ('K1303', 'CTRR', 2, '2006-05-20', 5.00, 'Dat'),

    ('K1304', 'CSDL', 1, '2006-12-20', 7.75, 'Dat'),
    ('K1304', 'CTDLGT', 1, '2006-07-25', 9.75, 'Dat'),
    ('K1304', 'THDC', 1, '2006-05-20', 5.50, 'Dat'),
    ('K1304', 'CTRR', 1, '2006-05-13', 5.00, 'Dat'),

    ('K1305', 'CSDL', 1, '2006-12-20', 9.25, 'Dat'),
    ('K1305', 'CTDLGT', 1, '2006-07-25', 10.00, 'Dat'),
    ('K1305', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
    ('K1305', 'CTRR', 1, '2006-05-13', 10.00, 'Dat');


--- I. Data Definition Language



--- II. Data Manipulation Language


--- III. QUERY

-- 1.	In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT MAHV, HO || ' ' || TEN AS HOTEN, NGSINH, MALOP
FROM HOCVIEN

-- 2.   In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
SELECT k.MAHV, h.HO || ' ' || h.TEN AS HOTEN, h.NGSINH, k.DIEM
FROM KETQUATHI k
	INNER JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CTRR' AND h.MALOP = 'K12'
ORDER BY h.TEN ASC, h.HO ASC


-- 3.	In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT H.MAHV, h.HO || ' ' || h.TEN AS HOTEN, MAMH
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON h.MAHV = K.MAHV
WHERE LANTHI = 1 AND KQUA = 'Dat'


-- 4.	In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT h.MAHV, h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV
WHERE h.MALOP = 'K11' AND k.MAMH = 'CTRR' AND k.KQUA = 'Khong Dat' AND k.LANTHI = 1


-- 5.	* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
SELECT DISTINCT(h.MAHV), h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV
WHERE h.MALOP ILIKE 'K%' AND k.MAMH = 'CTRR' AND h.MAHV NOT IN (
	SELECT k1.MAHV
	FROM KETQUATHI k1
	WHERE k1.KQUA = 'Dat' AND k1.MAMH = 'CTRR'
) 


-- 6.	Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT(m.MAMH), m.TENMH
FROM GIAOVIEN g
	INNER JOIN GIANGDAY gd ON g.MAGV = gd.MAGV
	INNER JOIN MONHOC m ON m.MAMH = gd.MAMH
WHERE g.HOTEN = 'Tran Tam Thanh' AND gd.HOCKY = 1 AND gd.NAM = 2006


-- 7.	Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT (m.MAMH), m.TENMH
FROM MONHOC m
	INNER JOIN GIANGDAY gd ON m.MAMH = gd.MAMH
WHERE gd.HOCKY = 1 AND gd.NAM = 2006 AND gd.MAGV IN (
	SELECT l.MAGVCN
	FROM LOP l
	WHERE l.MALOP = 'K11'
)


-- 8.	Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co so du lieu”.
SELECT DISTINCT (h.MAHV), h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN LOP l ON l.TRGLOP = h.MAHV
	INNER JOIN GIANGDAY gd ON gd.MALOP = l.MALOP
	INNER JOIN GIAOVIEN gv ON gv.MAGV = gd.MAGV
	INNER JOIN MONHOC m ON m.MAMH = gd.MAMH
WHERE gv.HOTEN = 'Nguyen To Lan' AND m.TENMH = 'Co so du lieu'


-- 9.	In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co so du lieu”.
SELECT DISTINCT(m.MAMH), m.TENMH
FROM MONHOC m
WHERE m.MAMH IN (
	SELECT d.MAMH_TRUOC
	FROM DIEUKIEN d
		INNER JOIN MONHOC m1 ON m1.MAMH = d.MAMH
	WHERE m1.TENMH = 'Co so du lieu'
)


-- 10.	Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT m.MAMH, m.TENMH
FROM MONHOC m
WHERE m.MAMH IN (
	SELECT d.MAMH
	FROM DIEUKIEN d
		INNER JOIN MONHOC m1 ON m1.MAMH = d.MAMH_TRUOC
	WHERE m1.TENMH = 'Cau truc roi rac'
)


-- 11.	Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT gv.MAGV, gv.HOTEN
FROM GIAOVIEN gv
WHERE gv.MAGV IN (
	SELECT MAGV
	FROM GIANGDAY
	WHERE MAMH = 'CTRR' AND MALOP = 'K11' AND HOCKY = 1 AND NAM = 2006
)
INTERSECT
SELECT gv.MAGV, gv.HOTEN
FROM GIAOVIEN gv
WHERE gv.MAGV IN (
	SELECT MAGV
	FROM GIANGDAY
	WHERE MAMH = 'CTRR' AND MALOP = 'K12' AND HOCKY = 1 AND NAM = 2006
)


-- 12.	Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
SELECT h.MAHV, h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON k.MAHV = h.MAHV
WHERE k.LANTHI = 1 AND k.KQUA = 'Khong Dat' AND k.MAMH = 'CSDL' AND k.LANTHI = (
	SELECT MAX(LANTHI)
	FROM KETQUATHI k1 
	WHERE k1.MAHV = k.MAHV AND k1.MAMH = K.MAMH
)


-- 13.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT MAGV, HOTEN
FROM GIAOVIEN
EXCEPT
SELECT g.MAGV, g.HOTEN
FROM GIAOVIEN g
	INNER JOIN GIANGDAY gd ON gd.MAGV = g.MAGV


-- 14.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT *
FROM GIAOVIEN g
WHERE MAKHOA NOT IN (
	SELECT mh.MAKHOA
	FROM GIAOVIEN g1
		INNER JOIN GIANGDAY gd ON gd.MAGV = g1.MAGV
		INNER JOIN MONHOC mh ON mh.MAMH = gd.MAMH
	WHERE g1.MAGV = g.MAGV
)


-- 15.	Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON k.MAHV = h.MAHV
WHERE h.MALOP = 'K11' AND LANTHI = 3 AND KQUA = 'Khong Dat'
UNION
SELECT h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON k.MAHV = h.MAHV
WHERE h.MALOP = 'K11' AND LANTHI = 2 AND MAMH = 'CTRR' AND DIEM = 5


-- 16.	Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT g.MAGV, g.HOTEN
FROM GIAOVIEN g
	INNER JOIN GIANGDAY gd ON gd.MAGV = g.MAGV
WHERE gd.MAMH = 'CTRR'
GROUP BY g.MAGV, gd.HOCKY, gd.NAM
HAVING COUNT(*) >= 2


-- 17.	Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT h.MAHV, k.DIEM, k.LANTHI
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CSDL' AND LANTHI = (
	SELECT MAX(LANTHI)
	FROM KETQUATHI k2
	WHERE k2.MAHV = h.MAHV
	GROUP BY k2.MAHV
)


-- 18.	Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT h.MAHV, h.HO || ' ' || h.TEN AS HOTEN, MAX(DIEM)
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CSDL'
GROUP BY h.MAHV


-- 19.	Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (
	SELECT MIN(NGTLAP)
	FROM KHOA
)


-- 20.	Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(*) AS SOGV
FROM GIAOVIEN
WHERE HOCHAM = 'GS' OR HOCHAM = 'PGS'


-- 21.	Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA, HOCVI, COUNT(*) AS SL
FROM GIAOVIEN
GROUP BY MAKHOA, HOCVI


-- 22.	Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MAMH, KQUA, COUNT(*)
FROM KETQUATHI
GROUP BY MAMH, KQUA


-- 23.	Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT DISTINCT(g.MAGV), g.HOTEN
FROM GIAOVIEN g
	INNER JOIN GIANGDAY gd ON gd.MAGV = g.MAGV
	INNER JOIN LOP l ON l.MAGVCN = g.MAGV
WHERE gd.MALOP = l.MALOP

-- 24.	Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT h.MAHV, h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN LOP l ON l.TRGLOP = h.MAHV
WHERE l.SISO IN (
	SELECT MAX(SISO)
	FROM LOP
)


-- 25.	* Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT hv.HO, hv.TEN
FROM HOCVIEN hv
INNER JOIN LOP l ON l.TRGLOP = hv.MAHV
LEFT JOIN (
    SELECT MAHV, MAMH
    FROM KETQUATHI
    GROUP BY MAHV, MAMH
    HAVING COUNT(*) = COUNT(
        CASE 
			WHEN KQUA = 'Khong Dat' THEN 1 
		END
    )
) T ON T.MAHV = hv.MAHV
GROUP BY hv.MAHV, hv.HO, hv.TEN
HAVING COUNT(T.MAMH) <= 3;

-- 26.	Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT h.MAHV, h.HO || ' ' || h.TEN AS HOTEN
FROM HOCVIEN h
	INNER JOIN KETQUATHI k ON k.MAHV = h.MAHV
WHERE DIEM >= 9 AND DIEM <= 10
GROUP BY h.MAHV
HAVING COUNT(*) = (
	SELECT COUNT(*) AS TONGDIEM
	FROM KETQUATHI
	WHERE DIEM >= 9 AND DIEM <= 10
	GROUP BY MAHV
	ORDER BY TONGDIEM DESC
	LIMIT 1
)


-- 27.	Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT T.MALOP, MAX(MAXDIEM)
FROM (
	SELECT h.MALOP, COUNT(*) AS MAXDIEM
	FROM KETQUATHI k
		INNER JOIN HOCVIEN h ON h.MAHV = k.MAHV
	WHERE DIEM >= 9 AND DIEM <= 10
	GROUP BY k.MAHV, h.MALOP
	ORDER BY MAXDIEM DESC
) AS T
GROUP BY T.MALOP


SELECT k1.MAHV, h1.MALOP, COUNT(*)
FROM HOCVIEN h1
	INNER JOIN KETQUATHI k1 ON k1.MAHV = h1.MAHV
	INNER JOIN LOP l1 ON l1.MALOP = h1.MALOP
WHERE DIEM >= 9 AND DIEM <= 10
GROUP BY k1.MAHV, h1.MALOP



SELECT h.MAHV, h.HO || ' ' || h.TEN AS HOTEN, STU.MALOP, TONGDIEM
FROM (
	SELECT k1.MAHV, h1.MALOP, COUNT(*) TONGDIEM
	FROM HOCVIEN h1
		INNER JOIN KETQUATHI k1 ON k1.MAHV = h1.MAHV
		INNER JOIN LOP l1 ON l1.MALOP = h1.MALOP
	WHERE DIEM >= 9 AND DIEM <= 10
	GROUP BY k1.MAHV, h1.MALOP
) AS STU, (
	SELECT T.MALOP, MAX(MAXDIEM)
	FROM (
		SELECT h.MALOP, COUNT(*) AS MAXDIEM
		FROM KETQUATHI k
			INNER JOIN HOCVIEN h ON h.MAHV = k.MAHV
		WHERE DIEM >= 9 AND DIEM <= 10
		GROUP BY k.MAHV, h.MALOP
		ORDER BY MAXDIEM DESC
	) AS T
	GROUP BY T.MALOP
) AS SCORE, HOCVIEN h
WHERE SCORE.MALOP = STU.MALOP
	AND SCORE.MAX = STU.TONGDIEM
	AND h.MAHV = STU.MAHV


-- 28.	Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT g.MAGV, g.HOTEN, gd.HOCKY, gd.NAM, COUNT(gd.MAMH) AS SLMON, COUNT(gd.MALOP) AS SLLOP
FROM GIAOVIEN g
	INNER JOIN GIANGDAY gd ON gd.MAGV = g.MAGV
GROUP BY g.MAGV, g.HOTEN, gd.HOCKY, gd.NAM


-- 29.	Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.



-- 30.	Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.

-- 31.	Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).

-- 32.	* Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).

-- 33.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).

-- 34.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt  (chỉ xét lần thi sau cùng).

-- 35.	** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).











