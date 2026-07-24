CREATE TABLE khach_hang (
	makh CHAR(4) PRIMARY KEY,
	hoten VARCHAR(40),
	dchi VARCHAR(50),
	sodt VARCHAR(20),
	ngsinh TIMESTAMP,
	doanhso DECIMAL,
	ngdk TIMESTAMP
)

CREATE TABLE nhan_vien (
	manv CHAR(4) PRIMARY KEY,
	hoten VARCHAR(40),
	sodt VARCHAR(20),
	ngvl TIMESTAMP
)

CREATE TABLE san_pham (
	masp CHAR(4) PRIMARY KEY,
	tensp VARCHAR(40),
	dvt VARCHAR(20),
	nuocsx VARCHAR(40),
	gia DECIMAL
)

CREATE TABLE hoa_don (
	sohd INT PRIMARY KEY,
	nghd TIMESTAMP,
	makh CHAR(4) REFERENCES khach_hang(makh),
	manv CHAR(4) REFERENCES nhan_vien(mavn),
	trigia	DECIMAL
)

CREATE TABLE cthd (
	sohd INT REFERENCES hoa_don(sohd),
	masp CHAR(4) REFERENCES san_pham(masp),
	sl INT,
	PRIMARY KEY (sohd, masp)
)

-- I.

-- CAU 2
ALTER TABLE san_pham ADD COLUMN ghichu VARCHAR(20)

-- CAU 3
ALTER TABLE khach_hang ADD COLUMN loaikh INT

-- CAU 4
ALTER TABLE san_pham ALTER COLUMN ghichu TYPE VARCHAR(100)

-- CAU 5
ALTER TABLE san_pham DROP COLUMN ghichu

-- CAU 6
ALTER TABLE khach_hang ALTER COLUMN loaikh TYPE VARCHAR(20)

-- CAU 7
ALTER TABLE san_pham ADD CONSTRAINT chk_dvt CHECK (dvt IN ('cay', 'hop', 'cai', 'quyen', 'chuc'))

-- CAU 8
ALTER TABLE san_pham ADD CONSTRAINT chk_gia CHECK (gia >= 500)

-- CAU 9
ALTER TABLE cthd ADD CONSTRAINT cthd_chk_sl CHECK (sl>=1)

-- CAU 10
ALTER TABLE khach_hang ADD CONSTRAINT kh_chk_ngdk CHECK (ngdk > ngsinh)

-- II.
-- CAU 1
INSERT INTO nhan_vien
VALUES 
	('NV01','Nguyen Nhu Nhut', '0927345678','2006-04-13'),
	('NV02','Le Thi Phi Yen', '0987567390','2006-04-21'),
	('NV03','Nguyen Van B', '0997047382','2006-04-27'),
	('NV04','Ngo Thanh Tuan', '0913758498','2006-06-24'),
	('NV05','Nguyen Thi Truc Thanh', '0918590387','2006-07-27')

-- DELETE FROM khach_hang

INSERT INTO khach_hang
VALUES
	('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','1960-10-22',13060000,'2006-07-22'),
	('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 280000, '2006-07-30'),
	('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-06-12', 3860000, '2006-08-05'),
	('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', 250000, '2006-10-02'),
	('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-03-10', 21000, '2006-10-28'),
	('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', 915000, '2006-11-24'),
	('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-04-06', 12500, '2006-12-01'),
	('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-01-10', 365000, '2006-12-13'),
	('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', 70000, '2007-01-14'),
	('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-02', 67500, '2007-01-16');

INSERT INTO san_pham (masp, tensp, dvt, nuocsx, gia)
VALUES
	('BC01', 'But chi', 'cay', 'Singapore', 3000),
	('BC02', 'But chi', 'cay', 'Singapore', 5000),
	('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
	('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
	('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
	('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
	('BB03', 'But bi', 'hop', 'Thai Lan', 100000),
	('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
	('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
	('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
	('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
	('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
	('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
	('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000),
	('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
	('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
	('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
	('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
	('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
	('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
	('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
	('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
	('ST09', 'But long', 'cay', 'Viet Nam', 5000),
	('ST10', 'But long', 'cay', 'Trung Quoc', 7000);

INSERT INTO hoa_don (sohd, nghd, makh, manv, trigia)
VALUES
	(1001, '2006-07-23', 'KH01', 'NV01', 320000),
	(1002, '2006-08-12', 'KH01', 'NV02', 840000),
	(1003, '2006-08-23', 'KH02', 'NV01', 100000),
	(1004, '2006-09-01', 'KH02', 'NV01', 180000),
	(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
	(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
	(1007, '2006-10-28', 'KH03', 'NV03', 510000),
	(1008, '2006-10-28', 'KH01', 'NV03', 440000),
	(1009, '2006-10-28', 'KH03', 'NV04', 200000),
	(1010, '2006-11-01', 'KH01', 'NV01', 5200000),
	(1011, '2006-11-04', 'KH04', 'NV03', 250000),
	(1012, '2006-11-30', 'KH05', 'NV03', 21000),
	(1013, '2006-12-12', 'KH06', 'NV01', 5000),
	(1014, '2006-12-31', 'KH03', 'NV02', 3150000),
	(1015, '2007-01-01', 'KH06', 'NV01', 910000),
	(1016, '2007-01-01', 'KH07', 'NV02', 12500),
	(1017, '2007-01-02', 'KH08', 'NV03', 35000),
	(1018, '2007-01-13', 'KH08', 'NV03', 330000),
	(1019, '2007-01-13', 'KH01', 'NV03', 30000),
	(1020, '2007-01-14', 'KH09', 'NV04', 70000),
	(1021, '2007-01-16', 'KH10', 'NV03', 67500),
	(1022, '2007-01-16', NULL, 'NV03', 7000),
	(1023, '2007-01-17', NULL, 'NV01', 330000);

INSERT INTO cthd (sohd, masp, sl)
VALUES
	(1001, 'TV02', 10),
	(1001, 'ST01', 5),
	(1001, 'BC01', 5),
	(1001, 'BC02', 10),
	(1001, 'ST08', 10),
	(1002, 'BC04', 20),
	(1002, 'BB01', 20),
	(1002, 'BB02', 20),
	(1003, 'BB03', 10),
	(1004, 'TV01', 20),
	(1004, 'TV02', 10),
	(1004, 'TV03', 10),
	(1004, 'TV04', 10),
	(1005, 'TV05', 50),
	(1005, 'TV06', 50),
	(1006, 'TV07', 20),
	(1006, 'ST01', 30),
	(1006, 'ST02', 10),
	(1007, 'ST03', 10),
	(1008, 'ST04', 8),
	(1009, 'ST05', 10),
	(1010, 'TV07', 50),
	(1010, 'ST07', 50),
	(1010, 'ST08', 100),
	(1010, 'ST04', 50),
	(1010, 'TV03', 100),
	(1011, 'ST06', 50),
	(1012, 'ST07', 3),
	(1013, 'ST08', 5),
	(1014, 'BC02', 80),
	(1014, 'BB02', 100),
	(1014, 'BC04', 60),
	(1014, 'BB01', 50),
	(1015, 'BB02', 30),
	(1015, 'BB03', 7),
	(1016, 'TV01', 5),
	(1017, 'TV02', 1),
	(1017, 'TV03', 1),
	(1017, 'TV04', 5),
	(1018, 'ST04', 6),
	(1019, 'ST05', 1),
	(1019, 'ST06', 2),
	(1020, 'ST07', 10),
	(1021, 'ST08', 5),
	(1021, 'TV01', 7),
	(1021, 'TV02', 10),
	(1022, 'ST07', 1),
	(1023, 'ST04', 6);

-- CAU 2
CREATE TABLE san_pham1 AS
SELECT * FROM san_pham

CREATE TABLE khach_hang1 AS
SELECT * FROM khach_hang

-- CAU 3
UPDATE san_pham1
SET gia = gia*1.05
WHERE nuocsx = 'Thai Lan'

-- CAU 4
UPDATE san_pham1
SET gia = gia * 0.95
WHERE nuocsx = 'Trung Quoc' AND gia <= 10000

-- CAU 5
UPDATE khach_hang1
SET loaikh = 'Vip'
WHERE ngdk < '2007-01-01' OR (ngdk >= '2007-01-01' AND doanhso>=2000000)

-- III.
-- CAU 1
SELECT masp, tensp
FROM san_pham 
WHERE nuocsx = 'Trung Quoc'

-- CAU 2
SELECT masp, tensp
FROM san_pham
WHERE dvt = 'cay' OR dvt = 'quyen'

-- CAU 3
SELECT masp, tensp
FROM san_pham
WHERE masp LIKE 'B%01'

-- CAU 4
SELECT masp, tensp
FROM san_pham
WHERE nuocsx = 'Trung Quoc'
	AND (gia >= 30000 AND gia <= 40000)

-- CAU 5
SELECT masp, tensp
FROM san_pham
WHERE (nuocsx = 'Trung Quoc' OR nuocsx = 'Thai Lan')
	AND (gia >= 30000 AND gia <= 40000)

-- CAU 6
SELECT sohd, trigia
FROM hoa_don
WHERE nghd = '2007-01-01' OR nghd = '2007-01-02'

-- CAU 7
SELECT *
FROM hoa_don
WHERE EXTRACT(MONTH FROM nghd) = 1 
  AND EXTRACT(YEAR FROM nghd) = 2007
ORDER BY nghd ASC, trigia DESC

-- CAU 8
SELECT k.makh, hoten
FROM khach_hang k, hoa_don h
WHERE k.makh = h.makh AND nghd = '2007-01-01'

-- CAU 9
SELECT *
FROM nhan_vien n, hoa_don h
WHERE n.manv = h.manv AND hoten='Nguyen Van B' AND nghd = '2006-10-28'

-- CAU 10
SELECT *
FROM khach_hang k, hoa_don h, cthd c, san_pham s
WHERE k.makh = h.makh AND h.sohd = c.sohd AND c.masp = s.masp
	AND k.hoten='Nguyen Van A' AND EXTRACT(MONTH from h.nghd)=10 AND EXTRACT(YEAR from h.nghd)=2006

-- CAU 11
SELECT *
FROM hoa_don h
	INNER JOIN cthd c ON h.sohd = c.sohd
WHERE c.masp = 'BB01' OR c.masp = 'BB02'

-- CAU 12
SELECT *
FROM hoa_don h
	INNER JOIN cthd c ON h.sohd = c.sohd
WHERE (c.masp = 'BB01' OR c.masp = 'BB02')
	AND c.sl >=10 AND c.sl <=20

-- CAU 13
SELECT sohd 
FROM cthd 
WHERE masp = 'BB01' AND sl BETWEEN 10 AND 20

INTERSECT

SELECT sohd 
FROM cthd 
WHERE masp = 'BB02' AND sl BETWEEN 10 AND 20;

-- CAU 14
SELECT s.masp, s.tensp
FROM san_pham s
WHERE nuocsx = 'Trung Quoc'

UNION

SELECT s.masp, s.tensp
FROM san_pham s
	INNER JOIN cthd c ON c.masp = s.masp
	INNER JOIN hoa_don h ON h.sohd = c.sohd
WHERE nghd = '2007-01-01'

-- CAU 15
SELECT masp, tensp FROM san_pham

EXCEPT

SELECT s.masp, s.tensp
FROM san_pham s
	INNER JOIN cthd c ON c.masp = s.masp

-- CAU 16
SELECT masp, tensp FROM san_pham

EXCEPT

SELECT s.masp, s.tensp
FROM san_pham s
	INNER JOIN cthd c ON c.masp = s.masp
	INNER JOIN hoa_don h ON c.sohd = h.sohd
WHERE EXTRACT(YEAR FROM h.nghd) = 2006

-- CAU 17
SELECT masp, tensp FROM san_pham
WHERE nuocsx = 'Trung Quoc'

EXCEPT

SELECT s.masp, s.tensp
FROM san_pham s
	INNER JOIN cthd c ON c.masp = s.masp
	INNER JOIN hoa_don h ON c.sohd = h.sohd
WHERE EXTRACT(YEAR FROM h.nghd) = 2006

-- CAU 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
--> Tìm số hoá đơn KHÔNG CÓ sản phẩm của Singapore nào mà hoá đơn đó KHÔNG MUA
SELECT h.sohd
FROM hoa_don h
WHERE NOT EXISTS (
	SELECT *
	FROM san_pham s
	WHERE s.nuocsx = 'Singapore'
		AND NOT EXISTS (
			SELECT *
			FROM cthd c
			WHERE c.sohd = h.sohd
				AND c.masp = s.masp
		)
)

-- CAU 19
SELECT h.sohd
FROM hoa_don h
WHERE EXTRACT(YEAR FROM h.nghd) = 2006 
	AND NOT EXISTS (
		SELECT *
		FROM san_pham s
		WHERE s.nuocsx = 'Singapore'
			AND NOT EXISTS (
				SELECT *
				FROM cthd c
				WHERE c.sohd = h.sohd
					AND c.masp = s.masp
			)
)

-- CAU 20
SELECT COUNT(*) as sl_hd
FROM hoa_don h
WHERE makh IS NULL

-- CAU 21
SELECT COUNT (DISTINCT c.masp) AS sl_sp
FROM hoa_don h
	INNER JOIN cthd c ON c.sohd = h.sohd
WHERE EXTRACT(YEAR FROM h.nghd) = 2006

-- CAU 22
SELECT MAX(h.trigia) as max_tg, MIN(h.trigia) as min_tg
FROM hoa_don h

-- CAU 23
SELECT AVG(h.trigia) as avg_trigia
FROM hoa_don h
WHERE EXTRACT(YEAR FROM h.nghd) = 2006

-- CAU 24
SELECT SUM(h.trigia) as sum_trigia
FROM hoa_don h
WHERE EXTRACT(YEAR FROM h.nghd) = 2006

-- CAU 25
SELECT *
FROM hoa_don h
WHERE EXTRACT(YEAR FROM h.nghd) = 2006
ORDER BY trigia DESC
LIMIT 1

-- CAU 26
SELECT hoten
FROM khach_hang k
	INNER JOIN hoa_don h ON h.makh = k.makh
WHERE EXTRACT(YEAR FROM h.nghd) = 2006
ORDER BY trigia DESC
LIMIT 1

-- CAU 27
SELECT k.makh, hoten
FROM khach_hang k
	INNER JOIN hoa_don h ON k.makh = h.makh
ORDER BY h.trigia DESC
LIMIT 3

-- CAU 28
SELECT masp, tensp
FROM san_pham s
WHERE gia IN (
	SELECT DISTINCT gia
	FROM san_pham
	ORDER BY gia DESC
	LIMIT 3
)

-- CAU 29
SELECT s.masp, s.tensp
FROM san_pham s
WHERE s.nuocsx = 'Thai Lan'
	AND s.gia IN (
		SELECT DISTINCT s2.gia
		FROM san_pham s2
		ORDER BY s2.gia DESC
		LIMIT 3
	)

-- CAU 30
SELECT s.masp, s.tensp
FROM san_pham s
WHERE s.nuocsx = 'Trung Quoc'
	AND s.gia IN (
		SELECT DISTINCT s2.gia
		FROM san_pham s2
		WHERE s2.nuocsx = 'Trung Quoc'
		ORDER BY s2.gia DESC
		LIMIT 3
	)

-- CAU 31
SELECT *
FROM khach_hang k
WHERE k.doanhso IN (
	SELECT DISTINCT doanhso 
	FROM khach_hang k1
	ORDER BY doanhso DESC
	LIMIT 3
)
ORDER BY k.doanhso DESC

-- CAU 32
SELECT COUNT(*) AS tong_sp
FROM san_pham
WHERE nuocsx = 'Trung Quoc'

-- CAU 33
SELECT nuocsx, COUNT(*) AS tong_sp
FROM san_pham
GROUP BY nuocsx

-- CAU 34
SELECT nuocsx, MAX(gia) AS max_gia, MIN(gia) AS min_gia
FROM san_pham
GROUP BY nuocsx

-- CAU 35
SELECT nghd, SUM(trigia) AS doanhthu
FROM hoa_don h
GROUP BY nghd

-- CAU 36
SELECT c.masp, SUM(c.sl)
FROM hoa_don h
	INNER JOIN cthd c ON c.sohd = h.sohd
WHERE EXTRACT(MONTH FROM h.nghd) = 10
	AND EXTRACT (YEAR FROM h.nghd) = 2006
GROUP BY c.masp

-- CAU 37





