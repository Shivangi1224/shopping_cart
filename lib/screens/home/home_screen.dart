import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/providers/cart_notifier_provider.dart';
import 'package:shopping_cart/providers/products_provider.dart';
import '../../shared/cart_icon.dart';

// Consumer Widget is used when we have StateLess Widget that wants to consume some provider states
// ConsumerWidget -> (ONLY USED FOR STATELESS WIDGET)

// for StateFul widget which needs to consume provider state we use ConsumerStateFulWidget
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef -> through ref object we can use different methods to do things like

    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    // WATCH PROVIDER:
    // read provider data, watch provider data, get the updated data, refresh the provider state
     // read the data once for us and then watches the changes
    // if the data ever gets changed it will force the build method to rerun and get that
    // updated value for us

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Treasure Cart',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            height: 0.5,
            fontFamily: 'Poppins',
          ),
        ),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            // childAspectRatio: 0.9,
            mainAxisExtent: 250,
          ),
          itemBuilder:(context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withValues(alpha: 0.05),
              child: Column(
                children: [
                  Image.asset( // to display the image
                    allProducts[index].image,
                    width: 75,
                    height: 75,
                  ),

                  SizedBox(height: 10,),

                  Text( // to display the name of the product
                      allProducts[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      height: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text( // to display the price of the product
                    '₹${allProducts[index].price}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      height: 0.5,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 5,),
                  if(cartProducts.contains(allProducts[index])) // means cart already contains the product.
                    TextButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier)
                            .removeProduct(allProducts[index]);
                      },
                      child: const Text(
                          'Remove',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),

                  SizedBox(height: 5,),
                  if(!cartProducts.contains(allProducts[index])) // means cart already contains the product.
                    TextButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier)
                        .addProduct(allProducts[index]);// read() method when we need to access any method in the notifier
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// how to consume a provider inside a StateLess Widget:
// By extending ConsumerWidget instead of StateLess Widget that allows us to access
// ref as a second argument inside build method.