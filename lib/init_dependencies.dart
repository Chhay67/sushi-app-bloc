import 'package:get_it/get_it.dart';
import 'package:sushi_app/api_service/product_api_service.dart';
import 'package:sushi_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:sushi_app/repository/product_repository.dart';

import 'bloc/product_bloc/product_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  /// register all factory
  serviceLocator.registerFactory<ProductApiService>(() => ProductApiServiceImpl());
  serviceLocator.registerFactory<ProductRepository>(() => ProductRepositoryImpl(productApiService:serviceLocator()));

  /// register all lazySingleTon
  // [ProductBloc]
  serviceLocator.registerLazySingleton(() => ProductBloc(productRepository: serviceLocator()));
  // [CartBloc]
  serviceLocator.registerLazySingleton(() => CartBloc());
}
