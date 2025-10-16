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


