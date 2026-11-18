import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modul2/main.dart';

void main() {
  testWidgets('Menampilkan grid 2x2 dengan 4 kotak berwarna berbeda dan icon favorite merah', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Row and Column'), findsOneWidget);
    expect(find.byType(KotakBiruJempol), findsNWidgets(4));
    expect(find.byIcon(Icons.favorite), findsNWidgets(4));
    expect(find.text('Kotak 1'), findsOneWidget);
    expect(find.text('Kotak 2'), findsOneWidget);
    expect(find.text('Kotak 3'), findsOneWidget);
    expect(find.text('Kotak 4'), findsOneWidget);

    final icons = tester.widgetList<Icon>(find.byIcon(Icons.favorite));
    for (final icon in icons) {
      expect(icon.color, Colors.red);
    }

    final boxes = tester.widgetList<KotakBiruJempol>(find.byType(KotakBiruJempol));
    final uniqueColors = boxes.map((box) => box.color).toSet();
    expect(uniqueColors.length, 4);
  });
}
