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
                const Text(
                  'Esta aplicacion tiene los contenidos pedidos hasta el laboratorio 5 del curso de dispositivos moviles',
                  style: TextStyle(fontSize: 20),
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
