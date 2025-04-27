import 'package:flutter/material.dart';
import 'about.dart';

class ListContent extends StatelessWidget {
  ListContent({super.key});

  final List<String> elementos = [
    'Harry Potter',
    'Percy Jackson',
    'Alicia en el Pais de las Maravillas',
    'Mujercitas',
    'Orgullo y Prejuicio'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contenido'),
      ),
      body: ListView.builder(
        itemCount: elementos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(elementos[index]),
          );
        },
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
