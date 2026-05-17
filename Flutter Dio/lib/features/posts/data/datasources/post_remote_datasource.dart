import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../models/post_model.dart';

/// Remote data source for DummyJSON products via Dio.
class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get(
        ApiConstants.products,
        queryParameters: {'limit': 30, 'select': 'id,title,description,price,category,thumbnail'},
      );
      final list = (response.data['products'] as List<dynamic>);
      return list.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ServerFailure(_mapDioError(e));
    } catch (_) {
      throw const UnexpectedFailure('An unexpected error occurred.');
    }
  }

  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await _dio.get(ApiConstants.productById(id));
      return ProductModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerFailure(_mapDioError(e));
    } catch (_) {
      throw const UnexpectedFailure('An unexpected error occurred.');
    }
  }

  Future<ProductModel> createProduct({
    required String title,
    required String description,
    required double price,
    required String category,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.productsAdd,
        data: {
          'title': title,
          'description': description,
          'price': price,
          'category': category,
          'thumbnail': 'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
        },
      );
      return ProductModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerFailure(_mapDioError(e));
    } catch (_) {
      throw const UnexpectedFailure('An unexpected error occurred.');
    }
  }

  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      final response = await _dio.put(
        ApiConstants.productById(product.id),
        data: {
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'category': product.category,
        },
      );
      return ProductModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerFailure(_mapDioError(e));
    } catch (_) {
      throw const UnexpectedFailure('An unexpected error occurred.');
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _dio.delete(ApiConstants.productById(id));
    } on DioException catch (e) {
      throw ServerFailure(_mapDioError(e));
    } catch (_) {
      throw const UnexpectedFailure('An unexpected error occurred.');
    }
  }

  String _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Connection timed out. Please check your internet.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        return 'Server error (code: $code).';
      default:
        return e.message ?? 'Network error.';
    }
  }
}
