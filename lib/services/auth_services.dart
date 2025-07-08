import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cs_tech_assessment/utils/utils.dart';

class AuthServices {
  static Future<Map<String, dynamic>?> register({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://mock-api.calleyacd.com/api/auth/register');

    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      final data = jsonDecode(res.body);

      if (data['message'] == "User registered") {
        return data;
      } else {
        ShowSnackBar(context, data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      ShowSnackBar(context, 'Error: ${e.toString()}');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://mock-api.calleyacd.com/api/auth/login');

    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      final data = jsonDecode(res.body);

      if (data['message'] == "Login successful") {
        return data;
      } else {
        ShowSnackBar(context, data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      ShowSnackBar(context, 'Error: ${e.toString()}');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> send_otp({
    required BuildContext context,
    required String email,
  }) async {
    final url = Uri.parse('https://mock-api.calleyacd.com/api/auth/send-otp');

    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email}),
      );

      final data = jsonDecode(res.body);

      if (data['message'] == "OTP sent") {
        return data;
      } else {
        ShowSnackBar(context, data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      ShowSnackBar(context, 'Error: ${e.toString()}');
    }
    return null;
  }

  static Future<Map<String, dynamic>?> verify_otp({
    required BuildContext context,
    required String email,
    required String otp,
  }) async {
    final url = Uri.parse('https://mock-api.calleyacd.com/api/auth/verify-otp');

    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "otp": otp}),
      );

      final data = jsonDecode(res.body);

      if (data['message'] == "OTP Verfied") {
        ShowSnackBar(context, 'otp verification successful');
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
