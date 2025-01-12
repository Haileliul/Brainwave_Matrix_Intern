import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' show Platform;
import 'App.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/PeriferanceProvider.dart';

void main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // Create a Periferance instance
  final periferance = Periferance(prefs: prefs);

  runApp(MyApp(periferance: periferance));
}
