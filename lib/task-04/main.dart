import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-04/pages/notes_pages.dart';
import 'package:week_05/task-04/providers/notes_providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NotesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NotesListPage());
  }
}
