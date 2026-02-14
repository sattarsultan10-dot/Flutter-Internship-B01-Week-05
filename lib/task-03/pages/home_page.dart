import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-03/provider/auth_providers.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProviders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              auth.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Welcome, ${auth.email}!", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
