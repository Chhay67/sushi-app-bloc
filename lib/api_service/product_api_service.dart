import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sushi_app/models/sushi_model.dart';

abstract interface class ProductApiService {
  Future<List<SushiModel>> getProducts();
}

class ProductApiServiceImpl implements ProductApiService {
  @override
  Future<List<SushiModel>> getProducts() async {
    try {
      /// getting product data from products json file
      final res = await rootBundle.loadString('assets/dummy_data/products.json');

      /// decode products string to list;
      final result = json.decode(res);

      ///covert json list to list<SushiModel>
      return List<SushiModel>.from(result['products'].map((product) => SushiModel.fromJson(product)));
    } catch (error) {
      rethrow;
    }
  }
}
