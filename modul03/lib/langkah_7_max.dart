import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah7MaxApp());
}

class Langkah7MaxApp extends StatelessWidget {
  const Langkah7MaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah7MaxScreen(),
    );
  }
}

class Langkah7MaxScreen extends StatelessWidget {
  const Langkah7MaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Langkah 7 - Column (MainAxisSize.max)'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
