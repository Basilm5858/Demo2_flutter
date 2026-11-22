import 'package:demo2/models/auth_model.dart';
import 'package:demo2/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? auth;

  Future<bool> login({required String email, required String password}) async {
    final response = await AuthService.login(email: email, password: password);
    auth = response;
    return response.status;
  }

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await AuthService.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    auth = response;
    return response.status;
  }
}
