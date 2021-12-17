import 'dart:convert';

import 'package:camaradas_rc_movil/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:camaradas_rc_movil/global/environment.dart';

class AuthService with ChangeNotifier {
  Future login(String correo, String contrasena) async {
    final data = {'correo': correo, 'contrasena': contrasena};
    print('${Environment.apiUrl}/login/');

    final resp = await http.post(Uri.parse('${Environment.apiUrl}/login/'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
    }
  }
}
