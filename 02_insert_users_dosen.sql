-- ================================================
-- FILE: 02_insert_users_dosen.sql
-- DESCRIPTION: Insert data users dan dosen
-- ================================================

-- Insert Users untuk Admin dan Staff
INSERT INTO users (username, password, email, id_role) VALUES
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@siakadu.ac.id', 1),
('staff_akademik', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff@siakadu.ac.id', 4);

-- Insert Users untuk Dosen (ID 3-22)
INSERT INTO users (username, password, email, id_role) VALUES
('dosen001', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'andi.wijaya@siakadu.ac.id', 2),
('dosen002', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sari.dewi@siakadu.ac.id', 2),
('dosen003', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'budi.santoso@siakadu.ac.id', 2),
('dosen004', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'linda.putri@siakadu.ac.id', 2),
('dosen005', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'agus.rahman@siakadu.ac.id', 2),
('dosen006', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'maya.sari@siakadu.ac.id', 2),
('dosen007', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dedi.kurniawan@siakadu.ac.id', 2),
('dosen008', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rina.wati@siakadu.ac.id', 2),
('dosen009', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hendra.putra@siakadu.ac.id', 2),
('dosen010', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fitri.handayani@siakadu.ac.id', 2),
('dosen011', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rudi.hermawan@siakadu.ac.id', 2),
('dosen012', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'novi.susanti@siakadu.ac.id', 2),
('dosen013', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yudi.prasetyo@siakadu.ac.id', 2),
('dosen014', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lestari.indah@siakadu.ac.id', 2),
('dosen015', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bambang.sutrisno@siakadu.ac.id', 2),
('dosen016', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eka.pratiwi@siakadu.ac.id', 2),
('dosen017', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fajar.nugroho@siakadu.ac.id', 2),
('dosen018', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wulan.sari@siakadu.ac.id', 2),
('dosen019', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'joko.widodo@siakadu.ac.id', 2),
('dosen020', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ratna.dewi@siakadu.ac.id', 2);

-- Insert Data Dosen
INSERT INTO dosen (nama, nidn, id_user) VALUES
('Dr. Andi Wijaya, M.Kom', '1234567890', 3),
('Sari Dewi, S.Kom, M.T', '1234567891', 4),
('Prof. Budi Santoso, Ph.D', '1234567892', 5),
('Linda Putri, S.Si, M.Kom', '1234567893', 6),
('Dr. Agus Rahman, M.T', '1234567894', 7),
('Maya Sari, S.Kom, M.Kom', '1234567895', 8),
('Dedi Kurniawan, S.E, M.M', '1234567896', 9),
('Dr. Rina Wati, S.E, M.Ak', '1234567897', 10),
('Hendra Putra, S.H, M.H', '1234567898', 11),
('Fitri Handayani, S.Ked, M.Kes', '1234567899', 12),
('Rudi Hermawan, S.Kom, M.T', '1234567800', 13),
('Novi Susanti, S.Si, M.Kom', '1234567801', 14),
('Dr. Yudi Prasetyo, M.Kom', '1234567802', 15),
('Lestari Indah, S.E, M.M', '1234567803', 16),
('Prof. Bambang Sutrisno, Ph.D', '1234567804', 17),
('Eka Pratiwi, S.Kom, M.T', '1234567805', 18),
('Fajar Nugroho, S.E, M.Ak', '1234567806', 19),
('Wulan Sari, S.H, M.H', '1234567807', 20),
('Joko Widodo, S.Ked, M.Kes', '1234567808', 21),
('Dr. Ratna Dewi, M.Kom', '1234567809', 22);