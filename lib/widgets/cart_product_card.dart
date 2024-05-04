import 'package:ecommerce_application_with_flutter_firebase_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      '\$${product.price}',
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(width: 10),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartProductRemoved(product: product));
                  },
                  icon: Icon(Icons.remove_circle)),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartProductAdded(product: product));
                  },
                  icon: Icon(Icons.add_circle))
            ],
          )
        ],
      ),
    );
  }
}
