import 'package:catlog_flutter/auth/login.dart';
import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(scaffoldBackgroundColor: const Color(0xff1f1f39)),
      routes: {
        "/": (context) => const Home(),
        '/login': (context) => const MainScreen()
      },
    );
  }
}
