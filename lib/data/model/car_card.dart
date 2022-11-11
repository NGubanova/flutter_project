import '../../domain/entity/car_card_entity.dart';

class CarCard extends CarCardEntity {
  CarCard({required super.idCard, 
  required super.idCar, 
  required super.idUser});

  Map<String, dynamic> toMap() {
    return {
      'id_card': idCard,
      'id_car': idCar,
      'id_user': idUser,
    };
  }

  factory CarCard.toFromMap(Map<String, dynamic> json) {
    return CarCard(
        idCard: json['id_card'],
        idCar: json['id_car'],
        idUser: json['id_user']);
  }
}
