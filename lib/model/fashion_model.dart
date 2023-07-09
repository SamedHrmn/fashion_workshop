import 'package:json_annotation/json_annotation.dart';

part 'fashion_model.g.dart';

@JsonSerializable()
class FashionModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  factory FashionModel.fromJson(Map<String, dynamic> json) => _$FashionModelFromJson(json);

  FashionModel({this.id, this.title, this.price, this.description, this.category, this.image, this.rating});
}

@JsonSerializable()
class Rating {
  final double? rate;
  final int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
