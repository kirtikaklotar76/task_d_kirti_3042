import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_d_kirti_3042/helpers/products_helper.dart';
import 'package:task_d_kirti_3042/modals/products.dart';

class ProductController extends ChangeNotifier {
  List<ProductModal> allProducts = <ProductModal>[];
  Future<List<ProductModal>> getAllProducts() async {
    allProducts = (await ProductsHelper.productsHelper.getProducts())!;
    log("$allProducts");
    return allProducts;
    notifyListeners();
  }
}
