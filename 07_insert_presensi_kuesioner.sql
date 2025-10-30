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

-- Insert Presensi Mahasiswa (updated to use id_registrasi instead of id_mahasiswa)
-- SCHEMA UPDATE: Changed id_mahasiswa to id_registrasi
-- Status Kehadiran: 1=Hadir, 2=Izin, 3=Sakit, 4=Alpa
INSERT INTO presensi_mahasiswa (id_pertemuan, id_registrasi, id_status, waktu_absen) VALUES
-- Pertemuan 1 Algoritma TI-1A (using id_registrasi instead of id_mahasiswa)
(1, 1, 1, '2023-09-04 08:05:00'), -- hadir (registrasi 1 = mahasiswa 1)
(1, 3, 1, '2023-09-04 08:03:00'), -- hadir (registrasi 3 = mahasiswa 3)
(1, 5, 1, '2023-09-04 08:07:00'), -- hadir
(1, 7, 1, '2023-09-04 08:10:00'), -- hadir
(1, 9, 2, '2023-09-04 08:00:00'), -- izin
(1, 11, 1, '2023-09-04 08:02:00'), -- hadir
(1, 13, 1, '2023-09-04 08:08:00'), -- hadir
(1, 15, 1, '2023-09-04 08:04:00'), -- hadir
(1, 17, 1, '2023-09-04 08:06:00'), -- hadir
(1, 19, 1, '2023-09-04 08:09:00'), -- hadir

-- Pertemuan 2 Algoritma TI-1A
(2, 1, 1, '2023-09-11 08:02:00'), -- hadir
(2, 3, 1, '2023-09-11 08:05:00'), -- hadir
(2, 5, 1, '2023-09-11 08:03:00'), -- hadir
(2, 7, 3, '2023-09-11 08:00:00'), -- sakit
(2, 9, 1, '2023-09-11 08:07:00'), -- hadir
(2, 11, 1, '2023-09-11 08:04:00'), -- hadir
(2, 13, 1, '2023-09-11 08:06:00'), -- hadir
(2, 15, 1, '2023-09-11 08:08:00'), -- hadir
(2, 17, 4, NULL), -- alpa
(2, 19, 1, '2023-09-11 08:01:00'), -- hadir

-- Pertemuan 1 Algoritma TI-1B
(6, 2, 1, '2023-09-04 10:47:00'), -- hadir
(6, 4, 1, '2023-09-04 10:50:00'), -- hadir
(6, 6, 1, '2023-09-04 10:45:00'), -- hadir
(6, 8, 1, '2023-09-04 10:52:00'), -- hadir
(6, 10, 1, '2023-09-04 10:48:00'), -- hadir
(6, 12, 1, '2023-09-04 10:46:00'), -- hadir
(6, 14, 1, '2023-09-04 10:49:00'), -- hadir
(6, 16, 2, '2023-09-04 10:45:00'), -- izin
(6, 18, 1, '2023-09-04 10:51:00'), -- hadir
(6, 20, 1, '2023-09-04 10:53:00'); -- hadir

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
-- SCHEMA UPDATE: Changed id_mahasiswa to id_registrasi
INSERT INTO respon_kuesioner (id_pertanyaan, id_registrasi, id_dosen, id_kelas, id_semester, jawaban) VALUES
-- Respon mahasiswa untuk evaluasi pembelajaran Algoritma (using id_registrasi)
(1, 1, 1, 1, 1, '4'), -- Kemampuan dosen (registrasi 1 = mahasiswa 1)
(2, 1, 1, 1, 1, '4'), -- Kejelasan materi
(3, 1, 1, 1, 1, '5'), -- Kesempatan bertanya
(4, 1, 1, 1, 1, '4'), -- Kesesuaian silabus
(5, 1, 1, 1, 1, '4'), -- Manfaat tugas

(1, 2, 1, 2, 1, '3'), -- Kemampuan dosen (registrasi 2 = mahasiswa 2)
(2, 2, 1, 2, 1, '4'), -- Kejelasan materi
(3, 2, 1, 2, 1, '4'), -- Kesempatan bertanya
(4, 2, 1, 2, 1, '3'), -- Kesesuaian silabus
(5, 2, 1, 2, 1, '4'), -- Manfaat tugas

(1, 3, 1, 1, 1, '5'), -- Kemampuan dosen (registrasi 3 = mahasiswa 3)
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