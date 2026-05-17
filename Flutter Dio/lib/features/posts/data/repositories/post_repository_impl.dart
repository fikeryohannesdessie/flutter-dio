import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_datasource.dart';
import '../models/post_model.dart';

/// Concrete implementation of [ProductRepository].
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;

  ProductRepositoryImpl(this._remote);

  @override
  Future<List<Product>> getProducts() => _remote.getProducts();

  @override
  Future<Product> getProductById(int id) => _remote.getProductById(id);

  @override
  Future<Product> createProduct({
    required String title,
    required String description,
    required double price,
    required String category,
  }) =>
      _remote.createProduct(
        title: title,
        description: description,
        price: price,
        category: category,
      );

  @override
  Future<Product> updateProduct(Product product) =>
      _remote.updateProduct(ProductModel.fromEntity(product));

  @override
  Future<void> deleteProduct(int id) => _remote.deleteProduct(id);
}
