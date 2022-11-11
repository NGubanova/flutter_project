import '../../domain/entity/favorites_entity.dart';

class Favorites extends FavoritesEntity {
  Favorites({
    required super.idCar,
    required super.idUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_car': idCar,
      'id_user': idUser,
    };
  }

  factory Favorites.toFromMap(Map<String, dynamic> json) {
    return Favorites(
        idCar: json['id_car'],
        idUser: json['id_user']);
  }
}