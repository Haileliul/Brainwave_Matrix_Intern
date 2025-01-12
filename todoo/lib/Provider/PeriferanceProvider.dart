import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Periferance extends ChangeNotifier {
  Periferance({required this.prefs}) {
    _initializeSettings();
  }

  final SharedPreferences prefs;

  static Set<int> _selectedIndices = {}; // Changed to Set<int>

  Future<void> _initializeSettings() async {
    // Retrieve stored indices from SharedPreferences
    final indicesList = prefs.getStringList('SELECTED_INDICES') ?? [];
    _selectedIndices =
        indicesList.map(int.parse).toSet(); // Convert List<String> to Set<int>
    notifyListeners();
  }

  Future<void> setSelectedIndices(Set<int> value) async {
    // Convert Set<int> to List<String> for storage
    final indicesList = value.map((e) => e.toString()).toList();
    await prefs.setStringList('SELECTED_INDICES', indicesList);
    _selectedIndices = value;
    notifyListeners();
  }

  Set<int> getSelectedIndices() {
    return _selectedIndices;
  }
}
