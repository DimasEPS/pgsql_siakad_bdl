-- ================================================
-- FILE: 14_test_transactions.sql
-- DESCRIPTION: Test untuk transaksi KRS dan update nilai
-- ================================================

\echo '=========================================='
\echo 'TEST TRANSAKSI SISTEM SIAKADU'
\echo '=========================================='

-- Cek data awal sebelum test
\echo ''
\echo 'DATA AWAL SEBELUM TEST:'
\echo '------------------------------------------'

-- Cek registrasi yang tersedia
\echo 'Registrasi yang tersedia:'
SELECT r.id_registrasi, r.npm, m.nama, r.id_prodi 
FROM registrasi r 
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa 
WHERE r.id_registrasi BETWEEN 1 AND 15
ORDER BY r.id_registrasi;

-- Cek semester yang tersedia
\echo ''
\echo 'Semester yang tersedia:'
SELECT * FROM semester ORDER BY id_semester;

-- Cek kelas yang tersedia
\echo ''
\echo 'Kelas yang tersedia:'
SELECT k.id_kelas, k.nama_kelas, mk.nama_mk, k.id_semester
FROM kelas k 
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
WHERE k.id_kelas BETWEEN 1 AND 15
ORDER BY k.id_kelas;

-- Cek KRS detail yang ada
\echo ''
\echo 'KRS Detail yang tersedia untuk update:'
SELECT kd.id_krs_detail, kd.id_krs, k.nama_kelas, mk.nama_mk, kd.nilai_huruf, kd.nilai_akhir
FROM krs_detail kd
JOIN kelas k ON kd.id_kelas = k.id_kelas  
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
WHERE kd.id_krs_detail BETWEEN 1 AND 15
ORDER BY kd.id_krs_detail;

\echo ''
\echo '=========================================='
\echo 'TEST 1: TRANSAKSI PEMBUATAN KRS'
\echo '=========================================='

\echo ''
\echo 'SEBELUM TRANSAKSI KRS:'
\echo 'Jumlah KRS sebelum insert:'
SELECT COUNT(*) as total_krs FROM krs;

\echo 'Jumlah KRS Detail sebelum insert:'
SELECT COUNT(*) as total_krs_detail FROM krs_detail;

\echo ''
\echo 'MENJALANKAN TRANSAKSI KRS...'

-- TRANSAKSI 1: Pembuatan KRS
BEGIN;

\echo 'Step 1: Insert KRS baru untuk registrasi ID 10, semester 3'
INSERT INTO krs (id_registrasi, id_semester, status_validasi)
VALUES (10, 3, false);

-- Simpan ID KRS yang baru dibuat
\set krs_id (SELECT currval(pg_get_serial_sequence('krs', 'id_krs')))

\echo 'Step 2: Insert KRS Detail untuk kelas ID 14 dan 15'
INSERT INTO krs_detail (id_krs, id_kelas)
VALUES (currval(pg_get_serial_sequence('krs', 'id_krs')), 14),
       (currval(pg_get_serial_sequence('krs', 'id_krs')), 15);

COMMIT;

\echo ''
\echo 'SETELAH TRANSAKSI KRS:'
\echo 'Jumlah KRS setelah insert:'
SELECT COUNT(*) as total_krs FROM krs;

\echo 'Jumlah KRS Detail setelah insert:'
SELECT COUNT(*) as total_krs_detail FROM krs_detail;

\echo 'KRS yang baru dibuat:'
SELECT k.id_krs, k.id_registrasi, k.id_semester, k.status_validasi, 
       r.npm, m.nama as nama_mahasiswa
FROM krs k
JOIN registrasi r ON k.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
WHERE k.id_registrasi = 10 AND k.id_semester = 3;

\echo 'KRS Detail yang baru dibuat:'
SELECT kd.id_krs_detail, kd.id_krs, kd.id_kelas, 
       kelas.nama_kelas, mk.nama_mk
FROM krs_detail kd
JOIN kelas ON kd.id_kelas = kelas.id_kelas
JOIN mata_kuliah mk ON kelas.id_mk = mk.id_mk
JOIN krs kr ON kd.id_krs = kr.id_krs
WHERE kr.id_registrasi = 10 AND kr.id_semester = 3;

\echo ''
\echo '=========================================='
\echo 'TEST 2: TRANSAKSI UPDATE NILAI DAN IPK'
\echo '=========================================='

-- Cari KRS detail yang valid untuk diupdate
\echo ''
\echo 'SEBELUM TRANSAKSI UPDATE NILAI:'

\echo 'Data KRS Detail yang akan diupdate (ID 1):'
SELECT kd.id_krs_detail, kd.id_krs, kd.nilai_huruf, kd.nilai_bobot, kd.nilai_akhir,
       k.nama_kelas, mk.nama_mk, r.npm, m.nama
FROM krs_detail kd
JOIN kelas k ON kd.id_kelas = k.id_kelas
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
JOIN krs kr ON kd.id_krs = kr.id_krs
JOIN registrasi r ON kr.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
WHERE kd.id_krs_detail = 1;

\echo 'Transkrip sebelum update:'
SELECT t.id_registrasi, t.total_sks, t.ipk, r.npm, m.nama
FROM transkrip t
JOIN registrasi r ON t.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
WHERE t.id_registrasi = (
    SELECT kr.id_registrasi 
    FROM krs kr 
    JOIN krs_detail kd ON kr.id_krs = kd.id_krs 
    WHERE kd.id_krs_detail = 1
);

\echo ''
\echo 'MENJALANKAN TRANSAKSI UPDATE NILAI...'

-- TRANSAKSI 2: Update Nilai dan IPK
BEGIN;

\echo 'Step 1: Update nilai huruf dan bobot di KRS detail ID 1'
UPDATE krs_detail
SET nilai_huruf = 'A', 
    nilai_mutu = 4.00, 
    nilai_bobot = 12.00,  -- 4.00 * 3 SKS
    nilai_akhir = 90.00
WHERE id_krs_detail = 1;

\echo 'Step 2: Update IPK di transkrip menggunakan function'
UPDATE transkrip
SET ipk = hitung_ipk((
    SELECT r.id_mahasiswa
    FROM krs k
    JOIN registrasi r ON k.id_registrasi = r.id_registrasi
    JOIN krs_detail kd ON k.id_krs = kd.id_krs
    WHERE kd.id_krs_detail = 1
)),
total_sks = get_total_sks_mahasiswa((
    SELECT r.id_mahasiswa
    FROM krs k
    JOIN registrasi r ON k.id_registrasi = r.id_registrasi
    JOIN krs_detail kd ON k.id_krs = kd.id_krs
    WHERE kd.id_krs_detail = 1
))
WHERE id_registrasi = (
    SELECT k.id_registrasi
    FROM krs k
    JOIN krs_detail kd ON k.id_krs = kd.id_krs
    WHERE kd.id_krs_detail = 1
);

COMMIT;

\echo ''
\echo 'SETELAH TRANSAKSI UPDATE NILAI:'

\echo 'Data KRS Detail setelah update:'
SELECT kd.id_krs_detail, kd.id_krs, kd.nilai_huruf, kd.nilai_mutu, kd.nilai_bobot, kd.nilai_akhir,
       k.nama_kelas, mk.nama_mk, r.npm, m.nama
FROM krs_detail kd
JOIN kelas k ON kd.id_kelas = k.id_kelas
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
JOIN krs kr ON kd.id_krs = kr.id_krs
JOIN registrasi r ON kr.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
WHERE kd.id_krs_detail = 1;

\echo 'Transkrip setelah update:'
SELECT t.id_registrasi, t.total_sks, t.ipk, r.npm, m.nama
FROM transkrip t
JOIN registrasi r ON t.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
WHERE t.id_registrasi = (
    SELECT kr.id_registrasi 
    FROM krs kr 
    JOIN krs_detail kd ON kr.id_krs = kd.id_krs 
    WHERE kd.id_krs_detail = 1
);

\echo ''
\echo '=========================================='
\echo 'TEST 3: TRANSAKSI ROLLBACK (ERROR HANDLING)'
\echo '=========================================='

\echo ''
\echo 'Test transaksi yang akan di-rollback karena error:'

\echo 'Jumlah KRS sebelum transaksi rollback:'
SELECT COUNT(*) as total_krs FROM krs;

-- TRANSAKSI 3: Test Rollback
BEGIN;

\echo 'Insert KRS valid...'
INSERT INTO krs (id_registrasi, id_semester, status_validasi)
VALUES (5, 3, false);

\echo 'Insert KRS Detail dengan ID kelas yang tidak valid (akan error)...'
-- Ini akan menyebabkan error karena kelas ID 999 tidak ada
INSERT INTO krs_detail (id_krs, id_kelas)
VALUES (currval(pg_get_serial_sequence('krs', 'id_krs')), 999);

-- Jika sampai sini berarti ada masalah, seharusnya error di atas
ROLLBACK;

\echo 'Jumlah KRS setelah rollback (harus sama dengan sebelumnya):'
SELECT COUNT(*) as total_krs FROM krs;

\echo ''
\echo '=========================================='
\echo 'RINGKASAN TEST TRANSAKSI'
\echo '=========================================='

\echo ''
\echo 'Total data akhir:'
SELECT 'KRS' as tabel, COUNT(*) as jumlah FROM krs
UNION ALL
SELECT 'KRS Detail', COUNT(*) FROM krs_detail
UNION ALL
SELECT 'Transkrip', COUNT(*) FROM transkrip;

\echo ''
\echo 'Mahasiswa dengan IPK terbaru:'
SELECT r.npm, m.nama, t.ipk, t.total_sks
FROM transkrip t
JOIN registrasi r ON t.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
ORDER BY t.ipk DESC
LIMIT 5;

\echo ''
\echo '=========================================='
\echo 'TEST TRANSAKSI SELESAI!'
\echo '=========================================='