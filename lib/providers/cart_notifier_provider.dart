// Notifier provider: user action pe kuch kaam karna (event pe do some work)
// for example: user clicks a button
// Add items to cart or remove items from cart (user events)

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier_provider.g.dart';

class CartNotifier extends Notifier<Set<Product>>{
  // initial value
  @override
  Set<Product> build(){
    return {};
  }

  // methods to update the state
  void addProduct(Product product) {
    if(!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product){
    if(state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

}
// CartNotifier is NOT a provider in itself we will make a notifier provider
// which will use this class to provide the state that we will define here

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() { // provided two types in genric
  return CartNotifier();
});

// dependent provider
@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;
  for(Product product in cartProducts) {
    total = total + product.price;
  }

  return total;
}