import 'package:flutter/material.dart';

void main() {
  // Memastikan binding initialized sebelum menjalankan app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo GridView',
      // Memaksa tema terang agar tidak mengikuti settingan HP
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo GridView', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amber,
          elevation: 0,
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            tile(Colors.greenAccent.shade400, 'assets/icon/timetable.png', 'Jadwal Kuliah'),
            tile(Colors.blueAccent.shade400, 'assets/icon/boy.png', 'Kehadiran'),
            tile(Colors.yellowAccent.shade400, 'assets/icon/homeschooling.png', 'Tugas'),
            tile(Colors.redAccent.shade400, 'assets/icon/clipboard.png', 'Pengumuman'),
            tile(Colors.purpleAccent.shade400, 'assets/icon/marks.png', 'Nilai'),
            tile(Colors.tealAccent.shade400, 'assets/icon/pencil.png', 'Catatan'),
          ],
        ),
      ),
    );
  }
}

Widget tile(Color warnakotak, String gambar, String judul) {
  return Container(
    decoration: BoxDecoration(
      color: warnakotak,
      borderRadius: BorderRadius.circular(10),
    ),
    child: GridTile(
      footer: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.black45,
        child: Text(
          judul,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Center(
        child: Image.asset(
          gambar,
          width: 60,
          height: 60,
          fit: BoxFit.contain,
          // Error handling jika gambar tidak ada/rusak
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.image_not_supported, size: 40, color: Colors.white);
          },
        ),
      ),
    ),
  );
}
