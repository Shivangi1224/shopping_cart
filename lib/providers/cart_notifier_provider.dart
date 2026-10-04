// Notifier provider: user action pe kuch kaam karna (event pe do some work)
// for example: user clicks a button
// Add items to cart or remove items from cart (user events)

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/models/product.dart';

class CartNotifier extends Notifier<Set<Product>>{
  // initial value
  @override
  Set<Product> build(){
    return {
      const Product(id: '6', title: 'Sneakers', price: 81, image: 'assets/products/sneakers.png'),
      // This means the cart contains only one product
    };
  }

  // methods to update the state
}
// CartNotifier is NOT a provider in itself we will make a notifier provider
// which will use this class to provide the state that we will define here

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() { // provided two types in genric
  return CartNotifier();
});