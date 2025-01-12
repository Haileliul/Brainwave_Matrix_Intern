import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/urls.dart';

class ApiService {
  Future<List<dynamic>> fetchGeneralNews(String generalNewsEndpoint) async {
    final response =
        await http.get(Uri.parse('${Urls.baseUrl}$generalNewsEndpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
