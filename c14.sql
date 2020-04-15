-- DAFTAR SYNTAX/COMMAND YANG SERING DIPAKAI:
-- membuat database baru : In SQLite, sqlite3 command is used to create a new SQLite database. You do not need to have any special privilege to create a database.
-- sqlite3 DatabaseName.db 
-- -- DATA Definiton language
-- CREATE : untuk membuat table baru, view of table, atau objek lainnya didalam database
-- ALTER : untuk modifikasi objek database seperti table.
-- DROP : deletes an entire table, a view of table or other object in the databases.

-- create each table for database
CREATE TABLE jurusan
(
    kode_jurusan VARCHAR(3) PRIMARY KEY NOT NULL,
    nama_jurusan VARCHAR(50) NOT NULL
);

INSERT INTO jurusan
    (kode_jurusan, nama_jurusan)
VALUES
    ('IF', 'Teknik Informatika'),
    ('BE', 'Rekayasa Hayati'),
    ('MA', 'Matematika'),
    ('TI', 'Teknik Industri');

CREATE TABLE mahasiswa
(
    nim TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(50) NOT NULL,
    alamat TEXT,
    kode_jurusan TEXT NOT NULL,
    nama_jurusan TEXT,
    FOREIGN KEY (kode_jurusan) REFERENCES jurusan (kode_jurusan),
    FOREIGN KEY (nama_jurusan) REFERENCES jurusan (nama)
);

INSERT INTO mahasiswa
    (nim, nama, alamat, kode_jurusan, nama_jurusan)
VALUES
    (11515001, 'Duma Doniagara Sambora','Jatinangor', 'IF','Teknik Informatika'),
    (11515002, 'Abdul Azis','Bekasi', 'IF','Teknik Informatika'),
    (11215003, 'Juang Arwafa Cita','Depok', 'BE','Rekayasa Hayati'),
    (11215004, 'Safira Kemala Dewi','Aceh', 'BE','Rekayasa Hayati'),
    (11315005, 'Monica Viola Purba','Medan', 'MA','Matematika');

CREATE TABLE dosen
(
    nip VARCHAR(10) PRIMARY KEY NOT NULL,
    nama VARCHAR(50) NOT NULL
);

INSERT INTO dosen
    (nip, nama)
VALUES
    ('001', 'Robert Manurung'),
    ('002', 'Muhammad Yusuf Abduh'),
    ('003', 'Inggriani Liem'),
    ('004', 'Khairul Hadi'),
    ('005', 'Turfa Auliarachman');

CREATE TABLE matakuliah
(
    kode_mk TEXT PRIMARY KEY NOT NULL,
    nama_mk TEXT NOT NULL,
    sks INTEGER NOT NULL
);


INSERT INTO matakuliah
    (kode_mk, nama_mk, sks)
VALUES
    ('IF001', 'Data Mining',5),
    ('IF002', 'Algoritma Pemrograman',4),
    ('IF003', 'Artificial Intelegence',3),
    ('KU001', 'Probabilitas Pemrograman',3),
    ('BE001', 'Sensor dan Instrumentasi Hayati',2),
    ('IF004', 'Arsitektur Database', 4),
    ('MA001', 'Pengolahan Data dan Informasi',5);

CREATE TABLE perkuliahan (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    nim TEXT NOT NULL,
    nip TEXT NOT NULL,
    mata_kuliah TEXT NOT NULL,
    nilai TEXT,
    FOREIGN KEY
(nim) REFERENCES mahasiswa
(nim),
    FOREIGN KEY
(nip) REFERENCES dosen
(nip),
    FOREIGN KEY
(mata_kuliah) REFERENCES mata_kuliah
(kode_mk) 
);

INSERT INTO perkuliahan
    (nim,nip,mata_kuliah,nilai)
VALUES
    (11515001, '003', 'IF001', 'A'), 
    (11515002, '003', 'IF001', 'B'),
    (11215003, '004', 'BE001', 'A'),
    (11215004, '003', 'IF001', 'B'),
    (11515002, '005', 'IF002', 'C'),
    (11215004, '005', 'IF002', 'D'),
    (11315005, '002', 'IF003', 'E'),
    (11515001, '005', 'IF002', 'A'), 
    (11515001, '002', 'IF004', 'A'),
    (11515001, '001', 'MA001', 'E'),
    (11515002, '001', 'MA001', 'C');


--     (001, 'Robert Manurung'),
--     (002, 'Muhammad Yusuf Abduh'),
--     (003, 'Inggriani Liem'),
--     (004, 'Khairul Hadi'),
--     (005, 'Turfa Auliarachman');

 