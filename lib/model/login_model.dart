/// email : "email@gmail.com"
/// password : "email@gmail.com"
/// remember_me : "true"

class LoginModel {
  LoginModel({
    String? email,
    String? password,
    String? rememberMe,
  }) {
    _email = email;
    _password = password;
    _rememberMe = rememberMe;
  }

  LoginModel.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _rememberMe = json['remember_me'];
  }
  String? _email;
  String? _password;
  String? _rememberMe;
  LoginModel copyWith({
    String? email,
    String? password,
    String? rememberMe,
  }) =>
      LoginModel(
        email: email ?? _email,
        password: password ?? _password,
        rememberMe: rememberMe ?? _rememberMe,
      );
  String? get email => _email;
  String? get password => _password;
  String? get rememberMe => _rememberMe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['remember_me'] = _rememberMe;
    return map;
  }
}
