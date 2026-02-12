import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_05/task-02/providers/cart_providers.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Consumer<CartProviders>(
        builder: (_, cartProvider, __) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cart.length,
                itemBuilder: (_, index) {
                  final item = cartProvider.cart[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => cartProvider.removeFromCart(item),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Total: \$${cartProvider.totalPrice}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
