-- ================================================
-- FILE: 09_indexes.sql
-- DESCRIPTION: Indexes untuk optimasi performa database siakadu
-- ================================================

-- Index untuk tabel users
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(id_role);
CREATE INDEX IF NOT EXISTS idx_users_deleted_at ON users(deleted_at);

-- Index untuk tabel mahasiswa
CREATE INDEX IF NOT EXISTS idx_mahasiswa_nik ON mahasiswa(nik);
CREATE INDEX IF NOT EXISTS idx_mahasiswa_nama ON mahasiswa(nama);
CREATE INDEX IF NOT EXISTS idx_mahasiswa_user ON mahasiswa(id_user);

-- Index untuk tabel dosen
CREATE INDEX IF NOT EXISTS idx_dosen_nidn ON dosen(nidn);
CREATE INDEX IF NOT EXISTS idx_dosen_nama ON dosen(nama);
CREATE INDEX IF NOT EXISTS idx_dosen_user ON dosen(id_user);

-- Index untuk tabel registrasi
-- UPDATED: id_status now references status_mahasiswa table
CREATE INDEX IF NOT EXISTS idx_registrasi_npm ON registrasi(npm);
CREATE INDEX IF NOT EXISTS idx_registrasi_mahasiswa ON registrasi(id_mahasiswa);
CREATE INDEX IF NOT EXISTS idx_registrasi_prodi ON registrasi(id_prodi);
CREATE INDEX IF NOT EXISTS idx_registrasi_dosen_pa ON registrasi(id_dosen_pa);
CREATE INDEX IF NOT EXISTS idx_registrasi_angkatan ON registrasi(angkatan);
CREATE INDEX IF NOT EXISTS idx_registrasi_status ON registrasi(id_status);
CREATE INDEX IF NOT EXISTS idx_registrasi_tanggal ON registrasi(tanggal_registerasi);

-- Index untuk tabel mata_kuliah
CREATE INDEX IF NOT EXISTS idx_mk_kode ON mata_kuliah(kode_mk);
CREATE INDEX IF NOT EXISTS idx_mk_nama ON mata_kuliah(nama_mk);
CREATE INDEX IF NOT EXISTS idx_mk_semester ON mata_kuliah(id_semester);
CREATE INDEX IF NOT EXISTS idx_mk_sks ON mata_kuliah(sks);

-- Index untuk tabel kelas
CREATE INDEX IF NOT EXISTS idx_kelas_mk ON kelas(id_mk);
CREATE INDEX IF NOT EXISTS idx_kelas_semester ON kelas(id_semester);
CREATE INDEX IF NOT EXISTS idx_kelas_prodi ON kelas(id_prodi);
CREATE INDEX IF NOT EXISTS idx_kelas_nama ON kelas(nama_kelas);

-- Index untuk tabel krs
CREATE INDEX IF NOT EXISTS idx_krs_registrasi ON krs(id_registrasi);
CREATE INDEX IF NOT EXISTS idx_krs_semester ON krs(id_semester);
CREATE INDEX IF NOT EXISTS idx_krs_tanggal ON krs(tanggal_pengajuan);
CREATE INDEX IF NOT EXISTS idx_krs_status ON krs(status_validasi);

-- Index untuk tabel krs_detail
CREATE INDEX IF NOT EXISTS idx_krs_detail_krs ON krs_detail(id_krs);
CREATE INDEX IF NOT EXISTS idx_krs_detail_kelas ON krs_detail(id_kelas);
CREATE INDEX IF NOT EXISTS idx_krs_detail_nilai_huruf ON krs_detail(nilai_huruf);
CREATE INDEX IF NOT EXISTS idx_krs_detail_nilai_akhir ON krs_detail(nilai_akhir);

-- Index untuk tabel jadwal
-- SCHEMA UPDATE: Removed idx_jadwal_dosen since jadwal.id_dosen no longer exists
CREATE INDEX IF NOT EXISTS idx_jadwal_ruang ON jadwal(id_ruang);
CREATE INDEX IF NOT EXISTS idx_jadwal_kelas ON jadwal(id_kelas);
CREATE INDEX IF NOT EXISTS idx_jadwal_hari_fk ON jadwal(id_hari);
CREATE INDEX IF NOT EXISTS idx_jadwal_waktu ON jadwal(waktu_mulai, waktu_selesai);

-- Index untuk tabel pengajar
CREATE INDEX IF NOT EXISTS idx_pengajar_dosen ON pengajar(id_dosen);
CREATE INDEX IF NOT EXISTS idx_pengajar_kelas ON pengajar(id_kelas);

-- Index untuk tabel nilai
CREATE INDEX IF NOT EXISTS idx_nilai_krs_detail ON nilai(id_krs_detail);
CREATE INDEX IF NOT EXISTS idx_nilai_aturan_fk ON nilai(id_aturan);
CREATE INDEX IF NOT EXISTS idx_nilai_nilai ON nilai(nilai);

-- Index untuk tabel semester
CREATE INDEX IF NOT EXISTS idx_semester_tahun ON semester(tahun_ajaran);
CREATE INDEX IF NOT EXISTS idx_semester_tipe ON semester(tipe_semester);

-- Index untuk tabel fakultas
CREATE INDEX IF NOT EXISTS idx_fakultas_kode ON fakultas(kode_fakultas);
CREATE INDEX IF NOT EXISTS idx_fakultas_nama ON fakultas(nama_fakultas);

-- Index untuk tabel jurusan
CREATE INDEX IF NOT EXISTS idx_jurusan_kode ON jurusan(kode_jurusan);
CREATE INDEX IF NOT EXISTS idx_jurusan_nama ON jurusan(nama_jurusan);
CREATE INDEX IF NOT EXISTS idx_jurusan_fakultas ON jurusan(id_fakultas);

-- Index untuk tabel prodi
CREATE INDEX IF NOT EXISTS idx_prodi_nama ON prodi(nama_prodi);
CREATE INDEX IF NOT EXISTS idx_prodi_jenjang_fk ON prodi(id_jenjang);
CREATE INDEX IF NOT EXISTS idx_prodi_jurusan ON prodi(id_jurusan);

-- Index untuk tabel ruang
CREATE INDEX IF NOT EXISTS idx_ruang_nama ON ruang(nama_ruang);
CREATE INDEX IF NOT EXISTS idx_ruang_gedung ON ruang(id_gedung);
CREATE INDEX IF NOT EXISTS idx_ruang_kapasitas ON ruang(kapasitas_ruang);

-- Index untuk tabel gedung
CREATE INDEX IF NOT EXISTS idx_gedung_nama ON gedung(nama_gedung);

-- Index untuk tabel transkrip
CREATE INDEX IF NOT EXISTS idx_transkrip_registrasi ON transkrip(id_registrasi);
CREATE INDEX IF NOT EXISTS idx_transkrip_ipk ON transkrip(ipk);
CREATE INDEX IF NOT EXISTS idx_transkrip_sks ON transkrip(total_sks);

-- Index untuk tabel presensi_pertemuan
CREATE INDEX IF NOT EXISTS idx_presensi_pertemuan_dosen ON presensi_pertemuan(id_dosen);
CREATE INDEX IF NOT EXISTS idx_presensi_pertemuan_jadwal ON presensi_pertemuan(id_jadwal);
CREATE INDEX IF NOT EXISTS idx_presensi_pertemuan_tanggal ON presensi_pertemuan(tanggal_pertemuan);
CREATE INDEX IF NOT EXISTS idx_presensi_pertemuan_ke ON presensi_pertemuan(pertemuan_ke);

-- Index untuk tabel presensi_mahasiswa
-- SCHEMA UPDATE: Changed id_mahasiswa to id_registrasi
CREATE INDEX IF NOT EXISTS idx_presensi_mahasiswa_pertemuan ON presensi_mahasiswa(id_pertemuan);
CREATE INDEX IF NOT EXISTS idx_presensi_mahasiswa_registrasi ON presensi_mahasiswa(id_registrasi);
CREATE INDEX IF NOT EXISTS idx_presensi_mahasiswa_status_fk ON presensi_mahasiswa(id_status);
CREATE INDEX IF NOT EXISTS idx_presensi_mahasiswa_waktu ON presensi_mahasiswa(waktu_absen);

-- Index untuk tabel kuesioner
CREATE INDEX IF NOT EXISTS idx_kuesioner_aktif ON kuesioner(aktif);
CREATE INDEX IF NOT EXISTS idx_kuesioner_tanggal_mulai ON kuesioner(tanggal_mulai);
CREATE INDEX IF NOT EXISTS idx_kuesioner_tanggal_selesai ON kuesioner(tanggal_selesai);

-- Index untuk tabel pertanyaan_kuesioner
CREATE INDEX IF NOT EXISTS idx_pertanyaan_kuesioner ON pertanyaan_kuesioner(id_kuesioner);
CREATE INDEX IF NOT EXISTS idx_pertanyaan_tipe ON pertanyaan_kuesioner(tipe_jawaban);

-- Index untuk tabel respon_kuesioner
-- SCHEMA UPDATE: Changed id_mahasiswa to id_registrasi
CREATE INDEX IF NOT EXISTS idx_respon_pertanyaan ON respon_kuesioner(id_pertanyaan);
CREATE INDEX IF NOT EXISTS idx_respon_registrasi ON respon_kuesioner(id_registrasi);
CREATE INDEX IF NOT EXISTS idx_respon_dosen ON respon_kuesioner(id_dosen);
CREATE INDEX IF NOT EXISTS idx_respon_kelas ON respon_kuesioner(id_kelas);
CREATE INDEX IF NOT EXISTS idx_respon_semester ON respon_kuesioner(id_semester);
CREATE INDEX IF NOT EXISTS idx_respon_tanggal ON respon_kuesioner(tanggal_respon);

-- Index komposit untuk query yang sering digunakan
-- SCHEMA UPDATE: Changed id_mahasiswa to id_registrasi in composite index
CREATE INDEX IF NOT EXISTS idx_krs_registrasi_semester ON krs(id_registrasi, id_semester);
CREATE INDEX IF NOT EXISTS idx_krs_detail_krs_kelas ON krs_detail(id_krs, id_kelas);
CREATE INDEX IF NOT EXISTS idx_jadwal_hari_waktu ON jadwal(id_hari, waktu_mulai, waktu_selesai);
CREATE INDEX IF NOT EXISTS idx_mahasiswa_prodi_angkatan ON registrasi(id_prodi, angkatan);
CREATE INDEX IF NOT EXISTS idx_presensi_mahasiswa_pertemuan_status ON presensi_mahasiswa(id_pertemuan, id_registrasi, id_status);

-- Index untuk pencarian berdasarkan tanggal
CREATE INDEX IF NOT EXISTS idx_mata_kuliah_tanggal_dibuat ON mata_kuliah(tanggal_dibuat);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at);

-- Index partial untuk data aktif
-- UPDATED: Uses id_status = 1 (Aktif) instead of status = 'aktif'
CREATE INDEX IF NOT EXISTS idx_registrasi_aktif ON registrasi(id_mahasiswa, id_prodi) WHERE id_status = 1;
CREATE INDEX IF NOT EXISTS idx_kuesioner_aktif_periode ON kuesioner(tanggal_mulai, tanggal_selesai) WHERE aktif = true;
CREATE INDEX IF NOT EXISTS idx_users_active ON users(id_user, id_role) WHERE deleted_at IS NULL;

-- Indexes for new lookup tables
CREATE INDEX IF NOT EXISTS idx_hari_nama ON hari(nama_hari);
CREATE INDEX IF NOT EXISTS idx_jenjang_kode ON jenjang(kode);
CREATE INDEX IF NOT EXISTS idx_jenjang_nama ON jenjang(nama_jenjang);
CREATE INDEX IF NOT EXISTS idx_status_mahasiswa_kode ON status_mahasiswa(kode);
CREATE INDEX IF NOT EXISTS idx_status_mahasiswa_nama ON status_mahasiswa(nama_status);
CREATE INDEX IF NOT EXISTS idx_status_kehadiran_nama ON status_kehadiran(nama_status);
CREATE INDEX IF NOT EXISTS idx_jenis_nilai_nama ON jenis_nilai(nama_nilai);

-- Indexes for new foreign key relationships
CREATE INDEX IF NOT EXISTS idx_jadwal_hari ON jadwal(id_hari);
CREATE INDEX IF NOT EXISTS idx_prodi_jenjang ON prodi(id_jenjang);
CREATE INDEX IF NOT EXISTS idx_presensi_mahasiswa_status ON presensi_mahasiswa(id_status);
CREATE INDEX IF NOT EXISTS idx_aturan_penilaian_kelas ON aturan_penilaian(id_kelas);
CREATE INDEX IF NOT EXISTS idx_aturan_penilaian_jenis ON aturan_penilaian(id_jenis_nilai);
CREATE INDEX IF NOT EXISTS idx_aturan_penilaian_aktif ON aturan_penilaian(id_kelas, aktif) WHERE aktif = true;
CREATE INDEX IF NOT EXISTS idx_nilai_aturan ON nilai(id_aturan);

-- Enable pg_trgm extension for full-text search
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Index untuk full-text search (jika diperlukan)
-- Note: Hanya dibuat jika extension pg_trgm berhasil diaktifkan
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_trgm') THEN
        CREATE INDEX IF NOT EXISTS idx_mahasiswa_nama_trgm ON mahasiswa USING gin(nama gin_trgm_ops);
        CREATE INDEX IF NOT EXISTS idx_dosen_nama_trgm ON dosen USING gin(nama gin_trgm_ops);
        CREATE INDEX IF NOT EXISTS idx_mk_nama_trgm ON mata_kuliah USING gin(nama_mk gin_trgm_ops);
        RAISE NOTICE 'Full-text search indexes created successfully';
    ELSE
        RAISE NOTICE 'pg_trgm extension not available, skipping full-text search indexes';
    END IF;
EXCEPTION
    WHEN others THEN
        RAISE NOTICE 'Could not create full-text search indexes: %', SQLERRM;
END $$;