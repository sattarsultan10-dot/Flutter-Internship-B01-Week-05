import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-03/pages/home_page.dart';
import 'package:week_05/task-03/provider/auth_providers.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProviders>();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Form(
        key: _formKey, // ✅ attach key here
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: authProvider.validateEmail,
                onChanged: authProvider.setEmail,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: authProvider.validatePasswrod,
                onChanged: authProvider.setPassword,
              ),
              const SizedBox(height: 20),
              authProvider.isloading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            await authProvider.login();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Error: $e")));
                        }
                      },
                      child: const Text("Login"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
