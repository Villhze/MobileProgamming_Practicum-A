import 'package:flutter_test/flutter_test.dart';
import 'package:modul12/main.dart';

void main() {
  testWidgets('Location app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify initial UI elements
    expect(find.text('Lokasi Saya'), findsOneWidget);
    expect(find.text('Tekan tombol untuk menampilkan lokasi.'), findsOneWidget);
    expect(find.text('TAMPILKAN LOKASI SAAT INI'), findsOneWidget);
  });
}
