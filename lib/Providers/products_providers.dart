import 'package:flutter/cupertino.dart';

import '../Models/products_models.dart';
import '../Services/product_Services.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  Future<void> getAll() async {
    products = await ProductService().getData();
    print(products);
    notifyListeners();
  }
}
