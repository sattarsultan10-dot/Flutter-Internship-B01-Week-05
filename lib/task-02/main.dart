import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-02/pages/login_page.dart';
import 'package:week_05/task-02/providers/auth_providers.dart';
import 'package:week_05/task-02/providers/cart_providers.dart';
import 'package:week_05/task-02/providers/product_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProviders()),
        ChangeNotifierProvider(create: (_) => CartProviders()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping Cart App",
        home: LoginPage(),
      ),
    );
  }
}
