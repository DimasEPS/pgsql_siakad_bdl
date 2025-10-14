-- ================================================
-- FILE: 12_test_functions.sql
-- DESCRIPTION: Contoh penggunaan functions yang telah dibuat
-- ================================================

\echo '=========================================='
\echo 'TESTING FUNCTIONS SISTEM SIAKADU'
\echo '=========================================='

\echo ''
\echo '1. FUNCTION: hitung_ipk(id_mahasiswa)'
\echo 'Menghitung IPK mahasiswa berdasarkan ID'
\echo '------------------------------------------'

-- Test IPK untuk beberapa mahasiswa
SELECT 
    m.nama as nama_mahasiswa,
    r.npm,
    hitung_ipk(m.id_mahasiswa) as ipk
FROM mahasiswa m
JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
WHERE m.id_mahasiswa IN (1, 2, 3, 4, 5)
ORDER BY ipk DESC;

\echo ''
\echo '2. FUNCTION: get_transkrip_mahasiswa(id_mahasiswa)'
\echo 'Menampilkan transkrip lengkap mahasiswa'
\echo '------------------------------------------'

-- Test transkrip untuk mahasiswa ID 1
SELECT * FROM get_transkrip_mahasiswa(1);

\echo ''
\echo '3. FUNCTION: get_total_sks_mahasiswa(id_mahasiswa)'
\echo 'Menghitung total SKS yang sudah diambil'
\echo '------------------------------------------'

SELECT 
    m.nama as nama_mahasiswa,
    r.npm,
    get_total_sks_mahasiswa(m.id_mahasiswa) as total_sks
FROM mahasiswa m
JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
WHERE m.id_mahasiswa IN (1, 2, 3, 4, 5)
ORDER BY total_sks DESC;

\echo ''
\echo '4. FUNCTION: get_jadwal_mahasiswa(id_mahasiswa, id_semester)'
\echo 'Menampilkan jadwal kuliah mahasiswa per semester'
\echo '------------------------------------------'

-- Test jadwal untuk mahasiswa ID 1 semester 1
SELECT * FROM get_jadwal_mahasiswa(1, 1)
ORDER BY hari, waktu_mulai;

\echo ''
\echo '5. FUNCTION: get_mahasiswa_kelas(id_kelas)'
\echo 'Menampilkan daftar mahasiswa dalam suatu kelas'
\echo '------------------------------------------'

-- Test daftar mahasiswa kelas Algoritma TI-1A (kelas ID 1)
SELECT * FROM get_mahasiswa_kelas(1)
ORDER BY npm;

\echo ''
\echo '6. FUNCTION: get_persentase_kehadiran(id_mahasiswa, id_kelas)'
\echo 'Menghitung persentase kehadiran mahasiswa per kelas'
\echo '------------------------------------------'

-- Test persentase kehadiran untuk beberapa mahasiswa di kelas Algoritma
SELECT 
    m.nama as nama_mahasiswa,
    r.npm,
    get_persentase_kehadiran(m.id_mahasiswa, 1) as persentase_kehadiran
FROM mahasiswa m
JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
WHERE m.id_mahasiswa IN (1, 3, 5, 7, 9, 11)
ORDER BY persentase_kehadiran DESC;

\echo ''
\echo '7. FUNCTION: get_statistik_nilai_mk(id_mk, id_semester)'
\echo 'Menampilkan statistik nilai per mata kuliah'
\echo '------------------------------------------'

-- Test statistik untuk mata kuliah Algoritma (ID 1) semester 1
SELECT * FROM get_statistik_nilai_mk(1, 1);

\echo ''
\echo '8. FUNCTION: validasi_krs_bentrok(id_krs)'
\echo 'Validasi apakah ada bentrok jadwal dalam KRS'
\echo '------------------------------------------'

-- Test validasi bentrok untuk beberapa KRS
SELECT 
    k.id_krs,
    r.npm,
    m.nama as nama_mahasiswa,
    validasi_krs_bentrok(k.id_krs) as tidak_bentrok
FROM krs k
JOIN registrasi r ON k.id_registrasi = r.id_registrasi
JOIN mahasiswa m ON r.id_mahasiswa = m.id_mahasiswa
WHERE k.id_krs IN (1, 2, 3, 4, 5)
ORDER BY k.id_krs;

\echo ''
\echo '=========================================='
\echo 'QUERY KOMBINASI MENGGUNAKAN FUNCTIONS'
\echo '=========================================='

\echo ''
\echo 'TOP 10 MAHASISWA DENGAN IPK TERTINGGI:'
\echo '------------------------------------------'

SELECT 
    r.npm,
    m.nama as nama_mahasiswa,
    p.nama_prodi,
    hitung_ipk(m.id_mahasiswa) as ipk,
    get_total_sks_mahasiswa(m.id_mahasiswa) as total_sks
FROM mahasiswa m
JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
JOIN prodi p ON r.id_prodi = p.id_prodi
WHERE hitung_ipk(m.id_mahasiswa) > 0
ORDER BY ipk DESC, total_sks DESC
LIMIT 10;

\echo ''
\echo 'MAHASISWA DENGAN KEHADIRAN RENDAH (<80%) DI KELAS ALGORITMA:'
\echo '------------------------------------------'

SELECT 
    r.npm,
    m.nama as nama_mahasiswa,
    ROUND(get_persentase_kehadiran(m.id_mahasiswa, 1), 2) as persentase_kehadiran
FROM mahasiswa m
JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
JOIN krs kr ON r.id_registrasi = kr.id_registrasi
JOIN krs_detail kd ON kr.id_krs = kd.id_krs
WHERE kd.id_kelas = 1 -- Kelas Algoritma TI-1A
AND get_persentase_kehadiran(m.id_mahasiswa, 1) < 80
ORDER BY persentase_kehadiran ASC;

\echo ''
\echo 'STATISTIK KELULUSAN PER MATA KULIAH:'
\echo '------------------------------------------'

SELECT 
    mk.kode_mk,
    mk.nama_mk,
    s.total_mahasiswa,
    s.rata_rata_nilai,
    s.jumlah_lulus,
    s.persentase_kelulusan
FROM mata_kuliah mk
CROSS JOIN LATERAL get_statistik_nilai_mk(mk.id_mk, 1) s
WHERE s.total_mahasiswa > 0
ORDER BY s.persentase_kelulusan DESC;

\echo ''
\echo '=========================================='
\echo 'TESTING SELESAI!'
\echo '=========================================='