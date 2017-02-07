CREATE DATABASE perpustakaan_irsad;
USE perpustakaan_irsad;
CREATE TABLE tbl_buku (id int(11) primary key auto_increment, id_kategori int(11), id_rak int(11), id_penerbit int(11), id_pengarang int(11), id_petugas int(11), judul varchar(255), tgl_dibuat timestamp, tgl_diperbarui datetime );
CREATE TABLE tbl_kategori (id int(11) primary key auto_increment, nama varchar(50));
CREATE TABLE tbl_pengarang (id int(11) primary key auto_increment, nama varchar(50));
CREATE TABLE tbl_penerbit (id int(11) primary key auto_increment, nama varchar(50), alamat text, kontak varchar(20), email varchar(50), tgl_dibuat timestamp, tgl_diperbarui datetime);
CREATE TABLE tbl_rak (id int(11) primary key auto_increment, id_petugas int(11), nama varchar(5), tgl_dibuat timestamp, tgl_diperbarui date);
CREATE TABLE tbl_jumlah_buku (id int(11) primary key auto_increment, id_petugas int(11), jumlah_buku int(4), buku_dipinjam int(2), buku_tersedia int(4), tgl_dibuat timestamp,  tgl_diperbarui date);
CREATE TABLE tbl_peminjaman (id int(11) primary key auto_increment, id_anggota int(11), id_petugas int(11), tgl_peminjaman date, tgl_batas_pinjam date);
CREATE TABLE tbl_buku_dipinjam (id_peminjaman int(11), id_buku int(11));
CREATE TABLE tbl_pengembalian (id int(11) primary key auto_increment, id_peminjaman int(11), id_petugas int(11), keterangan text);
CREATE TABLE tbl_buku_kembali (id int(11) primary key auto_increment, id_pengembalian int(11), id_buku int(11));
CREATE TABLE tbl_anggota (id int(11) primary key auto_increment, id_petugas int(11), nama varchar(255), tgl_lahir date, jenis_kelamin varchar(12), alamat text, kontak varchar(20), tgl_daftar timestamp, batas_berlaku date, tgl_diperbarui date);
CREATE TABLE tbl_petugas (id int(11) primary key auto_increment, nama varchar(255), jenis_kelamin varchar(12), kontak varchar(20), username varchar(20), password varchar(20), tgl_dibuat timestamp, tgl_diperbarui date);
CREATE TABLE tbl_jenis_denda (id int(11) primary key auto_increment, jenis_denda varchar(50));
CREATE TABLE tbl_denda (id_pengembalian int(11), id_denda_item int(11), id_jenis_denda int(11), total_denda int(10));
CREATE TABLE tbl_denda_item (id int(11) primary key auto_increment, id_buku int(11), id_jenis_denda int(11), nominal int(10), keterangan text);
ALTER TABLE tbl_denda DROP COLUMN id_jenis_denda;

INSERT INTO tbl_petugas (nama, jenis_kelamin, kontak, username, password) VALUES ('Putu', 'Laki-laki', '08522162662', 'putu_satu', 'putuunderskorsatu');
INSERT INTO tbl_petugas (nama, jenis_kelamin, kontak, username, password) VALUES ('Mukidi', 'Laki-laki', '0274-773221', 'mukidi', 'lupa');
INSERT INTO tbl_petugas (nama, jenis_kelamin, kontak, username, password) VALUES ('Ani','Perempuan','08382122281', 'ani', 'aniyeah');
INSERT INTO tbl_petugas (nama, jenis_kelamin, kontak, username, password) VALUES ('Mariah', 'Perempuan','08211121991', 'mariah', 'bolukering');
INSERT INTO tbl_petugas (nama, jenis_kelamin, kontak, username, password) VALUES ('Salma', 'Perempuan', '08797881882', 'salma','salmarata');

 INSERT INTO tbl_kategori (nama) VALUES ('Arsitektur');
 INSERT INTO tbl_kategori (nama) VALUES ('Biografi');
 INSERT INTO tbl_kategori (nama) VALUES ('Hobi');
 INSERT INTO tbl_kategori (nama) VALUES ('Budaya');
 INSERT INTO tbl_kategori (nama) VALUES ('Psikologi');

 INSERT INTO tbl_pengarang (nama) VALUES ('Barnas Sumantri');
 INSERT INTO tbl_pengarang (nama) VALUES ('David Lomax');
 INSERT INTO tbl_pengarang (nama) VALUES ('Deborahann Smith');
 INSERT INTO tbl_pengarang (nama) VALUES ('Muhammad Wahyu M.N.');
 INSERT INTO tbl_pengarang (nama) VALUES ('Zainal A.Z.');

 INSERT INTO tbl_rak (id_petugas, nama) VALUES (2, 'A1');
 INSERT INTO tbl_rak (id_petugas, nama) VALUES (2, 'A2');
 INSERT INTO tbl_rak (id_petugas, nama) VALUES (2, 'A3');
 INSERT INTO tbl_rak (id_petugas, nama) VALUES (1, 'A4');
 INSERT INTO tbl_rak (id_petugas, nama) VALUES (1,'B');

 ALTER TABLE tbl_penerbit ADD id_petugas int(11) AFTER id;
 ALTER TABLE tbl_buku ADD tahun_terbit year after judul;

 INSERT INTO tbl_penerbit (id_petugas, nama, alamat, kontak) VALUES (2, 'Gramedia Pustaka Utama', 'Gramedia Building, 2nd-3rd floor, Jl. Palmerah Barat No. 33-37 Jakarta Pusat', '(021)53677834');
 INSERT INTO tbl_penerbit (id_petugas, nama, alamat, kontak) VALUES (2, 'Penerbit Abdi Tandur', 'Jl. Kemiri Raya No. 68 RT 03/04 Rawa Lindung Pondok Cabe Udik Ciputat', '(021)7496733');
 INSERT INTO tbl_penerbit (id_petugas, nama, alamat, kontak) VALUES (2, 'Media Pressindo Group', 'Caturnunggal, Depok, Sleman Yogyakarta', '(0274)556043');
 INSERT INTO tbl_penerbit (id_petugas, nama, alamat, kontak) VALUES (2, 'Pustaka Pelajar', 'Jl. Celeban Timur UH, III/548, Tahunan, Umbulharjo, Kota Yogyakarta', '(0274)381542');
 INSERT INTO tbl_penerbit (id_petugas, nama, alamat, kontak) VALUES (2, 'Pustaka Jaya', 'Jl. Gumuruh No.51, Gumuruh, Batununggal, Kota Bandung', '(022)7321911');

UPDATE tbl_penerbit SET email='dinastindo@yahoo.com' where id=2;
UPDATE tbl_penerbit SET tgl_diperbarui=now() where id=2;

INSERT INTO tbl_buku (id_kategori, id_rak, id_penerbit, id_pengarang, id_petugas, judul, tahun_terbit) VALUES (5, 4, 2, 3, 4, 'Pekerjaan Sambilan', 1997);
INSERT INTO tbl_buku (id_kategori, id_rak, id_penerbit, id_pengarang, id_petugas, judul, tahun_terbit) VALUES (3, 2, 3, 4, 4, 'Teknik Dasar Main Catur', 2009);
INSERT INTO tbl_buku (id_kategori, id_rak, id_penerbit, id_pengarang, id_petugas, judul, tahun_terbit) VALUES (2, 1, 5, 2, 5, 'Tokoh-Tokoh Pencetak Uang', 1989);
INSERT INTO tbl_buku (id_kategori, id_rak, id_penerbit, id_pengarang, id_petugas, judul, tahun_terbit) VALUES (4, 3, 1, 1, 5, 'Himah Abadi: Nilai-Nilai Tradisional dalam Wayang', 1999);
INSERT INTO tbl_buku (id_kategori, id_rak, id_penerbit, id_pengarang, id_petugas, judul, tahun_terbit) VALUES (1, 5, 1, 5, 5, 'Rumah Idaman', 1999);

UPDATE tbl_buku SET id_penerbit=4 where id=4;
UPDATE tbl_buku SET judul='Hikmah Abadi: Nilai-Nilai Tradisional dalam Wayang' where id=4;

INSERT INTO tbl_anggota (id_petugas, nama, tgl_lahir, jenis_kelamin, alamat, tgl_daftar, batas_berlaku) VALUES (3, 'Ahmad Husen', '1999-08-29', 'Laki-laki', 'Jl. Penuh Perjuangan No.124 Bandung', now(), '2019-06-30');
INSERT INTO tbl_anggota (id_petugas, nama, tgl_lahir, jenis_kelamin, alamat, kontak, tgl_daftar, batas_berlaku) VALUES (3, 'Laras', '1998-01-30', 'Perempuan', 'Dsn. Cijambe Desa Sukasari Kecamatan Cilangka Bandung', '08992129991', now(), '2019-06-30');
INSERT INTO tbl_anggota (id_petugas, nama, tgl_lahir, jenis_kelamin, alamat, kontak, tgl_daftar, batas_berlaku) VALUES (3, 'Hana', '1998-12-12', 'Perempuan', 'Kp. Manggala Desa Murnisari Kecamatan Cireuteum Sukabumi', '082111221098', now(), '2019-06-30');
INSERT INTO tbl_anggota (id_petugas, nama, tgl_lahir, jenis_kelamin, alamat, kontak, tgl_daftar, batas_berlaku) VALUES (3, 'Kurnia', '1998-10-13', 'Laki-laki', 'Kp. Barubuka Desa Satusaja Kecamatan Karang Cianjur', '08382991899', now(), '2019-06-30');
INSERT INTO tbl_anggota (id_petugas, nama, tgl_lahir, jenis_kelamin, alamat, kontak, tgl_daftar, batas_berlaku) VALUES (3, 'Badu', '1998-11-01', 'Laki-laki', 'Jl. Kampung No.19299', '085352556771', now(), '2019-06-30');

ALTER TABLE tbl_jumlah_buku DROP id;
ALTER TABLE tbl_jumlah_buku ADD id_buku int(11) after id_petugas;

INSERT INTO tbl_peminjaman (id_anggota, id_petugas, tgl_peminjaman, tgl_batas_pinjam) VALUES (1, 1, now(), '2017-02-13');
INSERT INTO tbl_peminjaman (id_anggota, id_petugas, tgl_peminjaman, tgl_batas_pinjam) VALUES (2, 1, now(), '2017-02-13');
INSERT INTO tbl_peminjaman (id_anggota, id_petugas, tgl_peminjaman, tgl_batas_pinjam) VALUES (3, 2, '2017-02-06', '2017-02-13');
INSERT INTO tbl_peminjaman (id_anggota, id_petugas, tgl_peminjaman, tgl_batas_pinjam) VALUES (4, 2, '2017-02-06', '2017-02-14');
INSERT INTO tbl_peminjaman (id_anggota, id_petugas, tgl_peminjaman, tgl_batas_pinjam) VALUES (5, 3, '2017-02-07', '2017-02-15');

INSERT INTO tbl_buku_dipinjam (id_peminjaman, id_buku) VALUES (1,2);
INSERT INTO tbl_buku_dipinjam (id_peminjaman, id_buku) VALUES (1,3);
INSERT INTO tbl_buku_dipinjam (id_peminjaman, id_buku) VALUES (3, 3);
INSERT INTO tbl_buku_dipinjam (id_peminjaman, id_buku) VALUES (4, 1);
INSERT INTO tbl_buku_dipinjam (id_peminjaman, id_buku) VALUES (5, 2);
INSERT INTO tbl_buku_dipinjam (id_peminjaman, id_buku) VALUES (5, 4);

INSERT INTO tbl_jenis_denda (jenis_denda) VALUES ('Buku Hilang');
INSERT INTO tbl_jenis_denda (jenis_denda) VALUES ('Telat pengembalian');
INSERT INTO tbl_jenis_denda (jenis_denda) VALUES ('Sampul Sobek');

INSERT INTO tbl_jumlah_buku ( id_petugas, id_buku, jumlah_buku, buku_dipinjam, buku_tersedia) VALUES (1, 1, 5, 1, 4);
INSERT INTO tbl_jumlah_buku ( id_petugas, id_buku, jumlah_buku, buku_dipinjam, buku_tersedia) VALUES (1, 2, 6, 2, 4);
INSERT INTO tbl_jumlah_buku ( id_petugas, id_buku, jumlah_buku, buku_dipinjam, buku_tersedia) VALUES (1, 3, 7, 2, 5);
INSERT INTO tbl_jumlah_buku ( id_petugas, id_buku, jumlah_buku, buku_dipinjam, buku_tersedia) VALUES (1, 4, 5, 2, 3);
INSERT INTO tbl_jumlah_buku ( id_petugas, id_buku, jumlah_buku, buku_dipinjam, buku_tersedia) VALUES (1, 5, 6, 0, 6);
ALTER TABLE tbl_pengembalian ADD tgl_pengembalian date after id_petugas;
ALTER TABLE tbl_denda_item DROP PRIMARY KEY, CHANGE id id int(11);
UPDATE tbl_denda_item SET id=1 where id=2;
UPDATE tbl_denda_item SET id=3 WHERE id=4;
UPDATE tbl_denda_item SET id=4 WHERE id=5;
UPDATE tbl_denda_item SET id=5 WHERE id=6;
UPDATE tbl_denda_item SET id=5 WHERE id=7;

INSERT INTO tbl_pengembalian (id_peminjaman, id_petugas, tgl_pengembalian) VALUES (1, 2, '2017-02-16');
INSERT INTO tbl_pengembalian (id_peminjaman, id_petugas, tgl_pengembalian) VALUES (2, 2, '2017-02-16');
INSERT INTO tbl_pengembalian (id_peminjaman, id_petugas, tgl_pengembalian) VALUES (3, 3, '2017-02-17');
INSERT INTO tbl_pengembalian (id_peminjaman, id_petugas, tgl_pengembalian) VALUES (4, 3, '2017-02-17');
INSERT INTO tbl_pengembalian (id_peminjaman, id_petugas, tgl_pengembalian) VALUES (5, 3, '2017-02-17');

INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (1, 2);
INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (1, 3);
INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (2, 4);
INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (3, 3);
INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (4, 1);
INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (5, 2);
INSERT INTO tbl_buku_kembali (id_pengembalian, id_buku) VALUES (5, 4);

INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (1, 2, 2, 3000, 'Telat 3 hari');
INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (1, 3, 2, 3000, 'Telat 3 hari');
INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (2, 4, 2, 3000, 'Telat 3 hari');
INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (3, 3, 2, 4000, 'Telat 4 hari');
INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (4, 1, 2, 3000, 'Telat 3 hari');
INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (5, 2, 2, 2000, 'Telat 2 hari');
INSERT INTO tbl_denda_item (id, id_buku, id_jenis_denda, nominal, keterangan) VALUES (5, 4, 2, 2000, 'Telat 2 hari');

INSERT INTO tbl_denda (id_pengembalian, id_denda_item, total_denda) VALUES (1, 1, 6000);
INSERT INTO tbl_denda (id_pengembalian, id_denda_item, total_denda) VALUES (2, 2, 3000);
INSERT INTO tbl_denda (id_pengembalian, id_denda_item, total_denda) VALUES (3, 3, 4000);
INSERT INTO tbl_denda (id_pengembalian, id_denda_item, total_denda) VALUES (4, 4, 3000);
INSERT INTO tbl_denda (id_pengembalian, id_denda_item, total_denda) VALUES (5, 5, 4000);
