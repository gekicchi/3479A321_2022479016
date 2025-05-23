import 'package:application_laboratorio/provider/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  About({super.key});
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: Card(
        color: const Color.fromARGB(255, 226, 117, 109),
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
                  'Esta aplicacion tiene los contenidos pedidos hasta el laboratorio 6 del curso de dispositivos moviles',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'Contador:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '${context.watch<AppData>().counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text('Nombre de usuario: ${context.read<AppData>().username}'),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: 'Nuevo Usuario'),
                ),
                TextButton(
                    onPressed: () => context
                        .read<AppData>()
                        .changeUsername(textController.text),
                    child: Text('Cambiar Nombre')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
