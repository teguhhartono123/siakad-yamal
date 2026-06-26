PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE pengguna_siakad (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nomor_induk TEXT UNIQUE NOT NULL,
  nama_lengkap TEXT NOT NULL,
  kata_sandi TEXT NOT NULL,
  peran TEXT CHECK(peran IN ('mahasiswa', 'dosen', 'admin')) NOT NULL,
  program_studi TEXT DEFAULT 'Pendidikan Agama Islam (PAI)',
  status_akun TEXT CHECK(status_akun IN ('aktif', 'nonaktif', 'cuti')) DEFAULT 'aktif',
  waktu_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP
, jabatan_fungsional TEXT DEFAULT 'Lektor Kepala', bidang_keilmuan TEXT DEFAULT 'Pendidikan Agama Islam (PAI)', status_serdos TEXT DEFAULT 'Sudah Sertifikasi Dosen', kode_otp TEXT DEFAULT NULL, otp_expired DATETIME DEFAULT NULL, nomor_wa TEXT DEFAULT NULL);
INSERT INTO "pengguna_siakad" ("id","nomor_induk","nama_lengkap","kata_sandi","peran","program_studi","status_akun","waktu_dibuat","jabatan_fungsional","bidang_keilmuan","status_serdos","kode_otp","otp_expired","nomor_wa") VALUES(1,'202610001','Parto, S.Kom','sandi_mahasiswa_123','mahasiswa','Pendidikan Agama Islam (PAI)','aktif','2026-06-21 15:06:37','Lektor Kepala','Pendidikan Agama Islam (PAI)','Sudah Sertifikasi Dosen',NULL,NULL,NULL);
INSERT INTO "pengguna_siakad" ("id","nomor_induk","nama_lengkap","kata_sandi","peran","program_studi","status_akun","waktu_dibuat","jabatan_fungsional","bidang_keilmuan","status_serdos","kode_otp","otp_expired","nomor_wa") VALUES(2,'198512001','Dr. Syarifuddin, M.Pd.','sandi_dosen_456','dosen','Pendidikan Agama Islam (PAI)','aktif','2026-06-21 15:06:37','Lektor Kepala','Pendidikan Agama Islam (PAI)','Sudah Sertifikasi Dosen',NULL,NULL,NULL);
INSERT INTO "pengguna_siakad" ("id","nomor_induk","nama_lengkap","kata_sandi","peran","program_studi","status_akun","waktu_dibuat","jabatan_fungsional","bidang_keilmuan","status_serdos","kode_otp","otp_expired","nomor_wa") VALUES(3,'adminbaak','BAAK STIT YAMAL','sandi_admin_123','admin','Pendidikan Agama Islam (PAI)','aktif','2026-06-22 02:40:31','Lektor Kepala','Pendidikan Agama Islam (PAI)','Sudah Sertifikasi Dosen',NULL,NULL,NULL);
CREATE TABLE master_matakuliah (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kode_matkul TEXT UNIQUE NOT NULL,
  nama_matkul TEXT NOT NULL,
  sks INTEGER NOT NULL,
  semester_target INTEGER NOT NULL,
  waktu_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(1,'PAI-101','Ushul Fiqh Dasar',3,1,'2026-06-21 15:06:37');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(2,'PAI-102','Ilmu Kalam & Teologi Islam',2,1,'2026-06-21 15:06:37');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(3,'PAI-103','Sejarah Peradaban Islam (SPI)',3,1,'2026-06-21 15:06:37');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(4,'PAI-104','Ulumul Quran',2,1,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(5,'PAI-105','Ulumul Hadits',2,1,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(6,'PAI-106','Bahasa Arab Akademik I',3,1,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(7,'PAI-107','Filsafat Pendidikan Islam',3,1,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(8,'PAI-108','Metodologi Studi Islam',2,1,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(9,'PAI-201','Fiqih Ibadah & Muamalah',3,2,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(10,'PAI-202','Perkembangan Peserta Didik',2,2,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(11,'PAI-203','Bahasa Arab Akademik II',3,2,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(12,'PAI-204','Ilmu Pendidikan Islam (IPI)',3,2,'2026-06-22 04:54:18');
INSERT INTO "master_matakuliah" ("id","kode_matkul","nama_matkul","sks","semester_target","waktu_dibuat") VALUES(13,'PAI-205','Sejarah Pendidikan Islam di Indonesia',2,2,'2026-06-22 04:54:18');
CREATE TABLE krs_induk (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mahasiswa_id INTEGER,
  tahun_akademik TEXT NOT NULL,
  semester_aktif INTEGER NOT NULL,
  status_spp TEXT CHECK(status_spp IN ('lunas', 'tunggakan')) DEFAULT 'tunggakan',
  status_krs TEXT CHECK(status_krs IN ('draft', 'pending_approval', 'approved')) DEFAULT 'draft',
  dosen_wali_id INTEGER, semester_berjalan INTEGER DEFAULT 1,
  FOREIGN KEY (mahasiswa_id) REFERENCES pengguna_siakad(id) ON DELETE CASCADE,
  FOREIGN KEY (dosen_wali_id) REFERENCES pengguna_siakad(id) ON DELETE SET NULL
);
CREATE TABLE krs_detail (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  krs_id INTEGER,
  matkul_id INTEGER,
  FOREIGN KEY (krs_id) REFERENCES krs_induk(id) ON DELETE CASCADE,
  FOREIGN KEY (matkul_id) REFERENCES master_matakuliah(id) ON DELETE CASCADE,
  UNIQUE(krs_id, matkul_id)
);
CREATE TABLE khs_nilai (
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
CREATE TABLE riwayat_audit_siakad (id INTEGER PRIMARY KEY AUTOINCREMENT, nama_pengguna TEXT NOT NULL, peran_pengguna TEXT NOT NULL, aksi_aktivitas TEXT NOT NULL, jejak_waktu DATETIME DEFAULT CURRENT_TIMESTAMP, alamat_ip TEXT DEFAULT '127.0.0.1');
INSERT INTO "riwayat_audit_siakad" ("id","nama_pengguna","peran_pengguna","aksi_aktivitas","jejak_waktu","alamat_ip") VALUES(1,'BAAK STIT YAMAL','admin','Berhasil melakukan login otentikasi pusat SSR','2026-06-22 05:17:54','127.0.0.1');
INSERT INTO "riwayat_audit_siakad" ("id","nama_pengguna","peran_pengguna","aksi_aktivitas","jejak_waktu","alamat_ip") VALUES(2,'BAAK STIT YAMAL','admin','Injeksi massal batch 10 mata kuliah baru kurikulum PAI','2026-06-22 05:17:54','127.0.0.1');
INSERT INTO "riwayat_audit_siakad" ("id","nama_pengguna","peran_pengguna","aksi_aktivitas","jejak_waktu","alamat_ip") VALUES(3,'BAAK STIT YAMAL','admin','Pembaruan sasis visual dual histogram laporan arus kas SPP','2026-06-22 05:17:54','127.0.0.1');
CREATE TABLE ploting_dosen_matkul (id INTEGER PRIMARY KEY AUTOINCREMENT, dosen_id INTEGER, matakuliah_id INTEGER, tahun_akademik TEXT, semester TEXT);
CREATE TABLE presensi_kuliah_siakad (id INTEGER PRIMARY KEY AUTOINCREMENT, matakuliah_id INTEGER, mahasiswa_id INTEGER, tanggal TEXT, status_kehadiran TEXT, dicatat_oleh TEXT, Unique(matakuliah_id, mahasiswa_id, tanggal));
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('pengguna_siakad',3);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('master_matakuliah',13);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('riwayat_audit_siakad',3);
