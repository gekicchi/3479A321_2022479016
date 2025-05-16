import 'package:flutter/material.dart';
import 'list_content.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() {
    print("create state");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  bool mounted = false;

  _MyHomePageState() {
    mounted = true;
  }

  @override
  void initState() {
    print('initState() called');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() called');
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    print('setState() called');
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print('didUpdateWidget() called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate() called');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose() called');
    super.dispose();
  }

  @override
  void reassemble() {
    print('reassemble() called');
    super.reassemble();
  }

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
    print("build() called");
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: botonesDePie,
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: otrasPaginas,
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

  List<Widget> get otrasPaginas {
    return [
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListContent()),
          );
        },
        child: const Text('Lista de Contenido'),
      ),
    ];
  }
}
