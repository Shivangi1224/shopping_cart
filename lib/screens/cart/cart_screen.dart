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
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Your Cart',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            height: 0.5,
            fontFamily: 'Poppins',
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
              }).toList(), // output cart products here
            ),
            // output totals here
            Text(
              'Total Price',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '₹$total',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}