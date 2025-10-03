import 'package:flutter/material.dart';
import '../data/app_state.dart';
import 'courses_page.dart';
import 'progress_page.dart';
import 'info_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final cc = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Navigator — Главная'),
        backgroundColor: cc.primaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HeaderCard(),
          const SizedBox(height: 16),
          _ProgressStrip(onTap: _openProgress),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.menu_book_outlined),
                  label: const Text('Курсы'),
                  onPressed: _openCourses,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Справка'),
                  onPressed: _openInfo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openCourses() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CoursesPage()),
    );
    setState(() {}); // обновим карточки
  }

  void _openProgress() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProgressPage()),
    );
    setState(() {});
  }

  void _openInfo() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const InfoPage()));
  }
}

class _HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cc = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cc.primaryContainer.withOpacity(.6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Добро пожаловать!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text('${AppState.studentFio} • ${AppState.group}'),
          const SizedBox(height: 8),
          Text('Текущий курс: ${AppState.selectedCourse}'),
        ],
      ),
    );
  }
}

class _ProgressStrip extends StatelessWidget {
  final VoidCallback onTap;
  const _ProgressStrip({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final done = AppState.completedLessons;
    final total = AppState.totalLessons;
    final progress = total == 0 ? 0.0 : done / total;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Прогресс обучения', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 6),
            Text('Уроков выполнено: $done из $total'),
          ],
        ),
      ),
    );
  }
}
