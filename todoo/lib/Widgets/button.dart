import 'package:flutter/material.dart';

class Mybuttonn extends StatefulWidget {
  final String child;
  final VoidCallback onPressed;
  const Mybuttonn({super.key, required this.onPressed, required this.child});

  @override
  State<Mybuttonn> createState() => _MybuttonnState();
}

class _MybuttonnState extends State<Mybuttonn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.primaryContainer),
        shape: WidgetStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
      ),
      child: Center(
        child: Text(
          widget.child,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
