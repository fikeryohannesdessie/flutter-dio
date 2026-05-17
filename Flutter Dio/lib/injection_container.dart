import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../core/network/dio_client.dart';
import '../features/posts/data/datasources/post_remote_datasource.dart';
import '../features/posts/data/repositories/post_repository_impl.dart';
import '../features/posts/domain/repositories/post_repository.dart';
import '../features/posts/domain/usecases/post_usecases.dart';
import '../features/posts/presentation/bloc/post_bloc.dart';

final sl = GetIt.instance;

void setupInjection() {
  // Network
  sl.registerLazySingleton<Dio>(() => DioClient.instance.dio);

  // Data sources
  sl.registerLazySingleton(() => ProductRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => GetProductById(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // Bloc
  sl.registerFactory(
    () => ProductBloc(
      getProducts: sl(),
      createProduct: sl(),
      updateProduct: sl(),
      deleteProduct: sl(),
    ),
  );
}
