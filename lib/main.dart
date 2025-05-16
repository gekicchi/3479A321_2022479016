import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'pages/my_home_page.dart';
import 'provider/appdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
        create: (context) => AppData(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Home Page'),
        ));
  }
}
