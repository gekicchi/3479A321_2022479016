import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'pages/my_home_page.dart';

const String catIcon =
    'C:/Users/oyarz/Desktop/moviles/3479A321_2022479016/assets/icons/cat_paw.svg';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
));

void main() {
  print(
      'Run with either `dart example/main.dart` or `dart --enable-asserts example/main.dart`´.');
  demo();
  runApp(const MyApp());
}

void demo() {
  logger.d('Log message with 2 methods');

  loggerNoStack.i('Info message');

  loggerNoStack.w('Just a warning!');

  logger.e('Error! Something bad happened', error: 'Test Error');

  loggerNoStack.t({'key': 5, 'value': 'something'});

  Logger(printer: SimplePrinter(colors: true)).t('boom');
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
