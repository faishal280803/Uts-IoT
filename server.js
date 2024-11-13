// Import Express dan mysql2
const express = require("express");
const mysql = require("mysql2");
const app = express();
const port = 3000;

// Buat koneksi ke database MySQL
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "uts",
});

// Cek koneksi
db.connect((err) => {
  if (err) {
    console.error("Koneksi ke database gagal:", err);
    return;
  }
  console.log("Terhubung ke database MySQL");
});

app.get("/api/suhu", (req, res) => {
  const dataQuery = "SELECT * FROM suhu"; // Query untuk mengambil data dari tabel suhu
  const monthYearQuery = "SELECT DISTINCT month_year FROM suhu"; // Query untuk data month_year

  // Jalankan kedua query secara paralel
  db.query(dataQuery, (err, dataResults) => {
    if (err) {
      return res
        .status(500)
        .json({ success: false, message: "Gagal mengambil data", error: err });
    }

    db.query(monthYearQuery, (err, monthYearResults) => {
      if (err) {
        return res.status(500).json({
          success: false,
          message: "Gagal mengambil month_year",
          error: err,
        });
      }

      // Data tambahan untuk header
      const suhumax = 36; // Ganti dengan nilai maksimum suhu yang relevan
      const humimin = 21; // Ganti dengan nilai minimum humidity yang relevan
      const suhurata = 28.35; // Ganti dengan rata-rata suhu yang relevan

      // Format data dalam struktur JSON
      const output = {
        suhumax: suhumax,
        humimin: humimin,
        suhurata: suhurata,
        nilai_suhu_max_humid_max: dataResults.map((row) => ({
          idx: row.id,
          suhu: row.suhu,
          humid: row.humid,
          kecerahan: row.kecerahan,
          timestamp: row.timestamp,
        })),
        month_year_max: monthYearResults.map((row) => ({
          month_year: row.month_year,
        })),
      };

      res.json(output); // Mengirimkan output dalam format JSON
    });
  });
});

// Jalankan server
app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});
