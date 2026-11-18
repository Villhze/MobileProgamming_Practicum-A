import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah9VariasiColumnApp());
}

class Langkah9VariasiColumnApp extends StatelessWidget {
  const Langkah9VariasiColumnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah9VariasiColumnScreen(),
    );
  }
}

class Langkah9VariasiColumnScreen extends StatefulWidget {
  const Langkah9VariasiColumnScreen({super.key});

  @override
  State<Langkah9VariasiColumnScreen> createState() => _Langkah9VariasiColumnScreenState();
}

class _Langkah9VariasiColumnScreenState extends State<Langkah9VariasiColumnScreen> {
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
        title: Text('Column CrossAxis: ${_currentCross.name}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Column dengan wadah penuh agar efek sumbu silang (horizontal) terlihat jelas
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade300, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
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
                  'Pilih Nilai CrossAxisAlignment Column (untuk screenshot):',
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
