-- ================================================
-- FILE: 06_insert_krs_nilai.sql
-- DESCRIPTION: Insert data KRS, nilai, dan transkrip
-- ================================================

-- Insert KRS untuk mahasiswa semester 1 (20 mahasiswa TI)
INSERT INTO krs (id_registrasi, id_semester, tanggal_pengajuan, status_validasi) VALUES
(1, 1, '2023-08-15', true),
(2, 1, '2023-08-15', true),
(3, 1, '2023-08-16', true),
(4, 1, '2023-08-16', true),
(5, 1, '2023-08-17', true),
(6, 1, '2023-08-17', true),
(7, 1, '2023-08-18', true),
(8, 1, '2023-08-18', true),
(9, 1, '2023-08-19', true),
(10, 1, '2023-08-19', true),
(11, 1, '2023-08-20', true),
(12, 1, '2023-08-20', true),
(13, 1, '2023-08-21', true),
(14, 1, '2023-08-21', true),
(15, 1, '2023-08-22', true),
(16, 1, '2023-08-22', true),
(17, 1, '2023-08-23', true),
(18, 1, '2023-08-23', true),
(19, 1, '2023-08-24', true),
(20, 1, '2023-08-24', true),

-- KRS mahasiswa prodi lain
(21, 1, '2023-08-15', true), -- SI
(22, 1, '2023-08-15', true),
(23, 1, '2023-08-16', true),
(24, 1, '2023-08-16', true),
(25, 1, '2023-08-17', true),

(26, 1, '2023-08-15', true), -- Manajemen
(27, 1, '2023-08-15', true),
(28, 1, '2023-08-16', true),
(29, 1, '2023-08-16', true),
(30, 1, '2023-08-17', true),

(31, 1, '2023-08-15', true), -- Akuntansi
(32, 1, '2023-08-15', true),
(33, 1, '2023-08-16', true),
(34, 1, '2023-08-16', true),
(35, 1, '2023-08-17', true),

(36, 1, '2023-08-15', true), -- Hukum
(37, 1, '2023-08-15', true),
(38, 1, '2023-08-16', true),

(39, 1, '2023-08-15', true), -- Kedokteran
(40, 1, '2023-08-15', true);

-- Insert KRS Detail untuk mahasiswa TI (mengambil kelas semester 1)
-- Mahasiswa 1-10 mengambil kelas TI-1A
INSERT INTO krs_detail (id_krs, id_kelas, nilai_mutu, nilai_huruf, nilai_bobot, nilai_akhir) VALUES
-- Mahasiswa 1
(1, 1, 3.75, 'A', 11.25, 85.5), -- Algoritma
(1, 3, 3.50, 'B+', 10.50, 82.0), -- Matematika Diskrit
(1, 4, 3.75, 'A', 11.25, 87.0), -- Sistem Digital
(1, 5, 3.25, 'B+', 6.50, 80.5), -- Pengantar TI
(1, 6, 3.50, 'B+', 7.00, 83.0), -- Bahasa Inggris
(1, 7, 3.75, 'A', 7.50, 86.0), -- Pancasila

-- Mahasiswa 2
(2, 2, 3.50, 'B+', 10.50, 82.5), -- Algoritma (kelas B)
(2, 3, 3.25, 'B+', 9.75, 81.0), -- Matematika Diskrit
(2, 4, 3.50, 'B+', 10.50, 83.5), -- Sistem Digital
(2, 5, 3.00, 'B', 6.00, 78.0), -- Pengantar TI
(2, 6, 3.25, 'B+', 6.50, 80.0), -- Bahasa Inggris
(2, 7, 3.50, 'B+', 7.00, 84.0), -- Pancasila

-- Mahasiswa 3
(3, 1, 3.25, 'B+', 9.75, 80.0), -- Algoritma
(3, 3, 3.00, 'B', 9.00, 77.5), -- Matematika Diskrit
(3, 4, 3.25, 'B+', 9.75, 81.5), -- Sistem Digital
(3, 5, 3.50, 'B+', 7.00, 84.0), -- Pengantar TI
(3, 6, 3.25, 'B+', 6.50, 82.0), -- Bahasa Inggris
(3, 7, 3.50, 'B+', 7.00, 85.0), -- Pancasila

-- Mahasiswa 4
(4, 2, 3.75, 'A', 11.25, 88.0), -- Algoritma (kelas B)
(4, 3, 3.50, 'B+', 10.50, 84.0), -- Matematika Diskrit
(4, 4, 3.25, 'B+', 9.75, 82.5), -- Sistem Digital
(4, 5, 3.75, 'A', 7.50, 87.0), -- Pengantar TI
(4, 6, 3.50, 'B+', 7.00, 83.5), -- Bahasa Inggris
(4, 7, 3.75, 'A', 7.50, 86.5), -- Pancasila

-- Mahasiswa 5
(5, 1, 3.00, 'B', 9.00, 76.0), -- Algoritma
(5, 3, 2.75, 'B', 8.25, 74.5), -- Matematika Diskrit
(5, 4, 3.00, 'B', 9.00, 78.0), -- Sistem Digital
(5, 5, 3.25, 'B+', 6.50, 80.0), -- Pengantar TI
(5, 6, 3.00, 'B', 6.00, 77.0), -- Bahasa Inggris
(5, 7, 3.25, 'B+', 6.50, 81.0); -- Pancasila

-- Insert data nilai detail untuk beberapa mahasiswa
INSERT INTO nilai (id_krs_detail, jenis, persentase, nilai) VALUES
-- Mahasiswa 1, Mata Kuliah Algoritma
(1, 'tugas', 20.00, 85.0),
(1, 'quiz', 15.00, 88.0),
(1, 'uts', 30.00, 84.0),
(1, 'uas', 35.00, 86.0),

-- Mahasiswa 1, Mata Kuliah Matematika Diskrit
(2, 'tugas', 25.00, 80.0),
(2, 'quiz', 15.00, 85.0),
(2, 'uts', 30.00, 82.0),
(2, 'uas', 30.00, 83.0),

-- Mahasiswa 2, Mata Kuliah Algoritma
(7, 'tugas', 20.00, 82.0),
(7, 'quiz', 15.00, 85.0),
(7, 'uts', 30.00, 80.0),
(7, 'uas', 35.00, 84.0);

-- Insert Transkrip untuk beberapa mahasiswa
INSERT INTO transkrip (id_registrasi, total_sks, ipk) VALUES
(1, 17, 3.58),
(2, 17, 3.35),
(3, 17, 3.21),
(4, 17, 3.64),
(5, 17, 3.04);