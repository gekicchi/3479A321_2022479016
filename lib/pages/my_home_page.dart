import 'package:application_laboratorio/pages/picture_screen.dart';
import 'package:application_laboratorio/provider/appdata.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'list_content.dart';
import 'about.dart';
import 'preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late String urlImagen = '1';
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;

  @override
  bool mounted = false;

  _MyHomePageState() {
    mounted = true;
  }

  void _getNewImage() async {
    // String counterNum = '${context.read<AppData>().counter}';
    // urlImagen = 'https://picsum.photos/250?image=$counterNum';

    final newImageURL =
        'https://picsum.photos/250?image=${context.read<AppData>().counter}';
    try {
      final response = await http.get(Uri.parse(newImageURL));
      if (response.statusCode == 200) {
        setState(() {
          urlImagen = newImageURL;
        });
      } else {
        setState(() {
          urlImagen = '';
        });
      }
    } catch (e) {
      setState(() {
        urlImagen = '';
      });
    }
  }

  Future<void> _loadCameras() async {
    cameras = await availableCameras();
    setState(() {
      firstCamera = cameras.first;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            ListTile(
              title: Text('Lista de Contenido'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListContent())),
            ),
            ListTile(
              title: Text('Detalle'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About())),
            ),
            ListTile(
              title: Text('Preferencias'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Preferences())),
            ),
            ListTile(
              title: Text('Camara'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PictureScreen(
                            camera: firstCamera,
                          ))),
            ),
          ],
        ),
      ),
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
                  'Mi Aplicacion de Laboratorio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Image.network(
                  urlImagen.isNotEmpty ? urlImagen : '',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        'Fallo al cargar la imagen',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
                const Text(
                  'Has presionado el boton estas veces:',
                ),
                Text(
                  '${context.watch<AppData>().counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: botonesDePie,
                ),
                Text('Nombre de usuario: ${context.watch<AppData>().username}'),
                TextButton(
                    onPressed: context.read<AppData>().toggleRestart,
                    child: Text('Mostrar/Ocultar Cero')),
                TextButton(
                    onPressed: () {
                      _getNewImage();
                    },
                    child: Text('Refrescar Imagen'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get botonesDePie {
    final btnPlus = TextButton(
        onPressed: context.read<AppData>().incrementCounter,
        child: const Icon(Icons.add));

    final btnMinus = TextButton(
        onPressed: context.read<AppData>().decrementCounter,
        child: const Icon(Icons.remove));

    final btnZero = TextButton(
        onPressed: context.read<AppData>().resetCounter,
        child: const Icon(Icons.exposure_zero));

    return [btnPlus, btnMinus, if (context.watch<AppData>().restart) btnZero];
  }
}
