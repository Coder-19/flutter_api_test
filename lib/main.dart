import 'package:flutter/material.dart';
import 'package:flutter_api_test/networking/networking.dart';
import 'package:flutter_api_test/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Networking(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Api Test',
        home: HomeScreen(),
      ),
    );
  }
}
