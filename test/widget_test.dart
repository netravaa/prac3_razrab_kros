import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prac3/main.dart';

void main() {
  testWidgets('Приложение запускается и отображает приветствие',
          (WidgetTester tester) async {
        // Запуск приложения
        await tester.pumpWidget(const StudyNavigatorApp());

        // Проверяем наличие текста
        expect(find.text('Добро пожаловать!'), findsOneWidget);
      });
}
