import 'package:flutter/material.dart';
import 'package:week_05/task-02/model/product_model.dart';

class ProductProviders extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: "Laptop", price: 1000),
    Product(name: "Mobile", price: 2000),
    Product(name: "Charger", price: 500),
  ];

  List<Product> get products => _products;
}
