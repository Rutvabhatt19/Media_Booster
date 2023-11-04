import 'package:flutter/material.dart';
import 'package:media_booster/Provider.dart';
import 'package:media_booster/Screeen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Audiofunction(),
      ),
      ChangeNotifierProvider(
        create: (context) => videopro(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}
