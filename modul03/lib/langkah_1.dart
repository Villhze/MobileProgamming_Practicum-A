import 'package:flutter/material.dart';

void main() {
  runApp(const Langkah1App());
}

class Langkah1App extends StatelessWidget {
  const Langkah1App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah1Screen(),
    );
  }
}

class Langkah1Screen extends StatelessWidget {
  const Langkah1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
