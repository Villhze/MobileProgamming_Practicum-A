import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul11/main.dart';

void main() {
  testWidgets('Tasbih Digital GetX increments and resets properly', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());

    // Verify initial counter is 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap fingerprint icon to increment
    await tester.tap(find.byIcon(Icons.fingerprint));
    await tester.pump();

    // Verify counter increments to 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Tap reset button
    await tester.tap(find.byIcon(Icons.refresh_outlined));
    await tester.pump();

    // Verify counter resets to 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
