import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/providers/cart_notifier_provider.dart';
import '../../providers/products_provider.dart';

// Now Converting StateFulWidget to ConsumerStateFulWidget
// ConsumerStateFulWidget -> (ONLY USED FOR STATEFUL WIDGET)

// in this we automatically get access to ref without writing it as an argument in the build method

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    // now we can use ref object inside thr build method

    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Your Cart',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Poppins',
            height: 1,
          ),
        ),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) { // map -> returns widget tree for each product (it is a iterable)
                // for every product return a container:
                return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Image.asset(product.image, width: 60, height: 60,),
                        const SizedBox(width: 10,),
                        Text(
                            '${product.title}...',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1,
                            fontSize: 20,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                            '₹${product.price}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              height: 0.5,
                              fontSize: 16,
                            ),
                        ),
                      ],
                    ),
                );
              }).toList(),
               // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}