import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.ratings,
    required this.price,
    required this.description,
    required this.images,
    required this.reviews,
  });

  const Product.empty()
      : this(
          name: 'Jordan 1 Retri',
          ratings: 4,
          price: 0.0,
          description: 'This is description',
          images: const [""],
          reviews: const [{}],
        );
  final double? ratings;
  final String name;
  final double? price;
  final String? description;
  final List<String>? images;
  final List<Map>? reviews;

  @override
  List<Object?> get props =>
      [name, price, ratings, description, images, reviews];
}
