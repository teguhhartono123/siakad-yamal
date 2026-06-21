-- =========================================================================
-- 🏛️ BLUEPRINT SCHEMAS DATABASE D1 - SISTEM INFORMASI AKADEMIK (SIAKAD)
-- 🎓 STIT YA'MAL TANGERANG - MASA DEPAN KASTA SULTAN (ANTI-LEMAK DATA)
-- =========================================================================

CREATE TABLE IF NOT EXISTS pengguna_siakad (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nomor_induk TEXT UNIQUE NOT NULL,
  nama_lengkap TEXT NOT NULL,
  kata_sandi TEXT NOT NULL,
  peran TEXT CHECK(peran IN ('mahasiswa', 'dosen', 'admin')) NOT NULL,
  program_studi TEXT DEFAULT 'Pendidikan Agama Islam (PAI)',
  status_akun TEXT CHECK(status_akun IN ('aktif', 'nonaktif', 'cuti')) DEFAULT 'aktif',
  waktu_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS master_matakuliah (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kode_matkul TEXT UNIQUE NOT NULL,
  nama_matkul TEXT NOT NULL,
  sks INTEGER NOT NULL,
  semester_target INTEGER NOT NULL,
  waktu_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS krs_induk (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mahasiswa_id INTEGER,
  tahun_akademik TEXT NOT NULL,
  semester_aktif INTEGER NOT NULL,
  status_spp TEXT CHECK(status_spp IN ('lunas', 'tunggakan')) DEFAULT 'tunggakan',
  status_krs TEXT CHECK(status_krs IN ('draft', 'pending_approval', 'approved')) DEFAULT 'draft',
  dosen_wali_id INTEGER,
  FOREIGN KEY (mahasiswa_id) REFERENCES pengguna_siakad(id) ON DELETE CASCADE,
  FOREIGN KEY (dosen_wali_id) REFERENCES pengguna_siakad(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS krs_detail (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  krs_id INTEGER,
  matkul_id INTEGER,
  FOREIGN KEY (krs_id) REFERENCES krs_induk(id) ON DELETE CASCADE,
  FOREIGN KEY (matkul_id) REFERENCES master_matakuliah(id) ON DELETE CASCADE,
  UNIQUE(krs_id, matkul_id)
);

CREATE TABLE IF NOT EXISTS khs_nilai (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mahasiswa_id INTEGER,
  matkul_id INTEGER,
  tahun_akademik TEXT NOT NULL,
  semester_nilai INTEGER NOT NULL,
  nilai_tugas REAL DEFAULT 0.0,
  nilai_uts REAL DEFAULT 0.0,
  nilai_uas REAL DEFAULT 0.0,
  nilai_akhir_angka REAL GENERATED ALWAYS AS (nilai_tugas * 0.2 + nilai_uts * 0.3 + nilai_uas * 0.5) STORED,
  nilai_huruf TEXT,
  FOREIGN KEY (mahasiswa_id) REFERENCES pengguna_siakad(id) ON DELETE CASCADE,
  FOREIGN KEY (matkul_id) REFERENCES master_matakuliah(id) ON DELETE CASCADE,
  UNIQUE(mahasiswa_id, matkul_id, tahun_akademik, semester_nilai)
);
