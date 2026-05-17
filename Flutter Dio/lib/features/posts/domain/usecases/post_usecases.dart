import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);
  Future<List<Product>> call() => repository.getProducts();
}

class GetProductById {
  final ProductRepository repository;
  GetProductById(this.repository);
  Future<Product> call(int id) => repository.getProductById(id);
}

class CreateProduct {
  final ProductRepository repository;
  CreateProduct(this.repository);
  Future<Product> call({
    required String title,
    required String description,
    required double price,
    required String category,
  }) =>
      repository.createProduct(
        title: title,
        description: description,
        price: price,
        category: category,
      );
}

class UpdateProduct {
  final ProductRepository repository;
  UpdateProduct(this.repository);
  Future<Product> call(Product product) => repository.updateProduct(product);
}

class DeleteProduct {
  final ProductRepository repository;
  DeleteProduct(this.repository);
  Future<void> call(int id) => repository.deleteProduct(id);
}
