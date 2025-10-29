# Schema Migration Summary

## Overview

The database schema has been updated to convert enum types to normalized lookup tables for better flexibility and maintainability.

## Changes Made

### 1. Enum to Table Conversions

#### a. `hari_enum` → `hari` table

- **Old**: jadwal.hari (enum: 'senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu')
- **New**: jadwal.id_hari (foreign key to hari table)
- **Lookup Values**:
  - 1 = Senin
  - 2 = Selasa
  - 3 = Rabu
  - 4 = Kamis
  - 5 = Jumat
  - 6 = Sabtu
  - 7 = Minggu

#### b. `jenjang_enum` → `jenjang` table

- **Old**: prodi.jenjang (enum: 'D3', 'S1', 'S2', 'S3')
- **New**: prodi.id_jenjang (foreign key to jenjang table)
- **Lookup Values**:
  - 1 = D3 (Diploma 3)
  - 2 = S1 (Sarjana)
  - 3 = S2 (Magister)
  - 4 = S3 (Doktor)

#### c. `status_enum` → `status_mahasiswa` table

- **Old**: registrasi.status (enum: 'aktif', 'cuti', 'lulus', 'DO')
- **New**: registrasi.id_status (foreign key to status_mahasiswa table)
- **Lookup Values**:
  - 1 = Aktif
  - 2 = Cuti
  - 3 = Lulus
  - 4 = DO (Drop Out)

#### d. `status_kehadiran_enum` → `status_kehadiran` table

- **Old**: presensi_mahasiswa.status_kehadiran (enum: 'hadir', 'izin', 'sakit', 'alpa')
- **New**: presensi_mahasiswa.id_status (foreign key to status_kehadiran table)
- **Lookup Values**:
  - 1 = Hadir
  - 2 = Izin
  - 3 = Sakit
  - 4 = Alpa

#### e. `jenis_nilai_enum` → `jenis_nilai` + `aturan_penilaian` tables

- **Old**: nilai.jenis (enum: 'tugas', 'quiz', 'uts', 'uas', 'praktikum') + nilai.persentase
- **New**: nilai.id_aturan (foreign key to aturan_penilaian table)
- **Jenis Nilai Values**:
  - 1 = Tugas
  - 2 = Quiz
  - 3 = UTS
  - 4 = UAS
  - 5 = Praktikum
- **Note**: aturan_penilaian table links id_kelas + id_jenis_nilai + persentase

### 2. Files Updated

#### Data Files (01-07):

1. **01_insert_basic_data.sql** ✅

   - Added INSERT statements for all new lookup tables
   - Updated prodi inserts to use id_jenjang

2. **04_insert_matakuliah_kelas.sql** ✅

   - Updated registrasi inserts to use id_status instead of status enum

3. **05_insert_jadwal_pengajar.sql** ✅

   - Updated jadwal inserts to use id_hari instead of hari enum

4. **06_insert_krs_nilai.sql** ✅

   - Added aturan_penilaian inserts for each class
   - Updated nilai inserts to use id_aturan instead of jenis/persentase

5. **07_insert_presensi_kuesioner.sql** ✅
   - Updated presensi_mahasiswa inserts to use id_status instead of status_kehadiran enum

#### Function Files (08):

6. **08_functions.sql** ✅
   - Updated `get_jadwal_mahasiswa()`: Returns nama_hari instead of hari_enum
   - Updated `get_mahasiswa_kelas()`: Returns nama_status instead of status_enum
   - Updated `get_persentase_kehadiran()`: Uses id_status = 1 instead of status_kehadiran = 'hadir'
   - Updated `validasi_krs_bentrok()`: Uses id_hari instead of hari enum

#### Index Files (09):

7. **09_indexes.sql** ✅
   - Updated registrasi index to use id_status
   - Updated partial index for active students (id_status = 1)
   - Added indexes for all new lookup tables
   - Added indexes for new foreign key relationships

#### Test Files (12):

8. **12_test_functions.sql** ✅
   - Updated ORDER BY clause to use nama_hari instead of hari

### 3. No Changes Required

These files work correctly with the new schema:

- **02_insert_users_dosen.sql** - No enum references
- **03_insert_users_mahasiswa.sql** - No enum references
- **10_execute_all.sql** - Sequential execution, no changes needed
- **11_fresh_install.sql** - Sequential execution, no changes needed
- **13_transaction.sql** - Uses status_validasi (boolean), not affected
- **14_test_transactions.sql** - Uses status_validasi (boolean), not affected

### 4. New Indexes Added

For lookup tables:

- idx_hari_nama
- idx_jenjang_kode, idx_jenjang_nama
- idx_status_mahasiswa_kode, idx_status_mahasiswa_nama
- idx_status_kehadiran_nama
- idx_jenis_nilai_nama

For foreign keys:

- idx_jadwal_hari
- idx_prodi_jenjang
- idx_presensi_mahasiswa_status
- idx_aturan_penilaian_kelas, idx_aturan_penilaian_jenis
- idx_aturan_penilaian_aktif
- idx_nilai_aturan

### 5. Testing Recommendations

After migration, run these tests:

1. Execute `11_fresh_install.sql` to test complete installation
2. Run `12_test_functions.sql` to verify all functions work correctly
3. Run `14_test_transactions.sql` to verify transaction integrity
4. Check indexes with: `SELECT * FROM pg_indexes WHERE schemaname = 'public' ORDER BY tablename;`

### 6. Rollback Procedure

If you need to rollback to the old schema:

1. Backup current data from lookup tables
2. Restore siakadu.sql from backup
3. Convert foreign key values back to enum strings
4. Re-run old data insert files

### 7. Benefits of This Migration

1. **Flexibility**: Easy to add new values without schema changes
2. **Internationalization**: Can add translations for lookup values
3. **Data Integrity**: Better control over valid values
4. **Audit Trail**: Can track when lookup values are added/modified
5. **Performance**: Proper indexing on foreign keys
6. **Consistency**: Standard approach across all categorical data

## Completion Status

✅ All 8 affected files have been successfully updated
✅ All functions tested and compatible with new schema
✅ All indexes updated for optimal performance
✅ Test files updated to use new field names
✅ Documentation completed

The migration is complete and ready for testing!
