import 'package:pr2/domain/entity/user_entity.dart';

import '../../domain/entity/role_entity.dart';

class User extends UserEntity {
  User(
      {required super.phone,
      required super.login,
      required super.password,
      required super.idRole});

  Map<String, dynamic> toMap() {
    return {
      'phone':phone,
      'login': login,
      'password': password,
      'id_role': idRole.id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      phone: json['phone'],
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values.firstWhere(
        (element) => element.id == (json['id_role'] as int),
      ), 
    );
  }
}
