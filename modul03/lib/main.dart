import 'package:flutter/material.dart';

// Import seluruh modul langkah kerja dan tugas
import 'langkah_1.dart';
import 'langkah_2.dart';
import 'langkah_3.dart';
import 'langkah_4.dart';
import 'langkah_5.dart';
import 'langkah_6.dart';
import 'langkah_7_max.dart';
import 'langkah_7_min.dart';
import 'langkah_8.dart';
import 'langkah_8_variasi_row.dart';
import 'langkah_8_variasi_column.dart';
import 'langkah_9.dart';
import 'langkah_9_variasi_row.dart';
import 'langkah_9_variasi_column.dart';
import 'langkah_9_e.dart';
import 'langkah_9_f.dart';
import 'tugas.dart';

void main() {
  runApp(const MainMenuApp());
}

class MainMenuApp extends StatelessWidget {
  const MainMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Pertemuan III - Alignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Langkah 1 - Proyek Baru & AppBar',
        'subtitle': 'Scaffold, AppBar Alignment, Center Hello Flutter',
        'badge': 'Dasar',
        'color': Colors.blue,
        'widget': const Langkah1Screen(),
      },
      {
        'title': 'Langkah 2 - KotakBiruJempol',
        'subtitle': 'Widget Kotak Biru 100x100 dengan Icon Jempol',
        'badge': 'Widget Kustom',
        'color': Colors.indigo,
        'widget': const Langkah2Screen(),
      },
      {
        'title': 'Langkah 3 - KotakBiruJempolKecil',
        'subtitle': 'Widget Kotak Biru Ukuran Lebih Kecil (75x75)',
        'badge': 'Widget Kustom',
        'color': Colors.indigo,
        'widget': const Langkah3Screen(),
      },
      {
        'title': 'Langkah 4 - Menambahkan Row',
        'subtitle': 'Row berisi Kotak Kecil - Sedang - Kecil dengan SizedBox(20)',
        'badge': 'Row',
        'color': Colors.teal,
        'widget': const Langkah4Screen(),
      },
      {
        'title': 'Langkah 5 - Row (MainAxisSize.max)',
        'subtitle': 'Row mengambil seluruh lebar sumbu horizontal',
        'badge': 'MainAxisSize',
        'color': Colors.teal,
        'widget': const Langkah5Screen(),
      },
      {
        'title': 'Langkah 6 - Row (MainAxisSize.min)',
        'subtitle': 'Row menyesuaikan ukuran anak, terpusat di layar',
        'badge': 'MainAxisSize',
        'color': Colors.teal,
        'widget': const Langkah6Screen(),
      },
      {
        'title': 'Langkah 7a - Column (MainAxisSize.max)',
        'subtitle': 'Column memenuhi seluruh tinggi sumbu vertikal',
        'badge': 'Column',
        'color': Colors.orange,
        'widget': const Langkah7MaxScreen(),
      },
      {
        'title': 'Langkah 7b - Column (MainAxisSize.min)',
        'subtitle': 'Column hanya setinggi total widget anak, terpusat',
        'badge': 'Column',
        'color': Colors.orange,
        'widget': const Langkah7MinScreen(),
      },
      {
        'title': 'Langkah 8 - Row (MainAxisAlignment.center)',
        'subtitle': 'Row asli dari modul tanpa SizedBox, posisi tengah',
        'badge': 'MainAxisAlignment',
        'color': Colors.purple,
        'widget': const Langkah8Screen(),
      },
      {
        'title': 'Langkah 8c - Variasi Row MainAxisAlignment',
        'subtitle': 'Pilih start, center, end, spaceBetween, spaceAround, spaceEvenly',
        'badge': 'Uji Lengkap',
        'color': Colors.purple,
        'widget': const Langkah8VariasiRowScreen(),
      },
      {
        'title': 'Langkah 8d - Variasi Column MainAxisAlignment',
        'subtitle': 'Pilih seluruh nilai MainAxisAlignment pada Column',
        'badge': 'Uji Lengkap',
        'color': Colors.purple,
        'widget': const Langkah8VariasiColumnScreen(),
      },
      {
        'title': 'Langkah 9 - Row CrossAxisAlignment.center',
        'subtitle': 'Row dengan spaceEvenly dan crossAxisAlignment: center',
        'badge': 'CrossAxis',
        'color': Colors.deepOrange,
        'widget': const Langkah9Screen(),
      },
      {
        'title': 'Langkah 9c - Variasi Row CrossAxisAlignment',
        'subtitle': 'Pilih start, center, end, stretch pada Row',
        'badge': 'Uji Lengkap',
        'color': Colors.deepOrange,
        'widget': const Langkah9VariasiRowScreen(),
      },
      {
        'title': 'Langkah 9d - Variasi Column CrossAxisAlignment',
        'subtitle': 'Pilih start, center, end, stretch pada Column',
        'badge': 'Uji Lengkap',
        'color': Colors.deepOrange,
        'widget': const Langkah9VariasiColumnScreen(),
      },
      {
        'title': 'Langkah 9e - Suhu (Sebelum Baseline)',
        'subtitle': 'Suhu: 30 & 25°C 75 belum sejajar garis dasar teks',
        'badge': 'Baseline',
        'color': Colors.amber.shade900,
        'widget': const Langkah9EScreen(),
      },
      {
        'title': 'Langkah 9f - Suhu (Dengan Baseline & Alphabetic)',
        'subtitle': 'Garis dasar huruf Suhu: dan 25°C sejajar sempurna',
        'badge': 'Baseline',
        'color': Colors.amber.shade900,
        'widget': const Langkah9FScreen(),
      },
      {
        'title': 'Tugas 2.4 - UI Cuaca Kota Malang',
        'subtitle': 'Tampilan Malang, 25°, Minggu (sunny), Senin (cloudy_snowing), Selasa (cloud)',
        'badge': 'Tugas Akhir',
        'color': Colors.green.shade700,
        'widget': const TugasWeatherScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Praktikum Modul III'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            elevation: 1.5,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item['color'] as Color,
                foregroundColor: Colors.white,
                radius: 16,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text(
                item['subtitle'] as String,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['widget'] as Widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
