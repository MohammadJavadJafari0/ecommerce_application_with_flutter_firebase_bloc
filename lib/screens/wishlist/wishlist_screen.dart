import 'package:ecommerce_application_with_flutter_firebase_bloc/blocs/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WishlistScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    print('WishlistScreen build method called');
    return Scaffold(
      appBar: CustomAppbar(title: 'Wishlist'),
      bottomNavigationBar: CostumNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is Wishlistloading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        ;
        if (state is Wishlistloaded) {
          return GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.4,
            ),
            itemCount: state.wishlist.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  product: state.wishlist.products[index],
                  widthFactor: 1.1,
                  leftPosition: 100,
                  isWishlist: true,
                ),
              );
            },
          );
        } else {
          return Text('Something went wrong');
        }
      }),
    );
  }
}
