# LAPORAN PRAKTIKUM PEMROGRAMAN MOBILE
## MODUL X: DESAIN GUI, NAVIGASI, DAN INTEGRASI API DENGAN JSON SERIALIZATION DI FLUTTER

---

### A. COVER / IDENTITAS MAHASISWA
- **Judul Tugas:** Modul 10 – Desain GUI, Navigasi, dan Integrasi API dengan JSON Serialization di Flutter
- **Mata Kuliah:** Praktikum Pemrograman Mobile
- **Nama Mahasiswa:** [Nama Lengkap Mahasiswa]
- **NIM:** [NIM Mahasiswa]
- **Kelas:** [Kelas Mahasiswa]
- **Tanggal Praktikum:** 15 Oktober 2026

---

### B. TUJUAN PRAKTIKUM
1. Mendesain antarmuka (*Graphical User Interface* / GUI) aplikasi Flutter yang interaktif, menarik, dan responsif.
2. Menerapkan sistem navigasi antarhalaman menggunakan mekanisme **Named Route** secara terpusat dan terstruktur.
3. Memahami dan mengimplementasikan konsep *data modeling* menggunakan **JSON Serialization** dan **Deserialization** secara otomatis dengan bantuan paket `json_serializable` dan `build_runner`.
4. Mengintegrasikan pengambilan data dari REST API eksternal (*FreeToGame API*) ke dalam aplikasi Flutter menggunakan paket `http`.
5. Menangani status data asinkron (*loading*, *error*, dan *success*) pada antarmuka pengguna menggunakan widget `FutureBuilder`.
6. Menerapkan arsitektur pemisahan kode (*separation of concerns*) dengan struktur direktori `model`, `view`, dan `viewmodel` untuk meningkatkan keterbacaan (*readability*) dan kemudahan pemeliharaan (*maintainability*).

---

### C. LANGKAH KERJA SINGKAT
1. **Inisialisasi Proyek dan Struktur Direktori:**
   - Menyiapkan proyek Flutter bernama `game_app`.
   - Membuat struktur modularisasi di bawah folder `lib/`:
     ```text
     lib/
      ├── model/
      │    ├── game.dart
      │    ├── detailgame.dart
      │    └── detailgame.g.dart (generated)
      ├── view/
      │    ├── home.dart
      │    └── detail.dart
      ├── viewmodel/
      │    └── fetchgame.dart
      └── main.dart
     ```
2. **Konfigurasi Dependensi (`pubspec.yaml`):**
   - Menambahkan paket pendukung pada bagian `dependencies`:
     - `http: ^1.1.0` (komunikasi HTTP ke API eksternal)
     - `json_annotation: ^4.9.0` (anotasi untuk serialisasi JSON)
     - `readmore: ^2.2.0` (widget untuk memotong dan memperluas deskripsi teks panjang)
   - Menambahkan paket pada bagian `dev_dependencies`:
     - `build_runner: ^2.4.8` (alat generator kode)
     - `json_serializable: ^6.7.1` (generator kode otomatis serializer/deserializer)
   - Menjalankan perintah `flutter pub get` di terminal untuk mengunduh seluruh dependensi.

3. **Pembuatan Model Data:**
   - **`lib/model/game.dart`**: Model untuk menyimpan daftar game yang ditampilkan pada halaman utama (*Home*), dilengkapi *factory constructor* `fromJson` manual.
   - **`lib/model/detailgame.dart`**: Model beranotasi `@JsonSerializable()` untuk menampung rincian lengkap suatu game, yang terbagi ke dalam kelas `DetailGame`, `Screenshot`, dan `MinimumSystemRequirements`.
   - Menjalankan perintah generator `dart run build_runner build` untuk menghasilkan file serialisasi otomatis `lib/model/detailgame.g.dart`.

4. **Pembuatan ViewModel / Logika API (`lib/viewmodel/fetchgame.dart`):**
   - Membuat fungsi asinkron `fetchGames()` untuk mengambil list 25+ game dari endpoint `https://www.freetogame.com/api/games`.
   - Membuat fungsi asinkron `fetchDataFromAPI(int idGame)` untuk mengambil rincian spesifik satu game dari endpoint `https://www.freetogame.com/api/game?id={idGame}`.

5. **Penyusunan Antarmuka Pengguna (View):**
   - **`lib/view/home.dart`**:
     - Widget pencarian `_searchBar()` dengan dekorasi `InputDecoration`, ikon pencarian, dan sudut melengkung.
     - Widget kartu game `_listItem()` menggunakan `Card`, `ListTile`, dan `ClipRRect` untuk menampilkan thumbnail dan informasi game.
     - Widget `FutureBuilder<List<Game>>` untuk memuat data secara asinkron dari `fetchGames()` dan menampilkannya dengan `ListView.builder`.
     - Penanganan aksi klik menggunakan `GestureDetector` yang memanggil `Navigator.pushNamed(context, '/detail', arguments: game.id)`.
   - **`lib/view/detail.dart`**:
     - Header atas dengan `Stack`, `ClipRRect`, dan `Positioned` tombol panah kembali (`Navigator.pop(context)`).
     - Kartu spesifikasi minimum sistem menggunakan metode `_requirementRow()`.
     - Galeri tangkapan layar horizontal (`ListView` horizontal dengan item `_itemList()`).
     - Teks deskripsi game yang dapat diperluas (*expand/collapse*) menggunakan widget `ReadMoreText`.

6. **Konfigurasi Routing Terpusat (`lib/main.dart`):**
   - Mengatur navigasi dengan *named route* menggunakan properti `initialRoute: '/'` dan `routes`.
   - Mendefinisikan route `'/'` yang mengarah ke `Home()`.
   - Mendefinisikan route `'/detail'` yang menangkap parameter ID game melalui `ModalRoute.of(context)!.settings.arguments as int` dan meneruskannya ke `Detail(gameTerpilih: gameId)`.

7. **Validasi dan Pengujian:**
   - Menjalankan `flutter analyze` untuk memastikan tidak ada kesalahan sintaksis atau tipe data.
   - Menjalankan `flutter test` untuk memverifikasi fungsionalitas deserialisasi model data dari format JSON.

---

### D. PENJELASAN KODE PROGRAM UTAMA

#### 1. Inisialisasi dan Konfigurasi Route (`lib/main.dart`)
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/view/detail.dart';
import 'package:game_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Game Store',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
    );
  }
}
```
**Penjelasan:**
- `SystemChrome.setSystemUIOverlayStyle`: Mengatur warna bilah status ponsel menjadi transparan dengan ikon gelap agar tata letak terlihat modern.
- `initialRoute: '/'`: Menentukan bahwa halaman pertama yang dibuka saat aplikasi dimuat adalah rute `'/'`.
- `routes`: Berfungsi sebagai tabel pemetaan (*lookup map*) antara nama rute (string) dan widget pembangunnya. Pada rute `'/detail'`, `ModalRoute.of(context)!.settings.arguments` digunakan untuk mengekstrak ID game yang dikirim dari halaman sebelumnya tanpa perlu menyertakannya dalam constructor rute secara statis.

---

#### 2. Model Data & JSON Serialization (`lib/model/detailgame.dart`)
```dart
import 'package:json_annotation/json_annotation.dart';

part 'detailgame.g.dart';

@JsonSerializable()
class MinimumSystemRequirements {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  MinimumSystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) =>
      _$MinimumSystemRequirementsFromJson(json);
  Map<String, dynamic> toJson() => _$MinimumSystemRequirementsToJson(this);
}

@JsonSerializable()
class Screenshot {
  final int id;
  final String image;

  Screenshot({required this.id, required this.image});

  factory Screenshot.fromJson(Map<String, dynamic> json) =>
      _$ScreenshotFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenshotToJson(this);
}

@JsonSerializable()
class DetailGame {
  final int id;
  final String title;
  final String thumbnail;
  final String status;
  final String short_description;
  final String description;
  final String game_url;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String release_date;
  final String freetogame_profile_url;
  final MinimumSystemRequirements minimum_system_requirements;
  final List<Screenshot> screenshots;
  ...
}
```
**Penjelasan:**
- Anotasi `@JsonSerializable()` memberi instruksi kepada `build_runner` untuk secara otomatis menghasilkan fungsi pembantu `_$DetailGameFromJson` dan `_$DetailGameToJson` pada file `detailgame.g.dart`.
- Hal ini menghilangkan keharusan menulis pemetaan manual untuk setiap *field*, mengurangi resiko *human error*, serta mendukung relasi model bersarang (*nested objects* dan *lists*) seperti `MinimumSystemRequirements` dan `List<Screenshot>`.

---

#### 3. Logika Integrasi API Eksternal (`lib/viewmodel/fetchgame.dart`)
```dart
import 'dart:convert';
import 'package:game_app/model/game.dart';
import 'package:http/http.dart' as http;

Future<List<Game>> fetchGames() async {
  final response =
      await http.get(Uri.parse('https://www.freetogame.com/api/games'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Game.fromJson(item)).toList();
  } else {
    throw Exception('Gagal mengambil data game');
  }
}

Future<Map<String, dynamic>> fetchDataFromAPI(int idGame) async {
  final response =
      await http.get(Uri.parse('https://www.freetogame.com/api/game?id=$idGame'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData != null && jsonData is Map<String, dynamic>) {
      return jsonData;
    } else {
      throw Exception('Data dari API tidak sesuai dengan yang diharapkan');
    }
  } else {
    throw Exception('Gagal mengambil data dari API');
  }
}
```
**Penjelasan:**
- Menggunakan `http.get()` dengan `Uri.parse()` untuk melakukan permintaan HTTP GET ke server FreeToGame.
- Kata kunci `async` dan `await` menangani operasi I/O jaringan yang bersifat *non-blocking* sehingga antarmuka pengguna tidak mengalami *freeze*.
- Jika status respons bernilai 200 (OK), data JSON didekode menggunakan `json.decode()` lalu dipetakan ke objek Dart melalui metode `Game.fromJson()`.

---

#### 4. Halaman Utama (`lib/view/home.dart`)
```dart
// Navigasi saat item di klik
GestureDetector(
  onTap: () {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: game.id,
    );
  },
  child: _listItem(
    game.thumbnail,
    game.title,
    game.genre,
  ),
);
```
**Penjelasan:**
- `FutureBuilder<List<Game>>` secara dinamis merender widget berdasarkan status koneksi:
  - `ConnectionState.waiting`: Menampilkan `CircularProgressIndicator()`.
  - `snapshot.hasError`: Menampilkan teks error apabila terjadi gangguan jaringan.
  - `snapshot.hasData`: Membangun daftar game dengan `ListView.builder` yang efisien dalam manajemen memori karena hanya merender item yang terlihat di layar.
- `Navigator.pushNamed(context, '/detail', arguments: game.id)`: Memindahkan pengguna ke rute detail sambil melampirkan ID game yang dipilih ke dalam *arguments*.

---

#### 5. Halaman Detail (`lib/view/detail.dart`)
```dart
// Navigasi kembali (Back Button)
Positioned(
  top: 25,
  left: 10,
  child: GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
    ),
  ),
),
```
**Penjelasan:**
- `Navigator.pop(context)`: Menutup halaman detail dan kembali ke tumpukan rute sebelumnya (*Home*).
- Menampilkan gambar sampul berukuran 300px dengan sudut melengkung menggunakan `ClipRRect`.
- Menampilkan spesifikasi minimum sistem ke dalam tata letak kartu yang rapi menggunakan fungsi `_requirementRow()`.
- Menampilkan galeri *screenshots* game secara horizontal (`scrollDirection: Axis.horizontal`).
- Widget `ReadMoreText` membatasi tampilan deskripsi panjang menjadi 2 baris awal dengan tombol 'more' dan 'less' untuk kenyamanan membaca pengguna.

---

### E. HASIL TAMPILAN APLIKASI (SCREENSHOT)

| No | Halaman / Fitur | Deskripsi Tampilan |
|:--:|:----------------|:-------------------|
| 1 | **Halaman Home (Daftar Game)** | Menampilkan bilah pencarian (*Search Bar*) di bagian atas dengan sudut oval, diikuti oleh daftar vertikal game (*ListView*) berisi thumbnail, judul, dan genre game dari API FreeToGame berlatar belakang warna aksen amber cerah. |
| 2 | **Indikator Loading (*FutureBuilder*)** | Saat aplikasi pertama kali dibuka atau saat berpindah ke detail, sistem menampilkan animasi pemuatan *CircularProgressIndicator* di tengah layar sembari menunggu respons jaringan. |
| 3 | **Halaman Detail (Bagian Atas & Spesifikasi)** | Menampilkan gambar banner game berukuran besar di bagian atas dengan tombol navigasi kembali berbentuk lingkaran transparan. Di bawahnya terdapat panel informasi spesifikasi minimum sistem (OS, Processor, Memory, Graphics, Storage) dengan tanda titik dua yang sejajar rapi. |
| 4 | **Halaman Detail (Screenshot & Deskripsi)** | Menampilkan galeri screenshot game yang dapat digeser secara horizontal, serta paragraf ringkasan deskripsi game yang dilengkapi fitur *expand/collapse* (*more/less*). |

---

### F. RINGKASAN HASIL DAN KESIMPULAN

1. **Penerapan Named Route:**
   - Named Route mempermudah pengelolaan navigasi antarhalaman dalam aplikasi berskala besar karena setiap tujuan rute didefinisikan secara terpusat di `main.dart`.
   - Mengirim data antarhalaman menjadi sangat bersih menggunakan properti `arguments` pada `Navigator.pushNamed()` dan diekstrak menggunakan `ModalRoute.of(context)!.settings.arguments`.
   - Tombol kembali dapat dieksekusi dengan mudah dan aman menggunakan `Navigator.pop(context)`.

2. **Keuntungan JSON Serialization Otomatis:**
   - Paket `json_annotation` dan `json_serializable` bersama `build_runner` mengotomatiskan konversi data JSON kompleks ke dalam objek Dart tipe statis yang *type-safe*.
   - Mengurangi kemungkinan kesalahan pengetikan nama kunci (*keys*) dan memudahkan penyesuaian ketika struktur data API mengalami perubahan.

3. **Efisiensi State Asinkron:**
   - Widget `FutureBuilder` menyederhanakan siklus penanganan permintaan data asinkron (*waiting*, *error*, dan *data*), sehingga aplikasi tidak macet saat menunggu respons dari jaringan internet.

4. **Desain Antarmuka Terstruktur:**
   - Kombinasi widget seperti `Stack`, `Positioned`, `ClipRRect`, `Card`, `ListTile`, dan `SingleChildScrollView` menghasilkan tata letak antarmuka yang modern, rapi, dan responsif di berbagai resolusi layar perangkat.
