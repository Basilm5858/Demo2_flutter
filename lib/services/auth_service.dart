import 'package:demo2/models/auth_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  static Dio dio = Dio();
  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      "https://elsewedyteam.runasp.net/api/Login/CheckUser",
      data: {"Email": email, "Password": password},
    );
    return AuthModel.fromJson(response.data);
  }

  static Future<AuthModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    Response response = await dio.post(
      "https://elsewedyteam.runasp.net/api/Register/AddUser",
      data: {
        "Name": name,
        "Email": email,
        "Phone": phone,
        "Password": password,
      },
    );
    return AuthModel.fromJson(response.data);
  }
}
