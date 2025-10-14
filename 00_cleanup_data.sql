-- ================================================
-- FILE: 00_cleanup_data.sql
-- DESCRIPTION: Script untuk membersihkan data testing
-- ================================================

\echo 'Membersihkan data testing dari database siakadu...'
\echo '=================================================='

-- Hapus data dalam urutan yang benar (sesuai foreign key dependencies)
DELETE FROM respon_kuesioner;
DELETE FROM pertanyaan_kuesioner;
DELETE FROM kuesioner;
DELETE FROM presensi_mahasiswa;
DELETE FROM presensi_pertemuan;
DELETE FROM nilai;
DELETE FROM transkrip;
DELETE FROM krs_detail;
DELETE FROM krs;
DELETE FROM pengajar;
DELETE FROM jadwal;
DELETE FROM kelas;
DELETE FROM mata_kuliah;
DELETE FROM registrasi;
DELETE FROM mahasiswa;
DELETE FROM dosen;
DELETE FROM users WHERE id_role IN (1, 2, 3, 4); -- hapus semua user testing
DELETE FROM ruang;
DELETE FROM gedung;
DELETE FROM semester;
DELETE FROM prodi;
DELETE FROM jurusan;
DELETE FROM fakultas;
DELETE FROM role;

-- Reset sequences
ALTER SEQUENCE role_id_role_seq RESTART WITH 1;
ALTER SEQUENCE fakultas_id_fakultas_seq RESTART WITH 1;
ALTER SEQUENCE jurusan_id_jurusan_seq RESTART WITH 1;
ALTER SEQUENCE prodi_id_prodi_seq RESTART WITH 1;
ALTER SEQUENCE gedung_id_gedung_seq RESTART WITH 1;
ALTER SEQUENCE ruang_id_ruang_seq RESTART WITH 1;
ALTER SEQUENCE semester_id_semester_seq RESTART WITH 1;
ALTER SEQUENCE users_id_user_seq RESTART WITH 1;
ALTER SEQUENCE dosen_id_dosen_seq RESTART WITH 1;
ALTER SEQUENCE mahasiswa_id_mahasiswa_seq RESTART WITH 1;
ALTER SEQUENCE registrasi_id_registrasi_seq RESTART WITH 1;
ALTER SEQUENCE mata_kuliah_id_mk_seq RESTART WITH 1;
ALTER SEQUENCE kelas_id_kelas_seq RESTART WITH 1;
ALTER SEQUENCE jadwal_id_jadwal_seq RESTART WITH 1;
ALTER SEQUENCE pengajar_id_pengajar_seq RESTART WITH 1;
ALTER SEQUENCE krs_id_krs_seq RESTART WITH 1;
ALTER SEQUENCE krs_detail_id_krs_detail_seq RESTART WITH 1;
ALTER SEQUENCE nilai_id_nilai_seq RESTART WITH 1;
ALTER SEQUENCE transkrip_id_transkrip_seq RESTART WITH 1;
ALTER SEQUENCE presensi_pertemuan_id_pertemuan_seq RESTART WITH 1;
ALTER SEQUENCE presensi_mahasiswa_id_presensi_seq RESTART WITH 1;
ALTER SEQUENCE kuesioner_id_kuesioner_seq RESTART WITH 1;
ALTER SEQUENCE pertanyaan_kuesioner_id_pertanyaan_seq RESTART WITH 1;
ALTER SEQUENCE respon_kuesioner_id_respon_seq RESTART WITH 1;

\echo 'Data testing berhasil dibersihkan!'
\echo 'Database siap untuk insert data baru.'