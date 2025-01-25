import 'package:flutter/material.dart';

showSnackbar(BuildContext context, String message, Color bgColor) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
    ),
  );
}
