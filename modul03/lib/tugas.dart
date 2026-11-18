import 'package:flutter/material.dart';

void main() {
  runApp(const TugasApp());
}

class TugasApp extends StatelessWidget {
  const TugasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TugasWeatherScreen(),
    );
  }
}

class TugasWeatherScreen extends StatelessWidget {
  const TugasWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Nama Kota
              const Text(
                'Malang',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 30),

              // Suhu Utama
              const Text(
                '25°',
                style: TextStyle(
                  fontSize: 88,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  height: 1.0,
                ),
              ),

              const SizedBox(height: 70),

              // Row Perkiraan Cuaca 3 Hari (Minggu, Senin, Selasa)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _WeatherDayColumn(
                    day: 'Minggu',
                    icon: Icons.sunny,
                    temperature: '20°C',
                  ),
                  _WeatherDayColumn(
                    day: 'Senin',
                    icon: Icons.cloudy_snowing,
                    temperature: '23°C',
                  ),
                  _WeatherDayColumn(
                    day: 'Selasa',
                    icon: Icons.cloud,
                    temperature: '22°C',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk item cuaca per hari
class _WeatherDayColumn extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temperature;

  const _WeatherDayColumn({
    required this.day,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Icon(
          icon,
          size: 38,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
        Text(
          temperature,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
