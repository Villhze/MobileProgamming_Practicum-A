import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah7MinApp());
}

class Langkah7MinApp extends StatelessWidget {
  const Langkah7MinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah7MinScreen(),
    );
  }
}

class Langkah7MinScreen extends StatelessWidget {
  const Langkah7MinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Langkah 7 - Column (MainAxisSize.min)'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KotakBiruJempolKecil(),
            SizedBox(height: 20),
            KotakBiruJempol(),
            SizedBox(height: 20),
            KotakBiruJempolKecil(),
          ],
        ),
      ),
    );
  }
}
