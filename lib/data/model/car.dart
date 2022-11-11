import '../../domain/entity/car_entity.dart';

class Car extends CarEntity {
  Car({
    required super.model,
    required super.idBrand,
    required super.idCarBody,
    required super.idColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'id_brand': idBrand,
      'id_carbody': idCarBody,
      'id_color': idColor,
    };
  }

  factory Car.toFromMap(Map<String, dynamic> json) {
    return Car(
        model: json['model'],
        idBrand: json['id_brand'],
        idCarBody: json['id_carbody'],
        idColor: json['id_color']);
  }
}
