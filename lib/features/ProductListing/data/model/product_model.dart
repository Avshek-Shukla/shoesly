import 'dart:convert';

import 'package:shoesly/features/ProductListing/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.name,
    required super.description,
    required super.price,
    required super.images,
    required super.ratings,
    required super.reviews,
  });

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  ProductModel.fromMap(Map<String, dynamic> map)
      : this(
          name: map['name'] as String,
          description: map['description'] as String,
          price: (map['price']).toDouble() as double? ?? 0,
          ratings: (map['ratings']).toDouble() as double? ?? 0,
          images:
              List<String>.from(map['images'] as List) as List<String>? ?? [],
          reviews: List<Map<String, dynamic>>.from(map['reviews'] as List)
                  as List<Map<String, dynamic>>? ??
              [],
        );
  // factory ProductModel.fromCache(String source) =>
  //     ProductModel.fromCacheMap(jsonDecode(source) as Map<String, dynamic>);
  // ProductModel.fromCacheMap(Map<String, dynamic> map)
  //     : this(
  //         id: map['id'] as String,
  //         token: map['token'] as String,
  //         email: map['email'] as String,
  //         name: map['name'] as String?,
  //         username: map['username'] as String?,
  //         gender: map['gender'] as String?,
  //         bio: map['bio'] as String?,
  //         coverImg: map['coverImg'] as String?,
  //         profileImg: map['profileImg'] as String?,
  //         isProfileCompleted: map['isProfileCompleted'] as bool? ?? false,
  //       );

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'image': images,
        'price': price,
        'rating': ratings,
        'reviews': reviews
      };

  String toJson() => jsonEncode(toMap());
}
