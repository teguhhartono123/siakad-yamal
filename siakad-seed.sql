-- =========================================================================
-- 🌱 SCRIPT DATA SEEDER - SISTEM INFORMASI AKADEMIK (SIAKAD)
-- 🎓 STIT YA'MAL TANGERANG - PENGISI RAHIM DATABASE STERIL (ANTI-KORSLET)
-- =========================================================================

-- 👤 1. SUNTIK DATA AKUN PENGGUNA DUMI (1 MAHASISWA & 1 DOSEN WALI)
INSERT OR IGNORE INTO pengguna_siakad (id, nomor_induk, nama_lengkap, kata_sandi, peran, program_studi, status_akun)
VALUES 
(1, '202610001', 'Ahmad Teguh Perkasa', 'sandi_mahasiswa_123', 'mahasiswa', 'Pendidikan Agama Islam (PAI)', 'aktif'),
(2, '198512001', 'Dr. Syarifuddin, M.Pd.', 'sandi_dosen_456', 'dosen', 'Pendidikan Agama Islam (PAI)', 'aktif');

-- 📚 2. SUNTIK DATA MASTER MATA KULIAH UNGGULAN SEMESTER 1 (PAI REFERENCE)
INSERT OR IGNORE INTO master_matakuliah (id, kode_matkul, nama_matkul, sks, semester_target)
VALUES 
(1, 'PAI-101', 'Ushul Fiqh Dasar', 3, 1),
(2, 'PAI-102', 'Ilmu Kalam & Teologi Islam', 2, 1),
(3, 'PAI-103', 'Sejarah Peradaban Islam (SPI)', 3, 1);
