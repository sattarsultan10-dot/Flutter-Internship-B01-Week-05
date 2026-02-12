import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-01/providers/counter_providers.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProviders>().counter;
    return Scaffold(
      appBar: AppBar(title: Text("Counter Second Screen")),
      body: Center(child: Text("Counter from another screen:$counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterProviders>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
