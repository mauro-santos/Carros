import 'dart:convert';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      final Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      final Map params = {
        "username": login,
        "password": senha,
      };

      // Converter para string para utilizar o header como application/json
      String s = json.encode(params);
      print("LoginApi > $s");

      var response = await http.post(url, body: s, headers: headers);

      print('LoginApi > Response status: ${response.statusCode}');
      print('LoginApi > Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
