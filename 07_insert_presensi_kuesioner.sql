-- ================================================
-- FILE: 07_insert_presensi_kuesioner.sql
-- DESCRIPTION: Insert data presensi dan kuesioner
-- ================================================

-- Insert Presensi Pertemuan
INSERT INTO presensi_pertemuan (id_dosen, id_jadwal, tanggal_pertemuan, materi, pertemuan_ke) VALUES
-- Pertemuan Algoritma Pemrograman TI-1A
(1, 1, '2023-09-04', 'Pengenalan Algoritma dan Flowchart', 1),
(1, 1, '2023-09-11', 'Variabel, Tipe Data, dan Operator', 2),
(1, 1, '2023-09-18', 'Struktur Kontrol: IF-ELSE', 3),
(1, 1, '2023-09-25', 'Struktur Kontrol: Looping', 4),
(1, 1, '2023-10-02', 'Array dan String', 5),

-- Pertemuan Algoritma Pemrograman TI-1B
(1, 2, '2023-09-04', 'Pengenalan Algoritma dan Flowchart', 1),
(1, 2, '2023-09-11', 'Variabel, Tipe Data, dan Operator', 2),
(1, 2, '2023-09-18', 'Struktur Kontrol: IF-ELSE', 3),
(1, 2, '2023-09-25', 'Struktur Kontrol: Looping', 4),

-- Pertemuan Matematika Diskrit
(2, 3, '2023-09-04', 'Pengenalan Logika Proposisi', 1),
(2, 3, '2023-09-11', 'Himpunan dan Operasinya', 2),
(2, 3, '2023-09-18', 'Relasi dan Fungsi', 3),

-- Pertemuan Sistem Digital
(3, 4, '2023-09-05', 'Sistem Bilangan', 1),
(3, 4, '2023-09-12', 'Gerbang Logika Dasar', 2),
(3, 4, '2023-09-19', 'Aljabar Boolean', 3);

-- Insert Presensi Mahasiswa
INSERT INTO presensi_mahasiswa (id_pertemuan, id_mahasiswa, status_kehadiran, waktu_absen) VALUES
-- Pertemuan 1 Algoritma TI-1A
(1, 1, 'hadir', '2023-09-04 08:05:00'),
(1, 3, 'hadir', '2023-09-04 08:03:00'),
(1, 5, 'hadir', '2023-09-04 08:07:00'),
(1, 7, 'hadir', '2023-09-04 08:10:00'),
(1, 9, 'izin', '2023-09-04 08:00:00'),
(1, 11, 'hadir', '2023-09-04 08:02:00'),
(1, 13, 'hadir', '2023-09-04 08:08:00'),
(1, 15, 'hadir', '2023-09-04 08:04:00'),
(1, 17, 'hadir', '2023-09-04 08:06:00'),
(1, 19, 'hadir', '2023-09-04 08:09:00'),

-- Pertemuan 2 Algoritma TI-1A
(2, 1, 'hadir', '2023-09-11 08:02:00'),
(2, 3, 'hadir', '2023-09-11 08:05:00'),
(2, 5, 'hadir', '2023-09-11 08:03:00'),
(2, 7, 'sakit', '2023-09-11 08:00:00'),
(2, 9, 'hadir', '2023-09-11 08:07:00'),
(2, 11, 'hadir', '2023-09-11 08:04:00'),
(2, 13, 'hadir', '2023-09-11 08:06:00'),
(2, 15, 'hadir', '2023-09-11 08:08:00'),
(2, 17, 'alpa', NULL),
(2, 19, 'hadir', '2023-09-11 08:01:00'),

-- Pertemuan 1 Algoritma TI-1B
(6, 2, 'hadir', '2023-09-04 10:47:00'),
(6, 4, 'hadir', '2023-09-04 10:50:00'),
(6, 6, 'hadir', '2023-09-04 10:45:00'),
(6, 8, 'hadir', '2023-09-04 10:52:00'),
(6, 10, 'hadir', '2023-09-04 10:48:00'),
(6, 12, 'hadir', '2023-09-04 10:46:00'),
(6, 14, 'hadir', '2023-09-04 10:49:00'),
(6, 16, 'izin', '2023-09-04 10:45:00'),
(6, 18, 'hadir', '2023-09-04 10:51:00'),
(6, 20, 'hadir', '2023-09-04 10:53:00');

-- Insert Kuesioner
INSERT INTO kuesioner (judul, deskripsi, aktif, tanggal_mulai, tanggal_selesai) VALUES
('Evaluasi Pembelajaran Semester Ganjil 2023/2024', 'Kuesioner evaluasi kualitas pembelajaran untuk semester ganjil tahun akademik 2023/2024', true, '2023-12-01', '2023-12-31'),
('Feedback Fasilitas Kampus', 'Kuesioner untuk mendapatkan feedback mengenai fasilitas kampus', true, '2023-11-01', '2023-11-30'),
('Kepuasan Layanan Akademik', 'Evaluasi kepuasan mahasiswa terhadap layanan akademik', false, '2023-10-01', '2023-10-31');

-- Insert Pertanyaan Kuesioner
INSERT INTO pertanyaan_kuesioner (id_kuesioner, teks_pertanyaan, tipe_jawaban) VALUES
-- Pertanyaan untuk Evaluasi Pembelajaran
(1, 'Bagaimana penilaian Anda terhadap kemampuan dosen dalam menyampaikan materi?', 'skala'),
(1, 'Seberapa jelas penjelasan materi yang diberikan oleh dosen?', 'skala'),
(1, 'Apakah dosen memberikan kesempatan untuk bertanya?', 'skala'),
(1, 'Bagaimana kesesuaian materi dengan silabus?', 'skala'),
(1, 'Seberapa membantu tugas dan latihan yang diberikan?', 'skala'),

-- Pertanyaan untuk Fasilitas Kampus
(2, 'Bagaimana kondisi ruang kelas?', 'skala'),
(2, 'Apakah fasilitas laboratorium memadai?', 'skala'),
(2, 'Bagaimana kualitas koneksi internet di kampus?', 'skala'),

-- Pertanyaan untuk Layanan Akademik
(3, 'Bagaimana pelayanan staff akademik?', 'skala'),
(3, 'Seberapa mudah proses administrasi akademik?', 'skala');

-- Insert Respon Kuesioner
INSERT INTO respon_kuesioner (id_pertanyaan, id_mahasiswa, id_dosen, id_kelas, id_semester, jawaban) VALUES
-- Respon mahasiswa untuk evaluasi pembelajaran Algoritma
(1, 1, 1, 1, 1, '4'), -- Kemampuan dosen
(2, 1, 1, 1, 1, '4'), -- Kejelasan materi
(3, 1, 1, 1, 1, '5'), -- Kesempatan bertanya
(4, 1, 1, 1, 1, '4'), -- Kesesuaian silabus
(5, 1, 1, 1, 1, '4'), -- Manfaat tugas

(1, 2, 1, 2, 1, '3'), -- Kemampuan dosen
(2, 2, 1, 2, 1, '4'), -- Kejelasan materi
(3, 2, 1, 2, 1, '4'), -- Kesempatan bertanya
(4, 2, 1, 2, 1, '3'), -- Kesesuaian silabus
(5, 2, 1, 2, 1, '4'), -- Manfaat tugas

(1, 3, 1, 1, 1, '5'), -- Kemampuan dosen
(2, 3, 1, 1, 1, '5'), -- Kejelasan materi
(3, 3, 1, 1, 1, '5'), -- Kesempatan bertanya
(4, 3, 1, 1, 1, '4'), -- Kesesuaian silabus
(5, 3, 1, 1, 1, '5'), -- Manfaat tugas

-- Respon untuk fasilitas kampus
(6, 1, 1, 1, 1, '4'), -- Kondisi ruang kelas
(7, 1, 1, 1, 1, '3'), -- Fasilitas lab
(8, 1, 1, 1, 1, '2'), -- Koneksi internet

(6, 2, 1, 2, 1, '3'), -- Kondisi ruang kelas
(7, 2, 1, 2, 1, '4'), -- Fasilitas lab
(8, 2, 1, 2, 1, '3'); -- Koneksi internet