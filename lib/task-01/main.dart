import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-01/providers/counter_providers.dart';
import 'package:week_05/task-01/providers/theme_providers.dart';
import 'package:week_05/task-01/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProviders()),
        ChangeNotifierProvider(create: (_) => ThemeProviders()),
      ],
      child: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProviders>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: HomeScreen(),
    );
  }
}
