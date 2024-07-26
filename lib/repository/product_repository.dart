import 'package:dartz/dartz.dart';
import 'package:sushi_app/api_service/product_api_service.dart';
import 'package:sushi_app/core/error/failure.dart';
import 'package:sushi_app/models/sushi_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<SushiModel>>> getProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService productApiService;
  ProductRepositoryImpl({required this.productApiService});

  @override
  Future<Either<Failure, List<SushiModel>>> getProducts() async {
    try {
      final res = await productApiService.getProducts();

      return Right(res);
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
