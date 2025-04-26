import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restartCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //persistentFooterButtons: botonesDePie,
      body: Card(
        color: Colors.green,
        margin: const EdgeInsets.all(45.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'titulo cosa xd',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Has presionado el boton estas veces:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: botonesDePie,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get botonesDePie {
    return [
      TextButton(onPressed: _incrementCounter, child: const Icon(Icons.add)),
      TextButton(onPressed: _decrementCounter, child: const Icon(Icons.remove)),
      TextButton(
          onPressed: _restartCounter, child: const Icon(Icons.exposure_zero)),
    ];
  }
}
