import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah9App());
}

class Langkah9App extends StatelessWidget {
  const Langkah9App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah9Screen(),
    );
  }
}

class Langkah9Screen extends StatelessWidget {
  const Langkah9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment - Langkah 9 (CrossAxis.center)'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
