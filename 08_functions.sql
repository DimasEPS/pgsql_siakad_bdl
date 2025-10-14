-- ================================================
-- FILE: 08_functions.sql
-- DESCRIPTION: Functions untuk sistem siakadu
-- ================================================

-- Function untuk menghitung IPK mahasiswa
CREATE OR REPLACE FUNCTION hitung_ipk(p_id_mahasiswa INT)
RETURNS NUMERIC(3,2) AS $$
DECLARE
    total_bobot NUMERIC := 0;
    total_sks INT := 0;
    ipk NUMERIC(3,2);
BEGIN
    SELECT 
        COALESCE(SUM(kd.nilai_bobot), 0),
        COALESCE(SUM(mk.sks), 0)
    INTO total_bobot, total_sks
    FROM krs_detail kd
    JOIN kelas k ON kd.id_kelas = k.id_kelas
    JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
    JOIN krs kr ON kd.id_krs = kr.id_krs
    JOIN registrasi r ON kr.id_registrasi = r.id_registrasi
    WHERE r.id_mahasiswa = p_id_mahasiswa
    AND kd.nilai_bobot IS NOT NULL;
    
    IF total_sks > 0 THEN
        ipk := total_bobot / total_sks;
    ELSE
        ipk := 0.00;
    END IF;
    
    RETURN ROUND(ipk, 2);
END;
$$ LANGUAGE plpgsql;

-- Function untuk mendapatkan transkrip mahasiswa
CREATE OR REPLACE FUNCTION get_transkrip_mahasiswa(p_id_mahasiswa INT)
RETURNS TABLE (
    kode_mk VARCHAR(10),
    nama_mk VARCHAR(100),
    sks INT,
    nilai_huruf nilai_huruf_enum,
    nilai_mutu NUMERIC(3,2),
    nilai_bobot NUMERIC(4,2),
    semester VARCHAR(20)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        mk.kode_mk,
        mk.nama_mk,
        mk.sks::INT,
        kd.nilai_huruf,
        kd.nilai_mutu,
        kd.nilai_bobot,
        CONCAT(s.tahun_ajaran, ' ', s.tipe_semester::text) as semester
    FROM krs_detail kd
    JOIN kelas k ON kd.id_kelas = k.id_kelas
    JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
    JOIN semester s ON k.id_semester = s.id_semester
    JOIN krs kr ON kd.id_krs = kr.id_krs
    JOIN registrasi r ON kr.id_registrasi = r.id_registrasi
    WHERE r.id_mahasiswa = p_id_mahasiswa
    AND kd.nilai_huruf IS NOT NULL
    ORDER BY s.id_semester, mk.kode_mk;
END;
$$ LANGUAGE plpgsql;

-- Function untuk menghitung total SKS yang sudah diambil mahasiswa
CREATE OR REPLACE FUNCTION get_total_sks_mahasiswa(p_id_mahasiswa INT)
RETURNS INT AS $$
DECLARE
    total_sks INT;
BEGIN
    SELECT COALESCE(SUM(mk.sks), 0)
    INTO total_sks
    FROM krs_detail kd
    JOIN kelas k ON kd.id_kelas = k.id_kelas
    JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
    JOIN krs kr ON kd.id_krs = kr.id_krs
    JOIN registrasi r ON kr.id_registrasi = r.id_registrasi
    WHERE r.id_mahasiswa = p_id_mahasiswa
    AND kd.nilai_huruf IS NOT NULL;
    
    RETURN total_sks;
END;
$$ LANGUAGE plpgsql;

-- Function untuk mendapatkan jadwal mahasiswa berdasarkan semester
CREATE OR REPLACE FUNCTION get_jadwal_mahasiswa(p_id_mahasiswa INT, p_id_semester INT)
RETURNS TABLE (
    hari hari_enum,
    waktu_mulai TIME,
    waktu_selesai TIME,
    kode_mk VARCHAR(10),
    nama_mk VARCHAR(100),
    nama_kelas VARCHAR(10),
    nama_ruang VARCHAR(10),
    nama_dosen VARCHAR(160)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        j.hari,
        j.waktu_mulai,
        j.waktu_selesai,
        mk.kode_mk,
        mk.nama_mk,
        k.nama_kelas,
        ru.nama_ruang,
        d.nama as nama_dosen
    FROM jadwal j
    JOIN kelas k ON j.id_kelas = k.id_kelas
    JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
    JOIN ruang ru ON j.id_ruang = ru.id_ruang
    JOIN dosen d ON j.id_dosen = d.id_dosen
    JOIN krs_detail kd ON k.id_kelas = kd.id_kelas
    JOIN krs kr ON kd.id_krs = kr.id_krs
    JOIN registrasi r ON kr.id_registrasi = r.id_registrasi
    WHERE r.id_mahasiswa = p_id_mahasiswa
    AND kr.id_semester = p_id_semester
    AND kr.status_validasi = true
    ORDER BY j.hari, j.waktu_mulai;
END;
$$ LANGUAGE plpgsql;

-- Function untuk mendapatkan daftar mahasiswa dalam kelas
CREATE OR REPLACE FUNCTION get_mahasiswa_kelas(p_id_kelas INT)
RETURNS TABLE (
    npm VARCHAR(20),
    nama VARCHAR(160),
    email VARCHAR(255),
    status status_enum
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        r.npm,
        m.nama,
        u.email,
        r.status
    FROM mahasiswa m
    JOIN registrasi r ON m.id_mahasiswa = r.id_mahasiswa
    JOIN krs kr ON r.id_registrasi = kr.id_registrasi
    JOIN krs_detail kd ON kr.id_krs = kd.id_krs
    JOIN users u ON m.id_user = u.id_user
    WHERE kd.id_kelas = p_id_kelas
    AND kr.status_validasi = true
    ORDER BY r.npm;
END;
$$ LANGUAGE plpgsql;

-- Function untuk menghitung persentase kehadiran mahasiswa
CREATE OR REPLACE FUNCTION get_persentase_kehadiran(p_id_mahasiswa INT, p_id_kelas INT)
RETURNS NUMERIC(5,2) AS $$
DECLARE
    total_pertemuan INT;
    hadir_count INT;
    persentase NUMERIC(5,2);
BEGIN
    -- Hitung total pertemuan untuk kelas tersebut
    SELECT COUNT(*)
    INTO total_pertemuan
    FROM presensi_pertemuan pp
    JOIN jadwal j ON pp.id_jadwal = j.id_jadwal
    WHERE j.id_kelas = p_id_kelas;
    
    -- Hitung jumlah kehadiran mahasiswa
    SELECT COUNT(*)
    INTO hadir_count
    FROM presensi_mahasiswa pm
    JOIN presensi_pertemuan pp ON pm.id_pertemuan = pp.id_pertemuan
    JOIN jadwal j ON pp.id_jadwal = j.id_jadwal
    WHERE j.id_kelas = p_id_kelas
    AND pm.id_mahasiswa = p_id_mahasiswa
    AND pm.status_kehadiran = 'hadir';
    
    IF total_pertemuan > 0 THEN
        persentase := (hadir_count::NUMERIC / total_pertemuan::NUMERIC) * 100;
    ELSE
        persentase := 0.00;
    END IF;
    
    RETURN ROUND(persentase, 2);
END;
$$ LANGUAGE plpgsql;

-- Function untuk mendapatkan statistik nilai per mata kuliah
CREATE OR REPLACE FUNCTION get_statistik_nilai_mk(p_id_mk INT, p_id_semester INT)
RETURNS TABLE (
    total_mahasiswa BIGINT,
    rata_rata_nilai NUMERIC(5,2),
    nilai_tertinggi NUMERIC(5,2),
    nilai_terendah NUMERIC(5,2),
    jumlah_lulus BIGINT,
    persentase_kelulusan NUMERIC(5,2)
) AS $$
DECLARE
    total_mhs BIGINT;
    lulus_count BIGINT;
BEGIN
    SELECT 
        COUNT(*),
        ROUND(AVG(kd.nilai_akhir), 2),
        MAX(kd.nilai_akhir),
        MIN(kd.nilai_akhir)
    INTO total_mahasiswa, rata_rata_nilai, nilai_tertinggi, nilai_terendah
    FROM krs_detail kd
    JOIN kelas k ON kd.id_kelas = k.id_kelas
    WHERE k.id_mk = p_id_mk
    AND k.id_semester = p_id_semester
    AND kd.nilai_akhir IS NOT NULL;
    
    SELECT COUNT(*)
    INTO lulus_count
    FROM krs_detail kd
    JOIN kelas k ON kd.id_kelas = k.id_kelas
    WHERE k.id_mk = p_id_mk
    AND k.id_semester = p_id_semester
    AND kd.nilai_akhir >= 60;
    
    total_mhs := total_mahasiswa;
    jumlah_lulus := lulus_count;
    
    IF total_mhs > 0 THEN
        persentase_kelulusan := ROUND((lulus_count::NUMERIC / total_mhs::NUMERIC) * 100, 2);
    ELSE
        persentase_kelulusan := 0.00;
    END IF;
    
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql;

-- Function untuk validasi KRS (cek bentrok jadwal)
CREATE OR REPLACE FUNCTION validasi_krs_bentrok(p_id_krs INT)
RETURNS BOOLEAN AS $$
DECLARE
    bentrok_count INT;
BEGIN
    SELECT COUNT(*)
    INTO bentrok_count
    FROM (
        SELECT j1.hari, j1.waktu_mulai, j1.waktu_selesai
        FROM krs_detail kd1
        JOIN kelas k1 ON kd1.id_kelas = k1.id_kelas
        JOIN jadwal j1 ON k1.id_kelas = j1.id_kelas
        WHERE kd1.id_krs = p_id_krs
    ) AS jadwal1
    JOIN (
        SELECT j2.hari, j2.waktu_mulai, j2.waktu_selesai
        FROM krs_detail kd2
        JOIN kelas k2 ON kd2.id_kelas = k2.id_kelas
        JOIN jadwal j2 ON k2.id_kelas = j2.id_kelas
        WHERE kd2.id_krs = p_id_krs
    ) AS jadwal2 ON jadwal1.hari = jadwal2.hari
    WHERE (jadwal1.waktu_mulai < jadwal2.waktu_selesai 
           AND jadwal1.waktu_selesai > jadwal2.waktu_mulai)
    AND NOT (jadwal1.waktu_mulai = jadwal2.waktu_mulai 
             AND jadwal1.waktu_selesai = jadwal2.waktu_selesai);
    
    RETURN bentrok_count = 0;
END;
$$ LANGUAGE plpgsql;