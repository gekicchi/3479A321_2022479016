import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: Card(
        color: Colors.red,
        margin: EdgeInsets.all(55.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Volver')),
      ],
    );
  }
}
