import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/blocs/wishlist_bloc.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Wishlist'),
      bottomNavigationBar: CostumNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is Wishlistloading) {
            print('wishlist is loading');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is Wishlistloaded) {
            print("wishlist is loaded");
            print(
                "Number of products in wishlist: ${state.wishlist.products.length}");

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: state.wishlist.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("Building ProductCard for product at index $index");
                      return ProductCard(
                        product: state.wishlist.products[index],
                        widthFactor: 1.1,
                        leftposition: 180,
                        isWishlist: true,
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            print('unexpected problem in wishlist');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
