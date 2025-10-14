-- ================================================
-- FILE: 10_execute_all.sql
-- DESCRIPTION: Script untuk menjalankan semua file insert data secara berurutan
-- ================================================

-- Script ini akan menjalankan semua file insert data dalam urutan yang benar
-- Pastikan semua file SQL sudah ada di direktori yang sama

\echo 'Memulai proses insert data testing untuk database siakadu...'
\echo '=================================================='

\echo 'Step 1: Inserting basic data (roles, fakultas, jurusan, prodi, gedung, ruang, semester)...'
\i 01_insert_basic_data.sql

\echo 'Step 2: Inserting users and dosen data...'
\i 02_insert_users_dosen.sql

\echo 'Step 3: Inserting users and mahasiswa data...'
\i 03_insert_users_mahasiswa.sql

\echo 'Step 4: Inserting mata kuliah, kelas, and registrasi data...'
\i 04_insert_matakuliah_kelas.sql

\echo 'Step 5: Inserting jadwal and pengajar data...'
\i 05_insert_jadwal_pengajar.sql

\echo 'Step 6: Inserting KRS and nilai data...'
\i 06_insert_krs_nilai.sql

\echo 'Step 7: Inserting presensi and kuesioner data...'
\i 07_insert_presensi_kuesioner.sql

\echo 'Step 8: Creating functions...'
\i 08_functions.sql

\echo 'Step 9: Creating indexes...'
\i 09_indexes.sql

\echo '=================================================='
\echo 'Data testing berhasil diinsert ke database siakadu!'
\echo 'Ringkasan data yang telah diinsert:'
\echo '- 40 Mahasiswa dengan berbagai prodi'
\echo '- 20 Dosen pengajar'
\echo '- Mata kuliah, kelas, dan jadwal lengkap'
\echo '- Data KRS, nilai, dan transkrip'
\echo '- Data presensi dan kuesioner evaluasi'
\echo '- Functions untuk berbagai keperluan sistem'
\echo '- Indexes untuk optimasi performa'
\echo '=================================================='

-- Tampilkan statistik data
\echo 'Statistik Data:'
SELECT 'Users' as tabel, COUNT(*) as jumlah FROM users
UNION ALL
SELECT 'Mahasiswa', COUNT(*) FROM mahasiswa
UNION ALL
SELECT 'Dosen', COUNT(*) FROM dosen
UNION ALL
SELECT 'Registrasi', COUNT(*) FROM registrasi
UNION ALL
SELECT 'Mata Kuliah', COUNT(*) FROM mata_kuliah
UNION ALL
SELECT 'Kelas', COUNT(*) FROM kelas
UNION ALL
SELECT 'KRS', COUNT(*) FROM krs
UNION ALL
SELECT 'KRS Detail', COUNT(*) FROM krs_detail
UNION ALL
SELECT 'Jadwal', COUNT(*) FROM jadwal
UNION ALL
SELECT 'Pengajar', COUNT(*) FROM pengajar
UNION ALL
SELECT 'Nilai', COUNT(*) FROM nilai
UNION ALL
SELECT 'Presensi Pertemuan', COUNT(*) FROM presensi_pertemuan
UNION ALL
SELECT 'Presensi Mahasiswa', COUNT(*) FROM presensi_mahasiswa
UNION ALL
SELECT 'Kuesioner', COUNT(*) FROM kuesioner
UNION ALL
SELECT 'Respon Kuesioner', COUNT(*) FROM respon_kuesioner;

\echo '=================================================='
\echo 'Setup selesai! Database siap untuk demonstrasi.'