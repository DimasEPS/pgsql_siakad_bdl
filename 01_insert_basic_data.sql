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

-- Insert Hari
INSERT INTO hari (nama_hari) VALUES
('senin'),
('selasa'),
('rabu'),
('kamis'),
('jumat'),
('sabtu'),
('minggu');

-- Insert Jenjang
INSERT INTO jenjang (kode, nama_jenjang) VALUES
('D3', 'Diploma 3'),
('S1', 'Sarjana'),
('S2', 'Magister'),
('S3', 'Doktor');

-- Insert Status Mahasiswa
INSERT INTO status_mahasiswa (kode, nama_status) VALUES
('AKT', 'Aktif'),
('CTI', 'Cuti'),
('LLS', 'Lulus'),
('DO', 'Drop Out');

-- Insert Status Kehadiran
INSERT INTO status_kehadiran (nama_status) VALUES
('hadir'),
('izin'),
('sakit'),
('alpa');

-- Insert Jenis Nilai
INSERT INTO jenis_nilai (nama_nilai) VALUES
('tugas'),
('quiz'),
('uts'),
('uas'),
('praktikum');

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

-- Insert Program Studi (updated to use id_jenjang)
INSERT INTO prodi (nama_prodi, id_jenjang, id_jurusan) VALUES
('Teknik Informatika', 2, 1),  -- S1
('Teknik Informatika', 1, 1),  -- D3
('Sistem Informasi', 2, 2),     -- S1
('Manajemen', 2, 3),             -- S1
('Akuntansi', 2, 4),             -- S1
('Ilmu Hukum', 2, 5),            -- S1
('Pendidikan Dokter', 2, 6);    -- S1

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