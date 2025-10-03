import 'package:flutter/material.dart';
import '../data/app_state.dart';

class LessonPage extends StatefulWidget {
  final String courseName;
  const LessonPage({super.key, required this.courseName});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int currentIndex = 1;

  void _complete() {
    AppState.completeLesson();
    if (currentIndex < AppState.totalLessons) {
      setState(() => currentIndex++);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Курс пройден!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cc = Theme.of(context).colorScheme;
    final done = AppState.completedLessons;
    final total = AppState.totalLessons;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseName),
        backgroundColor: cc.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Урок $currentIndex из $total', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cc.surfaceVariant.withOpacity(.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Контент урока: здесь может быть текст, схема, список шагов, скриншоты и т.д.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text('Выполнено: $done / $total'),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Отметить урок выполненным'),
              onPressed: _complete,
            ),
          ],
        ),
      ),
    );
  }
}
