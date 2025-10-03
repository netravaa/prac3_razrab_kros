import 'package:flutter/material.dart';
import '../data/app_state.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    final cc = Theme.of(context).colorScheme;
    final done = AppState.completedLessons;
    final total = AppState.totalLessons;
    final progress = total == 0 ? 0.0 : done / total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Прогресс обучения'),
        backgroundColor: cc.tertiaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cc.tertiaryContainer.withOpacity(.45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppState.studentFio, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  Text('Группа: ${AppState.group}'),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 6),
                  Text('Уроков выполнено: $done из $total'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Сбросить прогресс'),
              onPressed: () {
                setState(AppState.resetProgress);
              },
            ),
          ],
        ),
      ),
    );
  }
}
