import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';

import '../../models/models.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WishlistScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CostumNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.2,
        ),
        itemCount: Product.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: Product.products[index],
              widthFactor: 1.1,
            ),
          );
        },
      ),
    );
  }
}
