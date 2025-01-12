import 'package:flutter/material.dart';

class Textfildform extends StatefulWidget {
  final String? hinttext;
  final String? valuetext;
  final String? placeholdertext;
  final TextEditingController? textcontroller;
  final bool autofocus;

  // final Function onChanged;

  const Textfildform({
    super.key,
    this.hinttext,
    this.valuetext,
    this.placeholdertext,
    required this.textcontroller,
    required this.autofocus,
  });

  @override
  State<Textfildform> createState() => _TextfildformState();
}

class _TextfildformState extends State<Textfildform> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        autofocus: widget.autofocus,
        controller: widget.textcontroller,
        decoration: InputDecoration(
          hintText: widget.hinttext,
        ),
      ),
    );
  }
}
