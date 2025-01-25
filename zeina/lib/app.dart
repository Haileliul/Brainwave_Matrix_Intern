import 'package:flutter/material.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/home/presentation/detailed_page.dart';
import 'core/utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detailed': (context) => DetailedPage(),
      },
    );
  }
}
