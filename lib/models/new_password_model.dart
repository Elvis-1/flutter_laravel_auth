class NewPasswordModel {
  String email;
  String password;
  String passwordConfirm;
  String code;
  NewPasswordModel({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'reset_code': code,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
  }
}
