part of 'product_bloc.dart';


@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<SushiModel> products;
  ProductSuccess({required this.products});
}

final class ProductFailure extends ProductState {
  final String errorMessage;
  ProductFailure({required this.errorMessage});
  }

