CREATE TYPE "hari_enum" AS ENUM (
  'senin',
  'selasa',
  'rabu',
  'kamis',
  'jumat',
  'sabtu',
  'minggu'
);

CREATE TYPE "jenjang_enum" AS ENUM (
  'D3',
  'S1',
  'S2',
  'S3'
);

CREATE TYPE "nilai_huruf_enum" AS ENUM (
  'A',
  'B+',
  'B',
  'C+',
  'C',
  'D',
  'E'
);

CREATE TYPE "semester_enum" AS ENUM (
  'ganjil',
  'genap'
);

CREATE TYPE "status_enum" AS ENUM (
  'aktif',
  'cuti',
  'lulus',
  'DO'
);

CREATE TYPE "status_kehadiran_enum" AS ENUM (
  'hadir',
  'izin',
  'sakit',
  'alpa'
);

CREATE TYPE "jenis_nilai_enum" AS ENUM (
  'tugas',
  'quiz',
  'uts',
  'uas',
  'praktikum'
);

CREATE TABLE "dosen" (
  "id_dosen" SERIAL PRIMARY KEY NOT NULL,
  "nama" varchar(160) NOT NULL,
  "nidn" varchar(15) UNIQUE NOT NULL,
  "id_user" int4 UNIQUE NOT NULL
);

CREATE TABLE "fakultas" (
  "id_fakultas" SERIAL PRIMARY KEY NOT NULL,
  "kode_fakultas" varchar(10) UNIQUE NOT NULL,
  "nama_fakultas" varchar(100) NOT NULL
);

CREATE TABLE "gedung" (
  "id_gedung" SERIAL PRIMARY KEY NOT NULL,
  "nama_gedung" varchar(50) NOT NULL,
  "alamat" varchar(255) NOT NULL
);

CREATE TABLE "jadwal" (
  "id_jadwal" SERIAL PRIMARY KEY NOT NULL,
  "id_dosen"  int4,
  "id_ruang" int4 NOT NULL,
  "waktu_mulai" time(6) NOT NULL,
  "waktu_selesai" time(6) NOT NULL,
  "id_kelas" int4 NOT NULL,
  "hari" hari_enum
);

CREATE TABLE "jurusan" (
  "id_jurusan" SERIAL PRIMARY KEY NOT NULL,
  "kode_jurusan" varchar(10) UNIQUE NOT NULL,
  "nama_jurusan" varchar(100) NOT NULL,
  "id_fakultas" int4 NOT NULL
);

CREATE TABLE "kelas" (
  "id_kelas" SERIAL PRIMARY KEY NOT NULL,
  "id_mk" int4 NOT NULL,
  "id_semester" int4 NOT NULL,
  "id_prodi" int4 NOT NULL,
  "kapasitas_kelas" int4 NOT NULL,
  "nama_kelas" varchar(10) NOT NULL
);

CREATE TABLE "krs" (
  "id_krs" SERIAL PRIMARY KEY NOT NULL,
  "id_registrasi" int4 NOT NULL,
  "id_semester" int4 NOT NULL,
  "tanggal_pengajuan" date NOT NULL DEFAULT (CURRENT_DATE),
  "status_validasi" bool NOT NULL DEFAULT false
);

CREATE TABLE "krs_detail" (
  "id_krs_detail" SERIAL PRIMARY KEY NOT NULL,
  "id_krs" int4 NOT NULL,
  "id_kelas" int4 NOT NULL,
  "nilai_mutu" numeric(3,2),
  "nilai_huruf" nilai_huruf_enum,
  "nilai_bobot" numeric(4,2),
  "nilai_akhir" numeric(5,2)
);

CREATE TABLE "mahasiswa" (
  "id_mahasiswa" SERIAL PRIMARY KEY NOT NULL,
  "nama" varchar(160) NOT NULL,
  "nik" varchar(20) UNIQUE NOT NULL,
  "tanggal_lahir" date NOT NULL,
  "alamat" text,
  "id_user" int4 UNIQUE NOT NULL
);

CREATE TABLE "mata_kuliah" (
  "id_mk" SERIAL PRIMARY KEY NOT NULL,
  "id_semester" int4,
  "kode_mk" varchar(10) UNIQUE NOT NULL,
  "nama_mk" varchar(100) NOT NULL,
  "sks" int2 NOT NULL,
  "tanggal_dibuat" timestamp(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "nilai" (
  "id_nilai" SERIAL PRIMARY KEY NOT NULL,
  "id_krs_detail" int4 NOT NULL,
  "jenis" jenis_nilai_enum NOT NULL,
  "persentase" numeric(5,2) NOT NULL,
  "nilai" numeric(5,2) NOT NULL
);

CREATE TABLE "pengajar" (
  "id_pengajar" SERIAL PRIMARY KEY NOT NULL,
  "id_dosen" int4 NOT NULL,
  "id_kelas" int4 NOT NULL
);

CREATE TABLE "prodi" (
  "id_prodi" SERIAL PRIMARY KEY NOT NULL,
  "nama_prodi" varchar(100) NOT NULL,
  "jenjang" jenjang_enum NOT NULL,
  "id_jurusan" int4 NOT NULL
);

CREATE TABLE "registrasi" (
  "id_registrasi" SERIAL PRIMARY KEY NOT NULL,
  "id_dosen_pa" int4 NOT NULL,
  "id_mahasiswa" int4 NOT NULL,
  "id_prodi" int4 NOT NULL,
  "npm" varchar(20) NOT NULL,
  "angkatan" int4 NOT NULL,
  "status" status_enum NOT NULL,
  "tanggal_registerasi" timestamp(6) NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "role" (
  "id_role" SERIAL PRIMARY KEY NOT NULL,
  "nama_role" varchar(50) UNIQUE NOT NULL,
  "deskripsi" text
);

CREATE TABLE "ruang" (
  "id_ruang" SERIAL PRIMARY KEY NOT NULL,
  "nama_ruang" varchar(10) NOT NULL,
  "kapasitas_ruang" int4 NOT NULL,
  "id_gedung" int4 NOT NULL
);

CREATE TABLE "semester" (
  "id_semester" SERIAL PRIMARY KEY NOT NULL,
  "tahun_ajaran" varchar(9) NOT NULL,
  "tipe_semester" semester_enum NOT NULL
);

CREATE TABLE "transkrip" (
  "id_transkrip" SERIAL PRIMARY KEY NOT NULL,
  "id_registrasi" int4 UNIQUE NOT NULL,
  "total_sks" int2 NOT NULL,
  "ipk" numeric(3,2) NOT NULL
);

CREATE TABLE "users" (
  "id_user" SERIAL PRIMARY KEY NOT NULL,
  "username" varchar(50) UNIQUE NOT NULL,
  "password" varchar(255) NOT NULL,
  "email" varchar(255) UNIQUE NOT NULL,
  "id_role" int4 NOT NULL,
  "created_at" timestamp(6) DEFAULT (CURRENT_TIMESTAMP),
  "deleted_at" timestamp(6)
);

CREATE TABLE "presensi_pertemuan" (
  "id_pertemuan" SERIAL PRIMARY KEY,
  "id_dosen" int4 NOT NULL,
  "id_jadwal" int4 NOT NULL,
  "tanggal_pertemuan" date NOT NULL,
  "materi" text,
  "pertemuan_ke" int4 NOT NULL
);

CREATE TABLE "presensi_mahasiswa" (
  "id_presensi" SERIAL PRIMARY KEY,
  "id_pertemuan" int4 NOT NULL,
  "id_mahasiswa" int4 NOT NULL,
  "status_kehadiran" status_kehadiran_enum NOT NULL DEFAULT 'hadir',
  "waktu_absen" timestamp(6) DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "kuesioner" (
  "id_kuesioner" SERIAL PRIMARY KEY,
  "judul" varchar(255) NOT NULL,
  "deskripsi" text,
  "aktif" bool DEFAULT true,
  "tanggal_mulai" date,
  "tanggal_selesai" date
);

CREATE TABLE "pertanyaan_kuesioner" (
  "id_pertanyaan" SERIAL PRIMARY KEY,
  "id_kuesioner" int4 NOT NULL,
  "teks_pertanyaan" text NOT NULL,
  "tipe_jawaban" varchar(20) NOT NULL DEFAULT 'skala'
);

CREATE TABLE "respon_kuesioner" (
  "id_respon" SERIAL PRIMARY KEY,
  "id_pertanyaan" int4 NOT NULL,
  "id_mahasiswa" int4 NOT NULL,
  "id_dosen" int4 NOT NULL,
  "id_kelas" int4 NOT NULL,
  "id_semester" int4 NOT NULL,
  "jawaban" text NOT NULL,
  "tanggal_respon" timestamp(6) DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE "dosen" ADD CONSTRAINT "fk_dosen_id_user" FOREIGN KEY ("id_user") REFERENCES "users" ("id_user") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "mata_kuliah" ADD CONSTRAINT "fk_mk_id_semester" FOREIGN KEY ("id_semester") REFERENCES "semester" ("id_semester");

ALTER TABLE "jadwal" ADD CONSTRAINT "fk_jadwal_id_dosen" FOREIGN KEY ("id_dosen") REFERENCES "dosen" ("id_dosen");

ALTER TABLE "jadwal" ADD CONSTRAINT "fk_jadwal_id_ruang" FOREIGN KEY ("id_ruang") REFERENCES "ruang" ("id_ruang") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "jadwal" ADD CONSTRAINT "fk_jadwal_kelas" FOREIGN KEY ("id_kelas") REFERENCES "kelas" ("id_kelas") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "jurusan" ADD CONSTRAINT "fk_jurusan_id_fakultas" FOREIGN KEY ("id_fakultas") REFERENCES "fakultas" ("id_fakultas") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "kelas" ADD CONSTRAINT "fk_kelas_id_mk" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah" ("id_mk") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "kelas" ADD CONSTRAINT "fk_kelas_id_prodi" FOREIGN KEY ("id_prodi") REFERENCES "prodi" ("id_prodi") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "kelas" ADD CONSTRAINT "fk_kelas_id_semester" FOREIGN KEY ("id_semester") REFERENCES "semester" ("id_semester") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "krs" ADD CONSTRAINT "fk_krs_id_registrasi" FOREIGN KEY ("id_registrasi") REFERENCES "registrasi" ("id_registrasi") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "krs" ADD CONSTRAINT "fk_krs_id_semester" FOREIGN KEY ("id_semester") REFERENCES "semester" ("id_semester") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "krs_detail" ADD CONSTRAINT "fk_krs_detail_id_kelas" FOREIGN KEY ("id_kelas") REFERENCES "kelas" ("id_kelas") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "krs_detail" ADD CONSTRAINT "fk_krs_detail_id_krs" FOREIGN KEY ("id_krs") REFERENCES "krs" ("id_krs") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "mahasiswa" ADD CONSTRAINT "fk_mahasiswa_id_user" FOREIGN KEY ("id_user") REFERENCES "users" ("id_user") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "nilai" ADD CONSTRAINT "fk_nilai_id_krs_detail" FOREIGN KEY ("id_krs_detail") REFERENCES "krs_detail" ("id_krs_detail") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "pengajar" ADD CONSTRAINT "fk_pengajar_id_dosen" FOREIGN KEY ("id_dosen") REFERENCES "dosen" ("id_dosen") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "pengajar" ADD CONSTRAINT "fk_pengajar_id_kelas" FOREIGN KEY ("id_kelas") REFERENCES "kelas" ("id_kelas") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "prodi" ADD CONSTRAINT "fk_prodi_id_jurusan" FOREIGN KEY ("id_jurusan") REFERENCES "jurusan" ("id_jurusan") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "registrasi" ADD CONSTRAINT "fk_registrasi_id_dosen" FOREIGN KEY ("id_dosen_pa") REFERENCES "dosen" ("id_dosen") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "registrasi" ADD CONSTRAINT "fk_registrasi_id_mahasiswa" FOREIGN KEY ("id_mahasiswa") REFERENCES "mahasiswa" ("id_mahasiswa") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "registrasi" ADD CONSTRAINT "fk_registrasi_id_prodi" FOREIGN KEY ("id_prodi") REFERENCES "prodi" ("id_prodi") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ruang" ADD CONSTRAINT "fk_ruang_id_gedung" FOREIGN KEY ("id_gedung") REFERENCES "gedung" ("id_gedung") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "transkrip" ADD CONSTRAINT "fk_transkrip_id_registrasi" FOREIGN KEY ("id_registrasi") REFERENCES "registrasi" ("id_registrasi") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "users" ADD CONSTRAINT "fk_users_id_role" FOREIGN KEY ("id_role") REFERENCES "role" ("id_role") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "presensi_pertemuan" ADD CONSTRAINT "fk_presensi_pertemuan_id_jadwal" FOREIGN KEY ("id_jadwal") REFERENCES "jadwal" ("id_jadwal");

ALTER TABLE "presensi_mahasiswa" ADD CONSTRAINT "fk_presensi_mahasiswa_id_pertemuan" FOREIGN KEY ("id_pertemuan") REFERENCES "presensi_pertemuan" ("id_pertemuan");

ALTER TABLE "presensi_mahasiswa" ADD CONSTRAINT "fk_presensi_mahasiswa_id_mahasiswa" FOREIGN KEY ("id_mahasiswa") REFERENCES "mahasiswa" ("id_mahasiswa");

ALTER TABLE "pertanyaan_kuesioner" ADD CONSTRAINT "fk_pertanyaan_id_kuesioner" FOREIGN KEY ("id_kuesioner") REFERENCES "kuesioner" ("id_kuesioner");

ALTER TABLE "respon_kuesioner" ADD CONSTRAINT "fk_respon_id_pertanyaan" FOREIGN KEY ("id_pertanyaan") REFERENCES "pertanyaan_kuesioner" ("id_pertanyaan");

ALTER TABLE "respon_kuesioner" ADD CONSTRAINT "fk_respon_id_mahasiswa" FOREIGN KEY ("id_mahasiswa") REFERENCES "mahasiswa" ("id_mahasiswa");

ALTER TABLE "respon_kuesioner" ADD CONSTRAINT "fk_respon_id_dosen" FOREIGN KEY ("id_dosen") REFERENCES "dosen" ("id_dosen");

ALTER TABLE "respon_kuesioner" ADD CONSTRAINT "fk_respon_id_kelas" FOREIGN KEY ("id_kelas") REFERENCES "kelas" ("id_kelas");

ALTER TABLE "presensi_pertemuan" ADD CONSTRAINT "fk_presensi_pertemuan_id_dosen" FOREIGN KEY ("id_dosen") REFERENCES "dosen" ("id_dosen");

ALTER TABLE "respon_kuesioner" ADD CONSTRAINT "fk_respon_id_semester" FOREIGN KEY ("id_semester") REFERENCES "semester" ("id_semester");
