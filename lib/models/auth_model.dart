class AuthModel {
  final String message;
  final bool status;

  new({required this.message, required this.status});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(message: json["message"], status: json["status"]);
  }
}
