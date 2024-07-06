class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? image;

  get getId => id;
  set setId(id) => this.id = id;

  get getName => name;

  get getEmail => email;

  get getPassword => password;

  UserModel({this.id, this.name, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    image = "https://ui-avatars.com/api/?size=128";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
