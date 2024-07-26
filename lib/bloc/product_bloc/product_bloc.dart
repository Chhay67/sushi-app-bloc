import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sushi_model.dart';
import '../../repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<GetProductsEvent>(_getProducts);
  }
  Future<void> _getProducts(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final res = await productRepository.getProducts();
    res.fold(
        (failure) => emit(ProductFailure(errorMessage: failure.toString())),
        (products) => emit(ProductSuccess(products: products)));
  }
}
