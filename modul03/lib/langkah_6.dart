import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah6App());
}

class Langkah6App extends StatelessWidget {
  const Langkah6App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah6Screen(),
    );
  }
}

class Langkah6Screen extends StatelessWidget {
  const Langkah6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment - Langkah 6 (MainAxisSize.min)'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            KotakBiruJempolKecil(),
            SizedBox(width: 20), // jarak antar kotak
            KotakBiruJempol(),
            SizedBox(width: 20),
            KotakBiruJempolKecil(),
          ],
        ),
      ),
    );
  }
}
