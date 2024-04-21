import 'package:ecommerce_application_with_flutter_firebase_bloc/models/cart_model.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/models/models.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CartScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3!,
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add \$20.0 for FREE Delivery',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(),
                                elevation: 0),
                            child: Text(
                              'Add More Items',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CartProductCard(product: Cart.products[index]);
                        },
                        itemCount: Cart.products.length,
                      ),
                    ),
                  ],
                ),
                Column(children: [
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SUBTOTAL',
                                style: Theme.of(context).textTheme.headline5),
                            Text('\$5.9',
                                style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Deliver Fee',
                                style: Theme.of(context).textTheme.headline5),
                            Text('\$2.9',
                                style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white)),
                                    Text('\$8.8',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ])),
    );
  }
}
