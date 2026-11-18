import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah5App());
}

class Langkah5App extends StatelessWidget {
  const Langkah5App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah5Screen(),
    );
  }
}

class Langkah5Screen extends StatelessWidget {
  const Langkah5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment - Langkah 5 (MainAxisSize.max)'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
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
