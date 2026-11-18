import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah8VariasiColumnApp());
}

class Langkah8VariasiColumnApp extends StatelessWidget {
  const Langkah8VariasiColumnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah8VariasiColumnScreen(),
    );
  }
}

class Langkah8VariasiColumnScreen extends StatefulWidget {
  const Langkah8VariasiColumnScreen({super.key});

  @override
  State<Langkah8VariasiColumnScreen> createState() => _Langkah8VariasiColumnScreenState();
}

class _Langkah8VariasiColumnScreenState extends State<Langkah8VariasiColumnScreen> {
  MainAxisAlignment _currentAlignment = MainAxisAlignment.center;

  final List<MainAxisAlignment> _alignments = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceEvenly,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column: ${_currentAlignment.name}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Area display Column
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade50,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: _currentAlignment,
                  children: const [
                    KotakBiruJempolKecil(),
                    KotakBiruJempol(),
                    KotakBiruJempolKecil(),
                  ],
                ),
              ),
            ),
          ),

          // Kontrol Pemilihan Nilai MainAxisAlignment untuk Screenshot Laporan
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pilih Nilai MainAxisAlignment Column (untuk screenshot):',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: _alignments.map((alignment) {
                    final isSelected = _currentAlignment == alignment;
                    return ChoiceChip(
                      label: Text(
                        alignment.name,
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
                            _currentAlignment = alignment;
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
