import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/post_usecases.dart';
import 'post_event.dart';
import 'post_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProducts;
  final CreateProduct _createProduct;
  final UpdateProduct _updateProduct;
  final DeleteProduct _deleteProduct;

  List<Product> _cached = [];

  ProductBloc({
    required GetProducts getProducts,
    required CreateProduct createProduct,
    required UpdateProduct updateProduct,
    required DeleteProduct deleteProduct,
  })  : _getProducts = getProducts,
        _createProduct = createProduct,
        _updateProduct = updateProduct,
        _deleteProduct = deleteProduct,
        super(const ProductInitial()) {
    on<LoadProducts>(_onLoad);
    on<AddProduct>(_onAdd);
    on<EditProduct>(_onEdit);
    on<RemoveProduct>(_onRemove);
  }

  Future<void> _onLoad(LoadProducts event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      _cached = await _getProducts();
      emit(ProductLoaded(_cached));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onAdd(AddProduct event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      final created = await _createProduct(
        title: event.title,
        description: event.description,
        price: event.price,
        category: event.category,
      );
      _cached = [created, ..._cached];
      emit(ProductActionSuccess(message: 'Product added!', products: _cached));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onEdit(EditProduct event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      final updated = await _updateProduct(event.product);
      _cached = _cached.map((p) => p.id == updated.id ? updated : p).toList();
      emit(ProductActionSuccess(message: 'Product updated!', products: _cached));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onRemove(RemoveProduct event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      await _deleteProduct(event.id);
      _cached = _cached.where((p) => p.id != event.id).toList();
      emit(ProductActionSuccess(message: 'Product deleted!', products: _cached));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
