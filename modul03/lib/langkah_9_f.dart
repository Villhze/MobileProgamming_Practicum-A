import 'package:flutter/material.dart';

void main() {
  runApp(const Langkah9FApp());
}

class Langkah9FApp extends StatelessWidget {
  const Langkah9FApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah9FScreen(),
    );
  }
}

class Langkah9FScreen extends StatelessWidget {
  const Langkah9FScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Langkah 9f - Dengan TextBaseline'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
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
