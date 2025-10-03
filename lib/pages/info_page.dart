import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cc = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справка'),
        backgroundColor: cc.secondaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'О приложении',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Study Navigator — учебное приложение для практической работы: '
                'смена контента между экранами, логические связи и фиксация прогресса.',
          ),
          const SizedBox(height: 16),
          const Text(
            'Структура:',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          const Text('• Главная — приветствие и быстрые действия;'),
          const Text('• Курсы — выбор курса;'),
          const Text('• Урок — просмотр и отметка выполнения;'),
          const Text('• Прогресс — сводка и сброс;'),
          const Text('• Справка — описание и цели.'),
          const SizedBox(height: 24),

          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Назад'),
          ),
        ],
      ),
    );
  }
}
