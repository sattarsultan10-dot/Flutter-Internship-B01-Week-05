import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-02/pages/productList_page.dart';
import 'package:week_05/task-02/providers/auth_providers.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login to Cart App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: auth.validateEmail,
                onChanged: auth.setEmail,
              ),
              SizedBox(height: 16),

              // Password
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: auth.setPassword,
              ),
              SizedBox(height: 16),

              // Login button
              auth.isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await auth.login();

                            // Navigate to CartPage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductListPage(),
                              ),
                            );
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
