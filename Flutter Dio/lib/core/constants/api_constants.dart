/// API base URL and endpoint constants for DummyJSON.
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://dummyjson.com';

  static const String products = '/products';
  static const String productsAdd = '/products/add';

  static String productById(int id) => '/products/$id';
}
