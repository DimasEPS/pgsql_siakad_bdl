# SIAKADU Database Testing Data

Koleksi file SQL untuk testing dan demonstrasi database Sistem Akademik (SIAKADU).

## Deskripsi File

### 1. Data Insert Files

- **01_insert_basic_data.sql** - Data dasar: roles, fakultas, jurusan, prodi, gedung, ruang, semester
- **02_insert_users_dosen.sql** - Data users dan dosen (20 dosen)
- **03_insert_users_mahasiswa.sql** - Data users dan mahasiswa (40 mahasiswa)
- **04_insert_matakuliah_kelas.sql** - Data mata kuliah, kelas, dan registrasi mahasiswa
- **05_insert_jadwal_pengajar.sql** - Data jadwal kuliah dan pengajar
- **06_insert_krs_nilai.sql** - Data KRS, nilai, dan transkrip
- **07_insert_presensi_kuesioner.sql** - Data presensi dan kuesioner evaluasi

### 2. Database Functions

- **08_functions.sql** - Functions untuk berbagai keperluan sistem:
  - `hitung_ipk()` - Menghitung IPK mahasiswa
  - `get_transkrip_mahasiswa()` - Mendapatkan transkrip mahasiswa
  - `get_total_sks_mahasiswa()` - Total SKS yang sudah diambil
  - `get_jadwal_mahasiswa()` - Jadwal kuliah mahasiswa per semester
  - `get_mahasiswa_kelas()` - Daftar mahasiswa dalam kelas
  - `get_persentase_kehadiran()` - Persentase kehadiran mahasiswa
  - `get_statistik_nilai_mk()` - Statistik nilai per mata kuliah
  - `validasi_krs_bentrok()` - Validasi bentrok jadwal KRS

### 3. Database Indexes

- **09_indexes.sql** - Indexes untuk optimasi performa database:
  - Index untuk semua tabel utama
  - Index komposit untuk query kompleks
  - Index partial untuk data aktif
  - Index untuk full-text search

### 4. Execution Script

- **10_execute_all.sql** - Script untuk menjalankan semua file secara berurutan

## Cara Penggunaan

### Menjalankan Semua File Sekaligus

```sql
-- Dari psql command line:
\i 10_execute_all.sql
```

### Menjalankan File Individual

```sql
-- Jalankan secara berurutan:
\i 01_insert_basic_data.sql
\i 02_insert_users_dosen.sql
\i 03_insert_users_mahasiswa.sql
\i 04_insert_matakuliah_kelas.sql
\i 05_insert_jadwal_pengajar.sql
\i 06_insert_krs_nilai.sql
\i 07_insert_presensi_kuesioner.sql
\i 08_functions.sql
\i 09_indexes.sql
```

### Menggunakan Command Line

```bash
# Menjalankan schema utama terlebih dahulu
psql -d siakadu -f siakadu.sql

# Menjalankan semua data testing
psql -d siakadu -f 10_execute_all.sql

# Atau menjalankan file individual
psql -d siakadu -f 01_insert_basic_data.sql
psql -d siakadu -f 02_insert_users_dosen.sql
# ... dan seterusnya
```

## Data Testing yang Dihasilkan

### Users & Authentication

- 1 Admin
- 1 Staff Akademik
- 20 Dosen
- 40 Mahasiswa

### Data Akademik

- 4 Fakultas (FTI, FE, FH, FK)
- 6 Jurusan
- 7 Program Studi
- 23 Mata Kuliah
- 24 Kelas
- 25 Jadwal Kuliah

### Data Mahasiswa

- 40 Registrasi mahasiswa dari berbagai prodi:
  - 20 mahasiswa Teknik Informatika S1
  - 5 mahasiswa Sistem Informasi S1
  - 5 mahasiswa Manajemen S1
  - 5 mahasiswa Akuntansi S1
  - 3 mahasiswa Ilmu Hukum S1
  - 2 mahasiswa Pendidikan Dokter S1

### Data Nilai & KRS

- 40 KRS dengan status validasi
- Data nilai lengkap untuk beberapa mahasiswa
- Transkrip untuk 5 mahasiswa sampel

### Data Presensi

- 15 pertemuan kuliah
- Data presensi mahasiswa dengan berbagai status
- 3 kuesioner evaluasi
- 10 pertanyaan kuesioner
- 15 respon kuesioner

### Fasilitas

- 5 Gedung
- 12 Ruang kuliah

## Functions yang Tersedia

Setelah menjalankan script, Anda dapat menggunakan functions berikut:

```sql
-- Menghitung IPK mahasiswa
SELECT hitung_ipk(1);

-- Mendapatkan transkrip mahasiswa
SELECT * FROM get_transkrip_mahasiswa(1);

-- Mendapatkan jadwal mahasiswa
SELECT * FROM get_jadwal_mahasiswa(1, 1);

-- Mendapatkan daftar mahasiswa dalam kelas
SELECT * FROM get_mahasiswa_kelas(1);

-- Menghitung persentase kehadiran
SELECT get_persentase_kehadiran(1, 1);

-- Mendapatkan statistik nilai mata kuliah
SELECT * FROM get_statistik_nilai_mk(1, 1);

-- Validasi bentrok jadwal KRS
SELECT validasi_krs_bentrok(1);
```

## Query Testing Sampel

```sql
-- Melihat mahasiswa dengan IPK tertinggi
SELECT m.nama, r.npm, hitung_ipk(m.id_mahasiswa) as ipk
FROM mahasiswa m
JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
ORDER BY ipk DESC LIMIT 10;

-- Melihat jadwal hari ini
SELECT * FROM get_jadwal_mahasiswa(1, 1)
WHERE hari = 'senin';

-- Statistik kehadiran per kelas
SELECT
    k.nama_kelas,
    COUNT(pm.id_mahasiswa) as total_presensi,
    COUNT(CASE WHEN pm.status_kehadiran = 'hadir' THEN 1 END) as hadir,
    ROUND(
        COUNT(CASE WHEN pm.status_kehadiran = 'hadir' THEN 1 END)::NUMERIC /
        COUNT(pm.id_mahasiswa)::NUMERIC * 100, 2
    ) as persentase_kehadiran
FROM kelas k
JOIN jadwal j ON k.id_kelas = j.id_kelas
JOIN presensi_pertemuan pp ON j.id_jadwal = pp.id_jadwal
JOIN presensi_mahasiswa pm ON pp.id_pertemuan = pm.id_pertemuan
GROUP BY k.id_kelas, k.nama_kelas
ORDER BY persentase_kehadiran DESC;
```

## Catatan Penting

1. **Urutan Eksekusi**: File harus dijalankan sesuai urutan karena ada dependencies antar tabel
2. **Password**: Semua user menggunakan password hash yang sama untuk testing
3. **Tanggal**: Data menggunakan tahun akademik 2023/2024
4. **Indexes**: File indexes menggunakan pg_trgm extension untuk full-text search
5. **Functions**: Semua functions menggunakan PL/pgSQL

## Requirements

- PostgreSQL 12+
- Extension pg_trgm (optional, untuk full-text search indexes)

## Troubleshooting

Jika ada error saat menjalankan script:

1. Pastikan database sudah dibuat dengan schema utama (`siakadu.sql`)
2. Pastikan urutan eksekusi file sudah benar
3. Check foreign key constraints jika ada error referential integrity
4. Pastikan user PostgreSQL memiliki privilege yang cukup

---

Database testing ini menyediakan data lengkap untuk demonstrasi sistem akademik dengan 40 mahasiswa, 20 dosen, dan data pendukung lainnya yang realistic untuk keperluan testing dan development.
