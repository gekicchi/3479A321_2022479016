import 'package:flutter/material.dart';
import 'about.dart';

class ListContent extends StatelessWidget {
  const ListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contenido'),
      ),
      body: Card(
        color: Colors.lightBlue,
        margin: EdgeInsets.all(25.0),
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
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const About()),
            );
          },
          child: const Text('Acerca de'),
        ),
      ],
    );
  }
}
