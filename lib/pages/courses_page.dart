import 'package:flutter/material.dart';
import '../data/app_state.dart';
import 'lesson_page.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = const [
      ('Основы Flutter', 12),
      ('Алгоритмы и структуры', 10),
      ('Базы данных', 14),
      ('Инф. безопасность', 8),
      ('Сети и протоколы', 11),
    ];

    final cc = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор курса'),
        backgroundColor: cc.secondaryContainer,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final (name, lessons) = list[i];
          final selected = AppState.selectedCourse == name;
          return ListTile(
            tileColor: selected ? cc.primaryContainer.withOpacity(.5) : cc.surfaceVariant.withOpacity(.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text('Уроков: $lessons'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () {
              AppState.chooseCourse(name, lessons: lessons);
              AppState.resetProgress();
              Navigator.push(context, MaterialPageRoute(builder: (_) => LessonPage(courseName: name)));
            },
          );
        },
      ),
    );
  }
}
