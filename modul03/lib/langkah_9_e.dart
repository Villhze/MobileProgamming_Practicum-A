import 'package:flutter/material.dart';

void main() {
  runApp(const Langkah9EApp());
}

class Langkah9EApp extends StatelessWidget {
  const Langkah9EApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah9EScreen(),
    );
  }
}

class Langkah9EScreen extends StatelessWidget {
  const Langkah9EScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Langkah 9e - Tanpa TextBaseline'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Suhu:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '25\u00B0C',
              style: TextStyle(fontSize: 75),
            ),
            Icon(
              Icons.sunny,
              color: Colors.amber,
              size: 45,
            ),
          ],
        ),
      ),
    );
  }
}
