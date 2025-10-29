-- ================================================
-- FILE: 04_insert_matakuliah_kelas.sql
-- DESCRIPTION: Insert data mata kuliah, kelas, dan registrasi mahasiswa
-- ================================================

-- Insert Mata Kuliah
INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, id_semester) VALUES
-- Mata Kuliah Semester 1
('IF101', 'Algoritma dan Pemrograman', 3, 1),
('IF102', 'Matematika Diskrit', 3, 1),
('IF103', 'Sistem Digital', 3, 1),
('IF104', 'Pengantar Teknologi Informasi', 2, 1),
('IF105', 'Bahasa Inggris', 2, 1),
('IF106', 'Pancasila', 2, 1),

-- Mata Kuliah Semester 2
('IF201', 'Struktur Data', 3, 2),
('IF202', 'Pemrograman Berorientasi Objek', 3, 2),
('IF203', 'Basis Data', 3, 2),
('IF204', 'Sistem Operasi', 3, 2),
('IF205', 'Kalkulus', 3, 2),
('IF206', 'Kewarganegaraan', 2, 2),

-- Mata Kuliah Semester 3
('IF301', 'Analisis dan Desain Sistem', 3, 3),
('IF302', 'Jaringan Komputer', 3, 3),
('IF303', 'Rekayasa Perangkat Lunak', 3, 3),
('IF304', 'Pemrograman Web', 3, 3),
('IF305', 'Statistika', 3, 3),
('IF306', 'Agama', 2, 3),

-- Mata Kuliah untuk Prodi lain
('SI101', 'Pengantar Sistem Informasi', 3, 1),
('MN101', 'Pengantar Manajemen', 3, 1),
('AK101', 'Pengantar Akuntansi', 3, 1),
('IL101', 'Pengantar Ilmu Hukum', 3, 1),
('PD101', 'Anatomi Dasar', 4, 1);

-- Insert Kelas
INSERT INTO kelas (id_mk, id_semester, id_prodi, kapasitas_kelas, nama_kelas) VALUES
-- Kelas untuk TI S1 (Prodi ID 1)
(1, 1, 1, 30, 'TI-1A'),
(1, 1, 1, 30, 'TI-1B'),
(2, 1, 1, 30, 'TI-1A'),
(3, 1, 1, 30, 'TI-1A'),
(4, 1, 1, 30, 'TI-1A'),
(5, 1, 1, 30, 'TI-1A'),
(6, 1, 1, 30, 'TI-1A'),

(7, 2, 1, 30, 'TI-2A'),
(8, 2, 1, 30, 'TI-2A'),
(9, 2, 1, 30, 'TI-2A'),
(10, 2, 1, 30, 'TI-2A'),
(11, 2, 1, 30, 'TI-2A'),
(12, 2, 1, 30, 'TI-2A'),

(13, 3, 1, 30, 'TI-3A'),
(14, 3, 1, 30, 'TI-3A'),
(15, 3, 1, 30, 'TI-3A'),
(16, 3, 1, 30, 'TI-3A'),
(17, 3, 1, 30, 'TI-3A'),
(18, 3, 1, 30, 'TI-3A'),

-- Kelas untuk prodi lain
(19, 1, 3, 25, 'SI-1A'),
(20, 1, 4, 25, 'MN-1A'),
(21, 1, 5, 25, 'AK-1A'),
(22, 1, 6, 25, 'IL-1A'),
(23, 1, 7, 20, 'PD-1A');

-- Insert Registrasi Mahasiswa (updated to use id_status)
INSERT INTO registrasi (id_dosen_pa, id_mahasiswa, id_prodi, npm, angkatan, id_status) VALUES
-- Mahasiswa TI S1 (20 mahasiswa) - id_status 1 = Aktif
(1, 1, 1, '2023010001', 2023, 1),
(1, 2, 1, '2023010002', 2023, 1),
(2, 3, 1, '2023010003', 2023, 1),
(2, 4, 1, '2023010004', 2023, 1),
(3, 5, 1, '2023010005', 2023, 1),
(3, 6, 1, '2023010006', 2023, 1),
(4, 7, 1, '2023010007', 2023, 1),
(4, 8, 1, '2023010008', 2023, 1),
(5, 9, 1, '2023010009', 2023, 1),
(5, 10, 1, '2023010010', 2023, 1),
(6, 11, 1, '2023010011', 2023, 1),
(6, 12, 1, '2023010012', 2023, 1),
(7, 13, 1, '2023010013', 2023, 1),
(7, 14, 1, '2023010014', 2023, 1),
(8, 15, 1, '2023010015', 2023, 1),
(8, 16, 1, '2023010016', 2023, 1),
(9, 17, 1, '2023010017', 2023, 1),
(9, 18, 1, '2023010018', 2023, 1),
(10, 19, 1, '2023010019', 2023, 1),
(10, 20, 1, '2023010020', 2023, 1),

-- Mahasiswa Sistem Informasi (5 mahasiswa)
(11, 21, 3, '2023030001', 2023, 1),
(11, 22, 3, '2023030002', 2023, 1),
(12, 23, 3, '2023030003', 2023, 1),
(12, 24, 3, '2023030004', 2023, 1),
(13, 25, 3, '2023030005', 2023, 1),

-- Mahasiswa Manajemen (5 mahasiswa)
(14, 26, 4, '2023040001', 2023, 1),
(14, 27, 4, '2023040002', 2023, 1),
(15, 28, 4, '2023040003', 2023, 1),
(15, 29, 4, '2023040004', 2023, 1),
(16, 30, 4, '2023040005', 2023, 1),

-- Mahasiswa Akuntansi (5 mahasiswa)
(16, 31, 5, '2023050001', 2023, 1),
(17, 32, 5, '2023050002', 2023, 1),
(17, 33, 5, '2023050003', 2023, 1),
(18, 34, 5, '2023050004', 2023, 1),
(18, 35, 5, '2023050005', 2023, 1),

-- Mahasiswa Ilmu Hukum (3 mahasiswa)
(19, 36, 6, '2023060001', 2023, 1),
(19, 37, 6, '2023060002', 2023, 1),
(20, 38, 6, '2023060003', 2023, 1),

-- Mahasiswa Pendidikan Dokter (2 mahasiswa)
(20, 39, 7, '2023070001', 2023, 1),
(20, 40, 7, '2023070002', 2023, 1);