import 'package:flutter/material.dart';
import 'widgets/kotak_biru.dart';

void main() {
  runApp(const Langkah8VariasiRowApp());
}

class Langkah8VariasiRowApp extends StatelessWidget {
  const Langkah8VariasiRowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Langkah8VariasiRowScreen(),
    );
  }
}

class Langkah8VariasiRowScreen extends StatefulWidget {
  const Langkah8VariasiRowScreen({super.key});

  @override
  State<Langkah8VariasiRowScreen> createState() => _Langkah8VariasiRowScreenState();
}

class _Langkah8VariasiRowScreenState extends State<Langkah8VariasiRowScreen> {
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
        title: Text('Row: ${_currentAlignment.name}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Area display Row
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade50,
              ),
              child: Center(
                child: Row(
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
                  'Pilih Nilai MainAxisAlignment (untuk screenshot):',
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
