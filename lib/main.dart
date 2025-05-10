import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'pages/my_home_page.dart';

//const String catIcon =
//    'C:/Users/oyarz/Desktop/moviles/3479A321_2022479016/assets/icons/cat_paw.svg';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
