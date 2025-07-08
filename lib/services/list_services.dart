import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cs_tech_assessment/utils/utils.dart';
import 'package:flutter/material.dart';

class ListServices {
  static Future<Map<String, dynamic>?> get_list({
    required BuildContext context,
    required String userID,
  }) async {
    final url = Uri.parse(
      'https://mock-api.calleyacd.com/api/list?userId=$userID',
    );

    try {
      final res = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      final data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return data;
      } else {
        ShowSnackBar(context, data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      ShowSnackBar(context, 'Error: ${e.toString()}');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> get_list_details({
    required BuildContext context,
    required String listID,
  }) async {
    final url = Uri.parse(
      'https://mock-api.calleyacd.com/api/list/$listID',
    );

    try {
      final res = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      final data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return data;
      } else {
        ShowSnackBar(context, data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      ShowSnackBar(context, 'Error: ${e.toString()}');
    }
    return null;
  }
}
