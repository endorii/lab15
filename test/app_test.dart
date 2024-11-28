import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

class FunctionCalculator {
  double calculate(double x) {
    return 8 * x * x - 9 * x;
  }
}

void main() {
  group('Тестування виразу', () {
    test('Обчислення y = 8x^2 - 9x вірні', () {
      final calculator = FunctionCalculator();
      expect(calculator.calculate(0), 0);
      expect(calculator.calculate(1), -1);
      expect(calculator.calculate(2), 14);
      expect(calculator.calculate(-1), 17);
    });
  });

  group('Тестування групи, іконки та кроку', () {

    testWidgets("Ім'я та група", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text("SE-31: Serhii\'s last Flutter App"), findsOneWidget);
    });

    testWidgets('Іконка', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final fabIcon = find.byIcon(Icons.camera_alt_outlined);
      expect(fabIcon, findsOneWidget);
    });


    testWidgets('Крок', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('0'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      expect(find.text('6'), findsOneWidget);
    });
  });
}
