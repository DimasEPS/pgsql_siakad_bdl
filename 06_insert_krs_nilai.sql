-- ================================================
-- FILE: 06_insert_krs_nilai.sql
-- DESCRIPTION: Insert data KRS, nilai, aturan_penilaian, dan transkrip
-- UPDATED: Now uses aturan_penilaian table instead of jenis enum
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

-- Insert Aturan Penilaian untuk setiap kelas
-- Jenis Nilai: 1=Tugas, 2=Quiz, 3=UTS, 4=UAS, 5=Praktikum
-- Kelas 1-2: Algoritma Pemrograman TI-1A & TI-1B (3 SKS, ada praktikum)
INSERT INTO aturan_penilaian (id_kelas, id_jenis_nilai, persentase, aktif) VALUES
(1, 1, 20.00, true), -- Tugas 20%
(1, 2, 15.00, true), -- Quiz 15%
(1, 3, 30.00, true), -- UTS 30%
(1, 4, 35.00, true), -- UAS 35%

(2, 1, 20.00, true), -- Algoritma TI-1B (sama)
(2, 2, 15.00, true),
(2, 3, 30.00, true),
(2, 4, 35.00, true),

-- Kelas 3: Matematika Diskrit (3 SKS)
(3, 1, 25.00, true), -- Tugas 25%
(3, 2, 15.00, true), -- Quiz 15%
(3, 3, 30.00, true), -- UTS 30%
(3, 4, 30.00, true), -- UAS 30%

-- Kelas 4-19: Aturan penilaian standar untuk kelas lainnya
(4, 1, 25.00, true), (4, 2, 15.00, true), (4, 3, 30.00, true), (4, 4, 30.00, true),
(5, 1, 25.00, true), (5, 2, 15.00, true), (5, 3, 30.00, true), (5, 4, 30.00, true),
(6, 1, 25.00, true), (6, 2, 15.00, true), (6, 3, 30.00, true), (6, 4, 30.00, true),
(7, 1, 25.00, true), (7, 2, 15.00, true), (7, 3, 30.00, true), (7, 4, 30.00, true),
(8, 1, 20.00, true), (8, 2, 15.00, true), (8, 3, 30.00, true), (8, 4, 35.00, true),
(9, 1, 20.00, true), (9, 2, 15.00, true), (9, 3, 30.00, true), (9, 4, 35.00, true),
(10, 1, 20.00, true), (10, 2, 15.00, true), (10, 3, 30.00, true), (10, 4, 35.00, true),
(11, 1, 25.00, true), (11, 2, 15.00, true), (11, 3, 30.00, true), (11, 4, 30.00, true),
(12, 1, 25.00, true), (12, 2, 15.00, true), (12, 3, 30.00, true), (12, 4, 30.00, true),
(13, 1, 25.00, true), (13, 2, 15.00, true), (13, 3, 30.00, true), (13, 4, 30.00, true),
(14, 1, 25.00, true), (14, 2, 15.00, true), (14, 3, 30.00, true), (14, 4, 30.00, true),
(15, 1, 25.00, true), (15, 2, 15.00, true), (15, 3, 30.00, true), (15, 4, 30.00, true),
(16, 1, 20.00, true), (16, 2, 15.00, true), (16, 3, 30.00, true), (16, 4, 35.00, true),
(17, 1, 20.00, true), (17, 2, 15.00, true), (17, 3, 30.00, true), (17, 4, 35.00, true),
(18, 1, 25.00, true), (18, 2, 15.00, true), (18, 3, 30.00, true), (18, 4, 30.00, true),
(19, 1, 25.00, true), (19, 2, 15.00, true), (19, 3, 30.00, true), (19, 4, 30.00, true),
(20, 1, 25.00, true), (20, 2, 15.00, true), (20, 3, 30.00, true), (20, 4, 30.00, true),
(21, 1, 25.00, true), (21, 2, 15.00, true), (21, 3, 30.00, true), (21, 4, 30.00, true),
(22, 1, 25.00, true), (22, 2, 15.00, true), (22, 3, 30.00, true), (22, 4, 30.00, true),
(23, 1, 25.00, true), (23, 2, 15.00, true), (23, 3, 30.00, true), (23, 4, 30.00, true),
(24, 1, 25.00, true), (24, 2, 15.00, true), (24, 3, 30.00, true), (24, 4, 30.00, true);

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
-- Menggunakan id_aturan berdasarkan aturan_penilaian yang sudah dibuat
-- Aturan untuk Kelas 1 (Algoritma TI-1A): id_aturan 1-4 (tugas, quiz, uts, uas)
-- Aturan untuk Kelas 3 (Matematika): id_aturan 9-12

INSERT INTO nilai (id_krs_detail, id_aturan, nilai) VALUES
-- Mahasiswa 1, Mata Kuliah Algoritma (krs_detail id=1, kelas id=1)
(1, 1, 85.0), -- Tugas (id_aturan 1: kelas 1, jenis 1)
(1, 2, 88.0), -- Quiz (id_aturan 2: kelas 1, jenis 2)
(1, 3, 84.0), -- UTS (id_aturan 3: kelas 1, jenis 3)
(1, 4, 86.0), -- UAS (id_aturan 4: kelas 1, jenis 4)

-- Mahasiswa 1, Mata Kuliah Matematika Diskrit (krs_detail id=2, kelas id=3)
(2, 9, 80.0), -- Tugas (id_aturan 9: kelas 3, jenis 1)
(2, 10, 85.0), -- Quiz (id_aturan 10: kelas 3, jenis 2)
(2, 11, 82.0), -- UTS (id_aturan 11: kelas 3, jenis 3)
(2, 12, 83.0), -- UAS (id_aturan 12: kelas 3, jenis 4)

-- Mahasiswa 2, Mata Kuliah Algoritma TI-1B (krs_detail id=7, kelas id=2)
(7, 5, 82.0), -- Tugas (id_aturan 5: kelas 2, jenis 1)
(7, 6, 85.0), -- Quiz (id_aturan 6: kelas 2, jenis 2)
(7, 7, 80.0), -- UTS (id_aturan 7: kelas 2, jenis 3)
(7, 8, 84.0); -- UAS (id_aturan 8: kelas 2, jenis 4)

-- Insert Transkrip untuk beberapa mahasiswa
INSERT INTO transkrip (id_registrasi, total_sks, ipk) VALUES
(1, 17, 3.58),
(2, 17, 3.35),
(3, 17, 3.21),
(4, 17, 3.64),
(5, 17, 3.04);