import "package:flutter/material.dart";
import 'Provider/PeriferanceProvider.dart';
import "Pages/SplashScreen.dart";
import 'Pages/home_page.dart';
import 'Util/themeData.dart';

class MyApp extends StatelessWidget {
  final Periferance periferance;
  const MyApp({super.key, required this.periferance});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/Home': (context) => MyHomePage(periferance: periferance),
      },
    );
  }
}
