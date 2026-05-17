import '../../domain/entities/post.dart';

/// Data Transfer Object for Product — handles JSON serialization/deserialization.
class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.category,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'thumbnail': thumbnail,
    };
  }

  factory ProductModel.fromEntity(Product p) {
    return ProductModel(
      id: p.id,
      title: p.title,
      description: p.description,
      price: p.price,
      category: p.category,
      thumbnail: p.thumbnail,
    );
  }
}
