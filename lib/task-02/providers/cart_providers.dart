import 'package:flutter/material.dart';
import 'package:week_05/task-02/model/product_model.dart';

class CartProviders extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  double get totalPrice => _cart.fold(0, (sum, item) => sum + item.price);
}
