-- ================================================
-- FILE: 05_insert_jadwal_pengajar.sql
-- DESCRIPTION: Insert data jadwal kuliah dan pengajar
-- ================================================

-- Insert Pengajar (Dosen mengajar kelas)
INSERT INTO pengajar (id_dosen, id_kelas) VALUES
-- Dosen TI mengajar kelas TI
(1, 1), (1, 2), -- Algoritma Pemrograman TI-1A, TI-1B
(2, 3), -- Matematika Diskrit TI-1A
(3, 4), -- Sistem Digital TI-1A
(4, 5), -- Pengantar TI TI-1A
(5, 6), -- Bahasa Inggris TI-1A
(6, 7), -- Pancasila TI-1A

(7, 8), -- Struktur Data TI-2A
(8, 9), -- OOP TI-2A
(9, 10), -- Basis Data TI-2A
(10, 11), -- Sistem Operasi TI-2A
(11, 12), -- Kalkulus TI-2A
(12, 13), -- Kewarganegaraan TI-2A

(13, 14), -- Analisis Sistem TI-3A
(14, 15), -- Jaringan Komputer TI-3A
(15, 16), -- RPL TI-3A
(16, 17), -- Web Programming TI-3A
(17, 18), -- Statistika TI-3A
(18, 19), -- Agama TI-3A

-- Dosen mengajar prodi lain
(11, 20), -- SI
(14, 21), -- Manajemen
(16, 22), -- Akuntansi
(19, 23), -- Hukum
(20, 24); -- Kedokteran

-- Insert Jadwal (updated to use id_hari foreign key)
-- id_hari: 1=Senin, 2=Selasa, 3=Rabu, 4=Kamis, 5=Jumat, 6=Sabtu, 7=Minggu
INSERT INTO jadwal (id_dosen, id_ruang, waktu_mulai, waktu_selesai, id_kelas, id_hari) VALUES
-- Jadwal Senin (id_hari = 1)
(1, 1, '08:00:00', '10:30:00', 1, 1), -- Algoritma TI-1A
(1, 2, '10:45:00', '13:15:00', 2, 1), -- Algoritma TI-1B
(2, 3, '13:30:00', '16:00:00', 3, 1), -- Matematika Diskrit TI-1A

-- Jadwal Selasa (id_hari = 2)
(3, 1, '08:00:00', '10:30:00', 4, 2), -- Sistem Digital TI-1A
(4, 2, '10:45:00', '12:15:00', 5, 2), -- Pengantar TI TI-1A
(5, 3, '13:30:00', '15:00:00', 6, 2), -- Bahasa Inggris TI-1A
(6, 4, '15:15:00', '16:45:00', 7, 2), -- Pancasila TI-1A

-- Jadwal Rabu (id_hari = 3)
(7, 1, '08:00:00', '10:30:00', 8, 3), -- Struktur Data TI-2A
(8, 2, '10:45:00', '13:15:00', 9, 3), -- OOP TI-2A
(9, 3, '13:30:00', '16:00:00', 10, 3), -- Basis Data TI-2A

-- Jadwal Kamis (id_hari = 4)
(10, 1, '08:00:00', '10:30:00', 11, 4), -- Sistem Operasi TI-2A
(11, 2, '10:45:00', '13:15:00', 12, 4), -- Kalkulus TI-2A
(12, 3, '13:30:00', '15:00:00', 13, 4), -- Kewarganegaraan TI-2A

-- Jadwal Jumat (id_hari = 5)
(13, 1, '08:00:00', '10:30:00', 14, 5), -- Analisis Sistem TI-3A
(14, 2, '10:45:00', '13:15:00', 15, 5), -- Jaringan Komputer TI-3A
(15, 3, '13:30:00', '16:00:00', 16, 5), -- RPL TI-3A

-- Jadwal Sabtu (id_hari = 6)
(16, 1, '08:00:00', '10:30:00', 17, 6), -- Web Programming TI-3A
(17, 2, '10:45:00', '13:15:00', 18, 6), -- Statistika TI-3A
(18, 3, '13:30:00', '15:00:00', 19, 6), -- Agama TI-3A

-- Jadwal untuk prodi lain
(11, 5, '08:00:00', '10:30:00', 20, 1), -- SI (Senin)
(14, 6, '10:45:00', '13:15:00', 21, 1), -- Manajemen (Senin)
(16, 7, '13:30:00', '16:00:00', 22, 2), -- Akuntansi (Selasa)
(19, 8, '08:00:00', '10:30:00', 23, 3), -- Hukum (Rabu)
(20, 9, '10:45:00', '14:15:00', 24, 4); -- Kedokteran (Kamis)