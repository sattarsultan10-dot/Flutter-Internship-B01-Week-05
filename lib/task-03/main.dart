import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-03/pages/login_page.dart';
import 'package:week_05/task-03/provider/auth_providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AuthProviders(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
