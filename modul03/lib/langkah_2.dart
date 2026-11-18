
import 'package:flutter/material.dart';

void main() {
  runApp(const Langkah2App());
}

class Langkah2App extends StatelessWidget {
  const Langkah2App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah2Screen(),
    );
  }
}

class Langkah2Screen extends StatelessWidget {
  const Langkah2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment - Langkah 2'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: KotakBiruJempol(),
      ),
    );
  }
}

// Langkah 2: Widget Kustom KotakBiruJempol
class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
