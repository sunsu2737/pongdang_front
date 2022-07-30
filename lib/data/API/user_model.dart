// ignore_for_file: non_constant_identifier_names

class UserMom {
  late String? name = '';
  late String? nickname = '';
  late String? id = '';
  late String? password = '';
  late String? email = '';
  late String? region = '';
  late String? birth = '';

  UserMom(
      {this.name = '',
      this.email,
      this.id = '',
      this.password = '',
      this.region = '',
      this.birth = '',
      this.nickname=''});

  UserMom.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nickname = json['nickname'];
    id = json['id'];
    password = json['password'];
    email = json['email'];
    region = json['region'];
    birth = json['birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, String>();
    data['name'] = name;
    data['nickname'] = nickname;
    data['id'] = id;
    data['password'] = password;
    data['email'] = email;
    data['region'] = region;
    data['birth'] = birth;

    return data;
  }
}

class UserKid {
  late String email;
  late String? birth;
  late String? name;
  late String? gender;
  late String? unique;

  UserKid({
    required this.email,
    this.birth,
    this.gender,
    this.name,
    this.unique,
  });

  UserKid.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unique = json['unique'];
    email = json['email'];
    gender = json['gender'];
    birth = json['birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['birth'] = birth;
    data['gender'] = gender;
    data['unique'] = unique;
    return data;
  }
}
