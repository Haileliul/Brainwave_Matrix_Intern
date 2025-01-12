import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/Home");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*  Taskbarupdater(); */
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Animate(
            effects: const [
              FadeEffect(
                duration: Duration(seconds: 2),
              ),
              ScaleEffect(
                duration: Duration(seconds: 2),
              )
            ],
            child: Image.asset('Assets/Images/todo_logo.png'),
          ),
        ),
      ),
    );
  }
}
