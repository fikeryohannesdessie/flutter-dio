import '../../domain/entities/post.dart';

/// Abstract contract for the product repository.
abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
  Future<Product> createProduct({
    required String title,
    required String description,
    required double price,
    required String category,
  });
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(int id);
}
