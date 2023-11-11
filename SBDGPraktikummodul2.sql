CREATE TABLE pelanggan(
	p_id CHAR(16) PRIMARY KEY,
	p_nama VARCHAR(60),
	p_no_telp VARCHAR(60),
	p_email VARCHAR(256),
	p_alamat VARCHAR(100)
);

CREATE TABLE mobil(
mb_vin CHAR(17) PRIMARY KEY,
mb_merk VARCHAR(20),
mb_tipe VARCHAR(30),
mb_tahun INT,
mb_warna VARCHAR(30),
mb_p_id CHAR(16),
FOREIGN KEY (mb_p_id) REFERENCES pelanggan(p_id) ON DELETE CASCADE
);

CREATE TABLE tiket_servis(
ts_id CHAR(8) PRIMARY KEY,
ts_deskripsi VARCHAR(400),
ts_komentar VARCHAR(400),
ts_waktu_masuk TIMESTAMP NULL DEFAULT NULL,
ts_waktu_keluar TIMESTAMP NULL DEFAULT NULL,
ts_p_id CHAR(16),
ts_mb_vin CHAR(17),
FOREIGN KEY (ts_p_id) REFERENCES pelanggan(p_id) ON DELETE CASCADE,
FOREIGN KEY (ts_mb_vin) REFERENCES mobil(mb_vin) ON DELETE CASCADE
);

CREATE TABLE suku_cadang_servis(
	scsv_ts_id CHAR(8),
	scsv_sc_id CHAR(7),
	PRIMARY KEY (scsv_ts_id, scsv_sc_id),
	FOREIGN KEY (scsv_ts_id) REFERENCES tiket_servis(ts_id) ON DELETE CASCADE,
	FOREIGN KEY (scsv_sc_id) REFERENCES suku_cadang(sc_id) ON DELETE CASCADE
);

CREATE TABLE suku_cadang(
	sc_id CHAR(7) PRIMARY KEY,
	sc_nama VARCHAR(120),
	sc_deskripsi VARCHAR(100)
);

CREATE TABLE mekanik_servis(
	mksv_mk_id CHAR(6),
	mksv_ts_id CHAR(8),
	PRIMARY KEY (mksv_mk_id, mksv_ts_id),
	FOREIGN KEY (mksv_mk_id ) REFERENCES mekanik(mk_id ) ON DELETE CASCADE,
	FOREIGN KEY (mksv_ts_id ) REFERENCES tiket_servis(ts_id ) ON DELETE CASCADE
);

CREATE TABLE mekanik(
	mk_id CHAR(6) PRIMARY KEY,
	mk_nama VARCHAR(60)
)

CREATE TABLE supplier(
	sp_id CHAR (6) PRIMARY KEY,
	sp_nama VARCHAR (60),
 	sp_no_telp VARCHAR (15),
	sp_email VARCHAR (256),
	sp_alamat VARCHAR (100)
)

RENAME TABLE mekanik TO pegawai

CREATE TABLE posisi(
	ps_id CHAR(6) NOT NULL PRIMARY KEY,
	ps_nama VARCHAR(15) NOT NULL
)

ALTER TABLE pegawai
ADD CONSTRAINT ps_mk_id FOREIGN KEY (ps_mk_id) REFERENCES posisi(ps_id) ON DELETE CASCADE;

DROP TABLE posisi

ALTER TABLE pegawai
ADD COLUMN mk_posisi VARCHAR(15);

INSERT INTO pelanggan (p_id, p_nama, p_no_telp, p_email, p_alamat) VALUES
('3225011201880002', 'Andy Williams', '62123456789', 'andy@gmail.com', 'Jl. Apel no 1'),
('3525010706950001', 'Marshall Paul', '621451871011', 'paulan@gmail.com', 'Jl. Jeruk no 12',),
('3525016005920002', 'Kazuya Tanaka', '62190129190', 'tanaka@gmail.com', 'Jl. JKT no 48'),
('3975311107780001', 'Budi Prutomo', '621545458901', 'NULL', 'Jl. Nanas no 45'),
('3098762307810002', 'Razai Ambudi', '621898989102', 'NULL', 'Jl. Mangga no 2');

INSERT INTO mobil (mb_vin, mb_merk, mb_tipe, mb_tahun, mb_warna, mb_p_id) VALUES
('JN8AZ1MW4BW678706', 'Nissan', 'Murano', '2011', 'biru', '3525010706950001'),
('2LMTJ8JP0GSJ00175', 'Lincoln', 'MKX', '2016', 'merah', '3525016005920002'),
('ZFF76ZHT3E0201920', 'Ferrari', 'Ferrari', '2014', 'merah', '3975311107780001'),
('1HGCP26359A157554', 'Honda', 'Accord', '2009', 'hitam', '3225011201880002'),
('5YJSA1DN5CFP01785', 'Tesla', 'Model S', '2012', 'putih', '3098762307810002');

INSERT INTO pegawai (mk_id, mk_nama, mk_posisi) VALUES
('MK0001', 'Walter Jones', 'mekanik'),
('MK0002', 'Kentaki Veraid', 'kasir'),
('MK0003', 'Leo', 'mekanik'),
('MK0004', 'Reyhand', 'Janita pencuci'),
('MK0005', 'Elizabeth Alexandra', 'mekanik');

INSERT INTO supplier (sp_id, sp_nama, sp_no_telp, sp_email, sp_alamat) VALUES
('SP0001', 'Indotrading', '6282283741247', 'indotrading@rocketmail.com', 'Jl. Bambu no 5'),
('SP0002', 'Jayasinda', '628227428238', 'Jayasinda@yahoo.com', 'Jl. Padi no 12'),
('SP0003', 'SAS Autoparts', '6282212382311', 'sasparts@gmail.com', 'Jl. Sorghum no 24');

INSERT INTO suku_cadang (sc_id, sc_nama, sc_deskripsi, sc_harga) VALUES
('SC00001', 'Damper', 'Damper Per Belakang Original', '800000.00'),
('SC00002','Coil Ignition','Coil Ignition Denso Jepang','550000.00'),
('SC00003','Selang Filter','Selang Filter Udara Original','560000.00'),
('SC00004','Bushing','Bushing Upper Arm Original','345000.00'),
('SC00005','Radiator Racing','Radiator Racing Kotorad Manual Diesel','6750000.00');

INSERT INTO tiket_servis (ts_id, ts_waktu_masuk, ts_waktu_keluar, ts_deskripsi, ts_komentar, ts_p_id, ts_mb_vin)
VALUES
('','','','','','',''),
('','','','','','',''),
('','','','','','',''),
('','','','','','',''),
('','','','','','','');