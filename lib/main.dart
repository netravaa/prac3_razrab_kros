import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(const StudyNavigatorApp());
}

class StudyNavigatorApp extends StatelessWidget {
  const StudyNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Navigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}
