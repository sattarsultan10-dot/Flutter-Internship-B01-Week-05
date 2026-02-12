import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-01/providers/counter_providers.dart';
import 'package:week_05/task-01/providers/theme_providers.dart';
import 'package:week_05/task-01/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProviders>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProviders>().toggleTheme();
            },
            icon: Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Consumer<CounterProviders>(
              builder: (context, provider, child) {
                return Text(
                  provider.counter.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => counterProvider.increment(),
                  child: Text("Increment"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => counterProvider.decrement(),
                  child: Text("Decrement"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SecondScreen()),
                );
              },
              child: Text("Press to go to the next screen"),
            ),
          ],
        ),
      ),
    );
  }
}
