import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah9VariasiRowApp());
}

class Langkah9VariasiRowApp extends StatelessWidget {
  const Langkah9VariasiRowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah9VariasiRowScreen(),
    );
  }
}

class Langkah9VariasiRowScreen extends StatefulWidget {
  const Langkah9VariasiRowScreen({super.key});

  @override
  State<Langkah9VariasiRowScreen> createState() => _Langkah9VariasiRowScreenState();
}

class _Langkah9VariasiRowScreenState extends State<Langkah9VariasiRowScreen> {
  CrossAxisAlignment _currentCross = CrossAxisAlignment.center;

  final List<CrossAxisAlignment> _options = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.stretch,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row CrossAxis: ${_currentCross.name}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Row dengan tinggi wadah agar efek sumbu silang (vertikal) terlihat jelas
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade300, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: _currentCross,
                children: const [
                  KotakBiruJempolKecil(),
                  KotakBiruJempol(),
                  KotakBiruJempolKecil(),
                ],
              ),
            ),
          ),

          // Pilihan nilai CrossAxisAlignment
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pilih Nilai CrossAxisAlignment Row (untuk screenshot):',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _options.map((cross) {
                    final isSelected = _currentCross == cross;
                    return ChoiceChip(
                      label: Text(
                        cross.name,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Colors.blue,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _currentCross = cross;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
