import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah4App());
}

class Langkah4App extends StatelessWidget {
  const Langkah4App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah4Screen(),
    );
  }
}

class Langkah4Screen extends StatelessWidget {
  const Langkah4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
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
