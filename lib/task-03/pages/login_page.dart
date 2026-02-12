import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-03/provider/auth_providers.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("logIn")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          key: _formKey,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Email"),
              validator: authProvider.validateEmail,
              onChanged: authProvider.setEmail,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "Password"),
              validator: authProvider.validatePasswrod,
              onChanged: authProvider.setPassword,
            ),
            SizedBox(height: 10),
            authProvider.isloading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authProvider.login();
                      }
                    },
                    child: Text("Login"),
                  ),
          ],
        ),
      ),
    );
  }
}
