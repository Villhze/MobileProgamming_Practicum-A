# LAPORAN PRAKTIKUM TEKNOLOGI PEMROGRAMAN MOBILE
## MODUL XII: AKSES LOKASI DENGAN GPS DI FLUTTER

---

### A. COVER / IDENTITAS
* **Mata Kuliah**: Praktikum Pemrograman Mobile
* **Modul**: Modul 12 – Akses Lokasi dengan GPS di Flutter
* **Nama Proyek**: `modul12` (`lokasi_flutter`)
* **Tanggal Pengerjaan**: 29 Oktober 2026

---

### B. TUJUAN PRAKTIKUM
1. Memahami konsep dasar pengambilan data lokasi perangkat menggunakan Global Positioning System (GPS) pada Flutter.
2. Mengakses koordinat lintang (*latitude*) dan bujur (*longitude*) perangkat secara *real-time*.
3. Menerapkan teknik *reverse geocoding* untuk mengubah koordinat geografis menjadi informasi alamat yang dapat dibaca manusia (kelurahan/kecamatan, kabupaten/kota).
4. Mengelola dan menangani izin (*permission handling*) akses lokasi pada platform Android (`ACCESS_FINE_LOCATION` dan `ACCESS_COARSE_LOCATION`).
5. Membangun antarmuka pengguna (UI) Flutter yang dinamis, interaktif, dan responsif terhadap perubahan status (memuat, berhasil, atau error).

---

### C. LANGKAH KERJA SINGKAT
1. **Konfigurasi Dependensi (`pubspec.yaml`)**:
   Menambahkan paket yang dibutuhkan pada bagian `dependencies`:
   - `google_fonts: ^6.1.0`: Mengatur tipografi teks menggunakan font Poppins.
   - `geolocator: ^7.7.0`: Mengakses sensor GPS, memeriksa status layanan, dan mengelola izin lokasi.
   - `geocoding: ^3.0.0`: Melakukan konversi koordinat (*reverse geocoding*) menjadi data alamat (*Placemark*).

2. **Konfigurasi Izin Android (`AndroidManifest.xml`)**:
   Menambahkan hak akses lokasi sebelum tag `<application>` pada berkas `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   ```

3. **Perancangan Antarmuka UI (`lib/main.dart`)**:
   - Membungkus halaman utama dengan widget `Scaffold` yang dilengkapi `AppBar` bernuansa warna biru gelap (`Color(0xFF1A237E)`).
   - Menggunakan `Card` ber-sudut melengkung (`RoundedRectangleBorder`) dengan `elevation: 4.0` untuk wadah informasi lokasi.
   - Menggunakan tombol `ElevatedButton` di bagian bawah untuk memicu eksekusi fungsi `_getLocation()`.

4. **Implementasi Logika Fungsi `_getLocation()`**:
   Fungsi ini berjalan secara *asynchronous* (`async/await`) dengan tahapan sistematis:
   - **Inisialisasi State**: Memanggil `setState()` untuk mengaktifkan `_isLoading = true` serta mengosongkan pesan error dan data lokasi sebelumnya.
   - **Pengecekan Layanan GPS**: Memeriksa ketersediaan GPS melalui `Geolocator.isLocationServiceEnabled()`. Jika GPS tidak aktif, aplikasi melempar *exception*.
   - **Pengecekan Izin Akses**: Memeriksa izin menggunakan `Geolocator.checkPermission()`. Jika bernilai `denied`, aplikasi meminta izin dengan `Geolocator.requestPermission()`. Jika `deniedForever`, pengguna diinstruksikan mengubah izin di menu pengaturan perangkat.
   - **Pengambilan Posisi**: Mengambil koordinat perangkat dengan tingkat akurasi tinggi menggunakan `Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)`.
   - **Reverse Geocoding**: Mengonversi `position.latitude` dan `position.longitude` menjadi daftar alamat melalui `placemarkFromCoordinates()`. Mengambil elemen pertama (`placemarks[0]`) untuk mengisi variabel `_kecamatan` (`place.subLocality`) dan `_kota` (`place.subAdministrativeArea`).
   - **Penanganan Error (`catch`)**: Menangkap semua galat dan menyimpannya ke dalam variabel `_errorMessage` agar pesan kesalahan tampil rapi di UI.
   - **Pembersihan Akhir (`finally`)**: Menonaktifkan animasi putar dengan mengatur `_isLoading = false`.

5. **Peran `setState()` dan Variabel State**:
   - `_isLoading` (boolean): Menentukan apakah `CircularProgressIndicator` ditampilkan di dalam kartu dan menonaktifkan tombol agar tidak terjadi *multi-request*.
   - `_errorMessage` (String?): Menyimpan teks error (misal ketika GPS mati atau izin ditolak) yang ditampilkan dengan warna merah.
   - `_kecamatan` dan `_kota` (String?): Menyimpan nama wilayah hasil *reverse geocoding*.
   - `setState()`: Memberitahukan *Flutter framework* bahwa kondisi internal *State* telah berubah, memicu pemanggilan ulang method `build()` (*re-render*) secara otomatis sehingga UI selalu sinkron dengan kondisi terkini.

---

### D. TAMPILAN APLIKASI (SCREENSHOT & PENGAMATAN)

| No | Kondisi Aplikasi | Keterangan & Perilaku UI |
|---|---|---|
| **1** | **Tampilan Awal (Initial State)** | Aplikasi baru dibuka. Variabel `_kecamatan` dan `_kota` bernilai `null`. Teks di dalam kartu menampilkan: *"Tekan tombol untuk menampilkan lokasi."*. Tombol *"TAMPILKAN LOKASI SAAT INI"* aktif dan siap ditekan. |
| **2** | **Saat Memproses (Loading State)** | Tombol telah ditekan. Variabel `_isLoading` bernilai `true`. Kartu menampilkan animasi `CircularProgressIndicator` di tengah. Tombol dinonaktifkan (`onPressed: null`) untuk mencegah klik berulang kali selama proses koordinat dicari. |
| **3** | **Lokasi Berhasil Ditampilkan (Success State)** | Koordinat GPS berhasil didapatkan dan diterjemahkan oleh geocoding. Di dalam kartu tertulis: <br>- `Kelurahan/Kecamatan: <nama kecamatan>`<br>- `Kota: <nama kabupaten/kota>` dengan teks tebal (*bold*). |
| **4** | **Kondisi Error (Error State)** | Terjadi ketika pengguna mematikan GPS atau menolak izin akses lokasi. Di dalam kartu tampil pesan teks berwarna merah, misalnya: *"Layanan lokasi tidak aktif. Mohon aktifkan GPS."* atau *"Izin lokasi ditolak oleh pengguna."*. |

---

### E. KESIMPULAN
1. Integrasi paket `geolocator` dan `geocoding` memungkinkan aplikasi Flutter mengambil titik koordinat GPS perangkat secara akurat dan mengubahnya secara langsung menjadi alamat yang mudah dipahami (*reverse geocoding*).
2. Penanganan izin lokasi pada Android merupakan aspek krusial. Penambahan izin pada `AndroidManifest.xml` yang diimbangi dengan validasi runtime (`checkPermission()` dan `requestPermission()`) mencegah aplikasi mengalami *crash*.
3. Pemanfaatan *StatefulWidget* bersama metode `setState()` menjamin antarmuka pengguna selalu responsif dan adaptif menampilkan empat kondisi utama: inisial, memuat data (*loading spinner*), menampilkan hasil sukses, serta menampilkan pesan kegagalan (*error alert*).

