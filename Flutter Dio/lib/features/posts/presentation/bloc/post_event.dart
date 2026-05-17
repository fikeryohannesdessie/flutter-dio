import 'package:equatable/equatable.dart';
import '../../domain/entities/post.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {
  const LoadProducts();
}

class AddProduct extends ProductEvent {
  final String title;
  final String description;
  final double price;
  final String category;

  const AddProduct({
    required this.title,
    required this.description,
    required this.price,
    required this.category,
  });

  @override
  List<Object?> get props => [title, description, price, category];
}

class EditProduct extends ProductEvent {
  final Product product;
  const EditProduct(this.product);
  @override
  List<Object?> get props => [product];
}

class RemoveProduct extends ProductEvent {
  final int id;
  const RemoveProduct(this.id);
  @override
  List<Object?> get props => [id];
}
