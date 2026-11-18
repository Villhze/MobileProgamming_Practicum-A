# Laporan Praktikum Pertemuan III: Pengaturan Layout Row dan Column di Flutter

## 1. Daftar File Program

| Langkah | Nama File | Deskripsi / Fokus Uji |
| :--- | :--- | :--- |
| **Langkah 1** | `lib/langkah_1.dart` | AppBar Alignment & teks Hello Flutter di tengah |
| **Langkah 2** | `lib/langkah_2.dart` | Widget kustom `KotakBiruJempol` (100x100) |
| **Langkah 3** | `lib/langkah_3.dart` | Widget kustom `KotakBiruJempolKecil` (75x75) |
| **Langkah 4** | `lib/langkah_4.dart` | `Row` berisi 3 kotak berselang-seling dengan `SizedBox` |
| **Langkah 5** | `lib/langkah_5.dart` | `Row` dengan `mainAxisSize: MainAxisSize.max` |
| **Langkah 6** | `lib/langkah_6.dart` | `Row` dengan `mainAxisSize: MainAxisSize.min` |
| **Langkah 7a** | `lib/langkah_7_max.dart` | `Column` dengan `mainAxisSize: MainAxisSize.max` |
| **Langkah 7b** | `lib/langkah_7_min.dart` | `Column` dengan `mainAxisSize: MainAxisSize.min` |
| **Langkah 8** | `lib/langkah_8.dart` | `Row` dengan `MainAxisAlignment.center` (kode modul) |
| **Langkah 8c** | `lib/langkah_8_variasi_row.dart` | Pengujian seluruh variasi `MainAxisAlignment` pada `Row` |
| **Langkah 8d** | `lib/langkah_8_variasi_column.dart` | Pengujian seluruh variasi `MainAxisAlignment` pada `Column` |
| **Langkah 9** | `lib/langkah_9.dart` | `Row` dengan `CrossAxisAlignment.center` & `spaceEvenly` |
| **Langkah 9c** | `lib/langkah_9_variasi_row.dart` | Pengujian variasi `CrossAxisAlignment` pada `Row` |
| **Langkah 9d** | `lib/langkah_9_variasi_column.dart` | Pengujian variasi `CrossAxisAlignment` pada `Column` |
| **Langkah 9e** | `lib/langkah_9_e.dart` | Teks Suhu & Icon tanpa `textBaseline` |
| **Langkah 9f** | `lib/langkah_9_f.dart` | Teks Suhu dengan `CrossAxisAlignment.baseline` |
| **Tugas 2.4** | `lib/tugas.dart` | UI Prakiraan Cuaca Kota Malang |
| **Menu Hub** | `lib/main.dart` | Navigasi cepat untuk membuka semua langkah |

---

## 2. Ringkasan & Hasil Pengamatan per Langkah Kerja

### Rangkuman Langkah 1 – 8 (Pemahaman Konsep Row, Column, dan Alignment)
Dari langkah 1 sampai 8, intinya saya belajar cara membuat komponen widget sendiri berupa kotak biru berikon jempol (`KotakBiruJempol` 100x100 dan `KotakBiruJempolKecil` 75x75), lalu menatanya ke dalam `Row` (berjejer ke samping) atau `Column` (berjejer ke bawah). Dari sini saya memahami dua pengaturan penting:
* **`MainAxisSize` (`max` vs `min`):** 
  Secara bawaan (*default*), nilainya adalah `max` yang artinya `Row` atau `Column` bakal serakah mengambil seluruh ruang layar yang ada, sehingga kotak-kotak di dalamnya tetap menempel di posisi awal (*start*). Tapi ketika diubah ke `min`, ukuran `Row` atau `Column` akan menciut pas sesuai total ukuran kotak di dalamnya saja. Karena ukurannya sudah pas, widget pembungkus `Center` baru bisa menarik dan menempatkan seluruh susunan kotak tersebut tepat di tengah layar.
* **`MainAxisAlignment`:** 
  Properti ini digunakan untuk mengatur posisi dan persebaran kotak di sepanjang jalur utamanya. Kita bisa memilih apakah kotaknya mau dibuat mepet ke pinggir (`start`/`end`), kumpul rapat di tengah (`center`), atau disebar merata dengan jarak yang seimbang (`spaceBetween`, `spaceAround`, dan `spaceEvenly`) agar tata letak antarmuka terlihat pas dan rapi.

### Langkah 9 – Properti `CrossAxisAlignment` & `TextBaseline`
Pada langkah ini, saya mempelajari cara mengatur sumbu silang (*cross axis*) dan penyelarasan garis dasar teks:
* **CrossAxis pada `Row` & `Column`:** Mengatur arah yang berlawanan dengan jalur utama. Pada `Row`, cross axis adalah arah vertikal (atas, tengah, bawah, atau meregang/`stretch`). Sedangkan pada `Column`, cross axis adalah arah horizontal (kiri, tengah, kanan, atau meregang).
* **Poin (e) vs Poin (f) – Pentingnya `TextBaseline`:**
  Saat menampilkan kata `"Suhu:"` (font 30) dan `"25°C"` (font 75), awalnya huruf terlihat janggal dan tidak sejajar karena secara default posisinya disejajarkan di titik tengah vertikal. Begitu properti `crossAxisAlignment: CrossAxisAlignment.baseline` dan `textBaseline: TextBaseline.alphabetic` ditambahkan, bagian bawah huruf dari kedua teks tersebut langsung duduk rapi di atas satu garis dasar yang sama, persis seperti tulisan tangan di atas garis buku tulis.

---

## 3. Tugas 2.4 – Tampilan UI Cuaca Kota Malang
Pada tugas ini, saya menerapkan gabungan antara `Column` dan `Row` untuk meniru desain antarmuka cuaca:
* **`Column` Utama:** Berfungsi menyusun elemen secara vertikal dari atas ke bawah, yaitu nama kota (*Malang*), teks suhu besar (*25°*), dan baris ramalan cuaca.
* **`Row` Prakiraan Cuaca:** Digunakan untuk membariskan 3 hari cuaca ke samping dengan `mainAxisAlignment: MainAxisAlignment.spaceEvenly` agar jarak antarkolom hari terbagi rata dan rapi.
* **Komponen Hari (`_WeatherDayColumn`):** Masing-masing hari disusun menggunakan `Column` kecil berisi teks hari (*Minggu, Senin, Selasa*), ikon cuaca (`Icons.sunny`, `Icons.cloudy_snowing`, `Icons.cloud`), serta suhu harian (*20°C, 23°C, 22°C*).

---

## 4. Kesimpulan
1. **`Row`** menyusun widget secara horizontal (sumbu utama mendatar, sumbu silang tegak lurus), sedangkan **`Column`** menyusun widget secara vertikal (sumbu utama tegak lurus, sumbu silang mendatar).
2. **`mainAxisSize`** menentukan seberapa besar ruang yang diambil oleh `Row`/`Column` pada sumbu utamanya (`max` memenuhi layar, `min` hanya sebesar total ukuran anak).
3. **`mainAxisAlignment`** mengatur pembagian ruang dan posisi widget di sepanjang sumbu utama.
4. **`crossAxisAlignment`** mengatur posisi sejajar widget di sepanjang sumbu silang.
5. **`TextBaseline`** sangat penting untuk merapikan teks dengan ukuran font berbeda agar bertumpu pada garis dasar huruf yang sama.
