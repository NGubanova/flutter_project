import '../../domain/entity/card_entity.dart';

class Cards extends CardsEntity {
  Cards({required super.price});

  Map<String, dynamic> toMap() {
    return {
      'price': price,
    };
  }

  factory Cards.toFromMap(Map<String, dynamic> json) {
    return Cards(price: json['price']);
  }
}
