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

-- Insert Jadwal
INSERT INTO jadwal (id_dosen, id_ruang, waktu_mulai, waktu_selesai, id_kelas, hari) VALUES
-- Jadwal Senin
(1, 1, '08:00:00', '10:30:00', 1, 'senin'), -- Algoritma TI-1A
(1, 2, '10:45:00', '13:15:00', 2, 'senin'), -- Algoritma TI-1B
(2, 3, '13:30:00', '16:00:00', 3, 'senin'), -- Matematika Diskrit TI-1A

-- Jadwal Selasa
(3, 1, '08:00:00', '10:30:00', 4, 'selasa'), -- Sistem Digital TI-1A
(4, 2, '10:45:00', '12:15:00', 5, 'selasa'), -- Pengantar TI TI-1A
(5, 3, '13:30:00', '15:00:00', 6, 'selasa'), -- Bahasa Inggris TI-1A
(6, 4, '15:15:00', '16:45:00', 7, 'selasa'), -- Pancasila TI-1A

-- Jadwal Rabu
(7, 1, '08:00:00', '10:30:00', 8, 'rabu'), -- Struktur Data TI-2A
(8, 2, '10:45:00', '13:15:00', 9, 'rabu'), -- OOP TI-2A
(9, 3, '13:30:00', '16:00:00', 10, 'rabu'), -- Basis Data TI-2A

-- Jadwal Kamis
(10, 1, '08:00:00', '10:30:00', 11, 'kamis'), -- Sistem Operasi TI-2A
(11, 2, '10:45:00', '13:15:00', 12, 'kamis'), -- Kalkulus TI-2A
(12, 3, '13:30:00', '15:00:00', 13, 'kamis'), -- Kewarganegaraan TI-2A

-- Jadwal Jumat
(13, 1, '08:00:00', '10:30:00', 14, 'jumat'), -- Analisis Sistem TI-3A
(14, 2, '10:45:00', '13:15:00', 15, 'jumat'), -- Jaringan Komputer TI-3A
(15, 3, '13:30:00', '16:00:00', 16, 'jumat'), -- RPL TI-3A

-- Jadwal Sabtu
(16, 1, '08:00:00', '10:30:00', 17, 'sabtu'), -- Web Programming TI-3A
(17, 2, '10:45:00', '13:15:00', 18, 'sabtu'), -- Statistika TI-3A
(18, 3, '13:30:00', '15:00:00', 19, 'sabtu'), -- Agama TI-3A

-- Jadwal untuk prodi lain
(11, 5, '08:00:00', '10:30:00', 20, 'senin'), -- SI
(14, 6, '10:45:00', '13:15:00', 21, 'senin'), -- Manajemen
(16, 7, '13:30:00', '16:00:00', 22, 'selasa'), -- Akuntansi
(19, 8, '08:00:00', '10:30:00', 23, 'rabu'), -- Hukum
(20, 9, '10:45:00', '14:15:00', 24, 'kamis'); -- Kedokteran