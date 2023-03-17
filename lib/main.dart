import 'package:flutter/material.dart';
import 'package:flutter_practical_test/provider/home_state.dart';
import 'package:flutter_practical_test/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeState(),
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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.green, primaryColor: Colors.white),
        home: const HomeScreen());
  }
}
