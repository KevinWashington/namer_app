import 'package:flutter/material.dart';
import 'package:namer_app/controller/myAppState.dart';
import 'package:namer_app/view/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 76, 152, 175)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}


