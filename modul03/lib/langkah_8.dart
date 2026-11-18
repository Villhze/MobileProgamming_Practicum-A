import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah8App());
}

class Langkah8App extends StatelessWidget {
  const Langkah8App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah8Screen(),
    );
  }
}

class Langkah8Screen extends StatelessWidget {
  const Langkah8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment - Langkah 8 (Center)'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KotakBiruJempolKecil(),
            KotakBiruJempol(),
            KotakBiruJempolKecil(),
          ],
        ),
      ),
    );
  }
}
