/// name : "email@gmail.com"
/// email : "email@gmail.com"
/// skills : "a,b,v,d"
/// exprience : "2"
/// image : "abcd"

class UserDetailsModel {
  UserDetailsModel(
      {String? name,
      String? email,
      String? skills,
      String? exprience,
      String? image}) {
    _name = name;
    _email = email;
    _skills = skills;
    _exprience = exprience;
    _image = image;
  }

  UserDetailsModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _skills = json['skills'];
    _exprience = json['exprience'];
    _image = json['image'];
  }
  String? _name;
  String? _email;
  String? _skills;
  String? _exprience;
  String? _image;
  UserDetailsModel copyWith({
    String? name,
    String? email,
    String? skills,
    String? exprience,
    String? image,
  }) =>
      UserDetailsModel(
        name: name ?? _name,
        email: email ?? _email,
        skills: skills ?? _skills,
        exprience: exprience ?? _exprience,
        image: image ?? _image,
      );
  String? get name => _name;
  String? get email => _email;
  String? get skills => _skills;
  String? get exprience => _exprience;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['skills'] = _skills;
    map['exprience'] = _exprience;
    map['image'] = _image;
    return map;
  }
}
