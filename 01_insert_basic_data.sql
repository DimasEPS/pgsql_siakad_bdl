-- ================================================
-- FILE: 01_insert_basic_data.sql
-- DESCRIPTION: Insert data dasar untuk sistem siakadu
-- ================================================

-- Insert Roles
INSERT INTO role (nama_role, deskripsi) VALUES
('admin', 'Administrator sistem'),
('dosen', 'Dosen pengajar'),
('mahasiswa', 'Mahasiswa'),
('staff_akademik', 'Staff akademik');

-- Insert Fakultas
INSERT INTO fakultas (kode_fakultas, nama_fakultas) VALUES
('FTI', 'Fakultas Teknologi Informasi'),
('FE', 'Fakultas Ekonomi'),
('FH', 'Fakultas Hukum'),
('FK', 'Fakultas Kedokteran');

-- Insert Jurusan
INSERT INTO jurusan (kode_jurusan, nama_jurusan, id_fakultas) VALUES
('TI', 'Teknik Informatika', 1),
('SI', 'Sistem Informasi', 1),
('MN', 'Manajemen', 2),
('AK', 'Akuntansi', 2),
('IL', 'Ilmu Hukum', 3),
('PD', 'Pendidikan Dokter', 4);

-- Insert Program Studi
INSERT INTO prodi (nama_prodi, jenjang, id_jurusan) VALUES
('Teknik Informatika', 'S1', 1),
('Teknik Informatika', 'D3', 1),
('Sistem Informasi', 'S1', 2),
('Manajemen', 'S1', 3),
('Akuntansi', 'S1', 4),
('Ilmu Hukum', 'S1', 5),
('Pendidikan Dokter', 'S1', 6);

-- Insert Gedung
INSERT INTO gedung (nama_gedung, alamat) VALUES
('Gedung A', 'Jl. Pendidikan No. 1'),
('Gedung B', 'Jl. Pendidikan No. 2'),
('Gedung C', 'Jl. Pendidikan No. 3'),
('Laboratorium', 'Jl. Teknologi No. 1'),
('Perpustakaan', 'Jl. Ilmu No. 1');

-- Insert Ruang
INSERT INTO ruang (nama_ruang, kapasitas_ruang, id_gedung) VALUES
('A101', 40, 1),
('A102', 35, 1),
('A201', 50, 1),
('A202', 45, 1),
('B101', 30, 2),
('B102', 35, 2),
('B201', 40, 2),
('C101', 60, 3),
('C102', 55, 3),
('LAB1', 25, 4),
('LAB2', 30, 4),
('PERP1', 100, 5);

-- Insert Semester
INSERT INTO semester (tahun_ajaran, tipe_semester) VALUES
('2023/2024', 'ganjil'),
('2023/2024', 'genap'),
('2024/2025', 'ganjil'),
('2024/2025', 'genap'),
('2025/2026', 'ganjil');