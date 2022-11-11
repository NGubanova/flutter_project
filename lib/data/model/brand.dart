import '../../domain/entity/brand_entity.dart';

class Brand extends BrandEntity {
  late int id;
  final String name;

  Brand({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Brand.toFromMap(Map<String, dynamic> json) {
    return Brand(name: json['name']);
  }
}
