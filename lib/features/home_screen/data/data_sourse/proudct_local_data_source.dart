import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/entities/proudct.dart';

class ProductLocalDataSource {
  Future<ProductListModel> getProductListFromJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonResponse = json.decode(jsonString);
    return ProductListModel.fromJson(jsonResponse);
  }
}
