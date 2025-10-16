-- Contoh TRANSACTION untuk proses KRS mahasiswa

BEGIN;

-- 1. Mahasiswa buat KRS
INSERT INTO krs (id_registrasi, id_semester, status_validasi)
VALUES (10, 5, false)
RETURNING id_krs;

-- 2. Tambahkan mata kuliah yang diambil (minimal satu)
INSERT INTO krs_detail (id_krs, id_kelas)
VALUES (currval(pg_get_serial_sequence('krs', 'id_krs')), 8),
       (currval(pg_get_serial_sequence('krs', 'id_krs')), 9);

COMMIT;

-- Contoh transaksi untuk update nilai dan IPK

BEGIN;

-- 1. Update nilai huruf dan bobot di KRS detail
UPDATE krs_detail
SET nilai_huruf = 'A', nilai_bobot = 4.00, nilai_akhir = 90.00
WHERE id_krs_detail = 12;

-- 2. Update IPK di transkrip mahasiswa bersangkutan
UPDATE transkrip
SET ipk = (
  SELECT ROUND(AVG(nilai_bobot), 2)
  FROM krs_detail kd
  JOIN krs k ON kd.id_krs = k.id_krs
  WHERE k.id_registrasi = transkrip.id_registrasi
)
WHERE id_registrasi = (
  SELECT k.id_registrasi
  FROM krs k
  JOIN krs_detail kd ON k.id_krs = kd.id_krs
  WHERE kd.id_krs_detail = 12
);

COMMIT;


-- Contoh transaksi untuk presensi dan update nilai mutu

BEGIN;

-- 1. Mahasiswa melakukan presensi
INSERT INTO presensi_mahasiswa (id_pertemuan, id_mahasiswa, status_kehadiran)
VALUES (8, 15, 'hadir');

-- 2. Update nilai_mutu (contoh: tiap kehadiran = +5 poin)
UPDATE krs_detail
SET nilai_mutu = (
  SELECT COUNT(*) * 5
  FROM presensi_mahasiswa pm
  JOIN presensi_pertemuan pp ON pm.id_pertemuan = pp.id_pertemuan
  JOIN jadwal j ON pp.id_jadwal = j.id_jadwal
  WHERE pm.id_mahasiswa = 15
)
WHERE id_kelas = (
  SELECT j.id_kelas
  FROM presensi_pertemuan pp
  JOIN jadwal j ON pp.id_jadwal = j.id_jadwal
  WHERE pp.id_pertemuan = 8
);

COMMIT;
