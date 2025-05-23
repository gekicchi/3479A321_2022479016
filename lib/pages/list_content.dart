import 'package:flutter/material.dart';

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
    );
  }
}
