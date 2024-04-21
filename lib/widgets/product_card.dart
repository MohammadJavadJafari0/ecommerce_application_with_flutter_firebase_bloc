import 'package:ecommerce_application_with_flutter_firebase_bloc/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    required this.leftPosition,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 105,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            bottom: 12,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 15 - leftPosition,
              height: 88,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      // Expanded for flexibility
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ))),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )))
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
