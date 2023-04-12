import 'dart:convert';

class SignupBody {
  String userName;
  String email;
  String password;
  String passwordConfirm;
  SignupBody(
      {required this.email,
      required this.password,
      required this.userName,
      required this.passwordConfirm});

  Map<String, dynamic> toJson() {
    return {
      'name': userName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
  }

  factory SignupBody.fromJson(Map<String, dynamic> map) {
    return SignupBody(
      userName: map['user_name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordConfirm: map['password_confirmation'] ?? '',
    );
  }
}
