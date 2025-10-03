
class AppState {
  static String studentFio = 'Соколов Владимир Дмитриевич';
  static String group = 'ИКБО-12-22';

  static String selectedCourse = 'Нет';
  static int totalLessons = 12;
  static int completedLessons = 0;

  static void chooseCourse(String name, {int lessons = 12}) {
    selectedCourse = name;
    totalLessons = lessons;
  }

  static void completeLesson() {
    if (completedLessons < totalLessons) {
      completedLessons++;
    }
  }

  static void resetProgress() {
    completedLessons = 0;
  }
}
