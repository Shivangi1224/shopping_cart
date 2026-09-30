/*
starting 1 min ka write
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/models/product.dart';

const List<Product> allProducts = [
  Product(id: '1', title: 'Ear Buds', price: 343, image: 'assets/products/earbuds.png'),
  Product(id: '2', title: 'Headphones', price: 78, image: 'assets/products/headphones.png'),
  Product(id: '3', title: 'Yellow Hoodie', price: 189, image: 'assets/products/hoodie.png'),
  Product(id: '4', title: 'Denim Jeans', price: 32, image: 'assets/products/jeans.png'),
  Product(id: '5', title: 'Smartwatch', price: 134, image: 'assets/products/smartwatch.png'),
  Product(id: '6', title: 'Sneakers', price: 81, image: 'assets/products/sneakers.png'),
  Product(id: '7', title: 'Wrist watch', price: 45, image: 'assets/products/watch.png'),
  Product(id: '8', title: 'Water Bottle', price: 23, image: 'assets/products/waterbottle.png'),
];

// make a provider which can provide this data to the widgets within the application

final productsProvider = Provider((ref) {
  return allProducts;
}); // provider 1 -> provides all products

final reducedProducts = Provider((ref) {
  return allProducts.where((p) => p.price < 150).toList();
}); // provider 2 -> provides products which has price less than 150