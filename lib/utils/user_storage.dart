import 'dart:convert';
import 'package:flutter/services.dart';

class StorageService {
  static Future<List<dynamic>> loadUsers() async {
    String jsonString = await rootBundle.loadString('assets/storage.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData['users'] ?? [];
  }
}
