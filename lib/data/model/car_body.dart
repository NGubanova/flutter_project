import '../../domain/entity/car_body_entity.dart';

class CarBody extends CarBodyEntity {
  late int id;
  final String name;

  CarBody({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory CarBody.toFromMap(Map<String, dynamic> json) {
    return CarBody(name: json['name']);
  }
}