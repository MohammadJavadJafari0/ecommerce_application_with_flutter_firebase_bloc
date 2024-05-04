import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/blocs/wishlist_bloc.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
        builder: (_) => ProductScreen(product: product),
        settings: RouteSettings(name: routeName));
  }

  final Product product;
  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      print('Add to Wishlist button pressed');
                      context
                          .read<WishlistBloc>()
                          .add(AddWishListProduct(product: product));
                      final snackBar =
                          SnackBar(content: Text('Added to your Wishlist!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ));
              }),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductAdded(product: product));
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text(
                        'ADD TO CART',
                        style: Theme.of(context).textTheme.headline3!,
                      ));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard.fromProduct(product: product) ?? Text('Nothing'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CartLoaded) {
                    return Expanded(
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product: product));
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            )));
                  } else {
                    return Text('Something went wrong');
                  }
                }),
                // isWishlist
                //     ? Expanded(
                //         child: IconButton(
                //             onPressed: () {},
                //             icon: Icon(
                //               Icons.delete,
                //               color: Colors.white,
                //             )))
                //     : SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'This is a product with high quality.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'This is a product with high quality.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
