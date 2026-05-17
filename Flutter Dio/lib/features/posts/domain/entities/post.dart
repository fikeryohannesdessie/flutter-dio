import 'package:equatable/equatable.dart';

/// Domain entity representing a Product.
class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String thumbnail;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.thumbnail,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? category,
    String? thumbnail,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [id, title, description, price, category, thumbnail];
}
