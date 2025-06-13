import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<StatefulWidget> createState() => _PictureState();
}

class _PictureState extends State<PictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('camara'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    try {
                      if (!context.mounted) return;

                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();

                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PreviewPictureScreen(imagePath: image.path),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('tomar foto')),
            ],
          ),
        ),
      ),
    );
  }
}

class PreviewPictureScreen extends StatelessWidget {
  final String imagePath;
  const PreviewPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vista')),
      body: Image.file(File(imagePath)),
    );
  }
}
